import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timeago/timeago.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/icon_size.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/sliver.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';
import 'package:tokenzyme_mobile/graphql/schema.graphql.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/graphql/trade.graphql.dart';
import 'package:tokenzyme_mobile/hooks/models/trade.dart';
import 'package:tokenzyme_mobile/hooks/use_trades_event.dart';
import 'package:tokenzyme_mobile/utils/blockchain.dart';
import 'package:tokenzyme_mobile/utils/numbers.dart';
import 'package:tokenzyme_mobile/widgets/account_badge.dart';
import 'package:tokenzyme_mobile/widgets/custom_filled_button.dart';
import 'package:url_launcher/link.dart' as link;

class Trades extends HookConsumerWidget {
  final Query$GetToken$token token;

  final int pageSize = 15;

  const Trades({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> hasMoreState = useState(false);
    ValueNotifier<int> tradesCountState = useState(token.tradesCount);

    GraphQLClient gqlClient = useGraphQLClient();

    QueryHookResult<Query$ListTrades> listTradesQuery = useQuery$ListTrades(Options$Query$ListTrades(
      variables: Variables$Query$ListTrades(tokenAddress: token.address, pageSize: pageSize),
      onComplete: (Map<String, dynamic>? data, Query$ListTrades? parsedData) {
        if (parsedData != null) {
          hasMoreState.value = parsedData.trades.length % pageSize == 0;
        }
      },
    ));

    useTradesEvent(token.address, (Trade trade) {
      gqlClient.writeQuery$ListTrades(
        variables: Variables$Query$ListTrades(tokenAddress: token.address, pageSize: pageSize),
        data: Query$ListTrades(trades: <Query$ListTrades$trades>[
          Query$ListTrades$trades(
            id: trade.id,
            accountAddress: trade.accountAddress,
            type: trade.type,
            tokenAmount: trade.tokenAmount,
            ethAmount: trade.ethAmount,
            createdAt: trade.createdAt,
          ),
          ...?listTradesQuery.result.parsedData?.trades,
        ]),
      );
    });

    Future<void> handleLoadMorePressed() async {
      QueryResult<Query$ListTrades> fetchMoreTradesResult = await listTradesQuery.fetchMore(
        FetchMoreOptions$Query$ListTrades(
          variables: Variables$Query$ListTrades(
            tokenAddress: token.address,
            pageSize: pageSize,
            lastTradeId: listTradesQuery.result.parsedData?.trades.last.id,
          ),
          updateQuery: (
            Map<String, dynamic>? previousResultData,
            Map<String, dynamic>? fetchMoreResultData,
          ) =>
              <String, dynamic>{
            ...?previousResultData,
            'trades': <dynamic>[
              ...previousResultData?['trades'],
              ...fetchMoreResultData?['trades'],
            ]
          },
        ),
      );
      if (fetchMoreTradesResult.hasException) {
        if (context.mounted) {
          context.showError('Error loading more trades');
        }
        return;
      }
    }

    if (listTradesQuery.result.isLoading && listTradesQuery.result.data == null) {
      return CircularProgressIndicator().toCenter();
    }

    if (listTradesQuery.result.hasException) {
      return 'An unexpected error occurred. Please try again!'
          .text(style: context.headlineSmall, align: TextAlign.center)
          .toCenter()
          .paddingAll(AppPadding.content);
    }

    List<Query$ListTrades$trades> trades = listTradesQuery.result.parsedData!.trades;

    return CustomScrollView(
      slivers: <Widget>[
        AppPadding.content.heightBox.sliver,
        Row(
          spacing: AppPadding.md,
          children: <Widget>[
            'Trades'.text(style: context.titleLarge, fontWeight: FontWeight.w500),
            '(${tradesCountState.value})'.text(style: context.titleLarge, color: context.colors.outline),
          ],
        ).sliver,
        AppPadding.content.heightBox.sliver,
        if (trades.isEmpty)
          'No trades here yet'.text(style: context.headlineSmall).toCenter().sliverFillRemaining()
        else ...<Widget>[
          LayoutBuilder(
            builder: (_, BoxConstraints constraints) => Row(
              children: <Widget>[
                'Account'.text(fontWeight: FontWeight.bold).sizedBox(width: constraints.maxWidth * 0.2),
                'Type'.text(fontWeight: FontWeight.bold).sizedBox(width: constraints.maxWidth * 0.12),
                token.symbol.text(fontWeight: FontWeight.bold).alignAtCenterRight().expanded(),
                'S'.text(fontWeight: FontWeight.bold).alignAtCenterRight().expanded(),
                'Date'
                    .text(fontWeight: FontWeight.bold)
                    .alignAtCenterRight()
                    .sizedBox(width: constraints.maxWidth * 0.14),
                'Tx'
                    .text(fontWeight: FontWeight.bold)
                    .alignAtCenterRight()
                    .sizedBox(width: constraints.maxWidth * 0.08),
              ],
            ),
          ).sliver,
          AppPadding.content.heightBox.sliver,
          SliverList.separated(
            separatorBuilder: (_, __) => AppPadding.content.heightBox,
            itemCount: trades.length,
            itemBuilder: (_, int index) => LayoutBuilder(builder: (_, BoxConstraints constraints) {
              Query$ListTrades$trades trade = trades[index];
              return Container(
                padding: const EdgeInsets.only(bottom: AppPadding.content),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: context.colors.outlineVariant))),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        AccountBadge(address: trade.accountAddress),
                      ],
                    ).sizedBox(width: constraints.maxWidth * 0.2),
                    trade.type.name
                        .toLowerCase()
                        .text(color: trade.type == Enum$TradeType.BUY ? context.appTheme.buy : context.appTheme.sell)
                        .sizedBox(width: constraints.maxWidth * 0.12),
                    formatDecimal(trade.tokenAmount, pretty: true).text().alignAtCenterRight().expanded(),
                    formatDecimal(trade.ethAmount, pretty: true).text().alignAtCenterRight().expanded(),
                    format(trade.createdAt, locale: 'en_short')
                        .text()
                        .alignAtCenterRight()
                        .sizedBox(width: constraints.maxWidth * 0.14),
                    link.Link(
                      uri: Uri.parse(getTransactionUrl(trade.id)),
                      builder: (_, link.FollowLink? followLink) => Icon(
                        HugeIcons.strokeRoundedLink02,
                        size: IconSize.smAlt,
                      ).inkWell(customBorder: CircleBorder(), onPressed: followLink),
                    ).alignAtCenterRight().sizedBox(width: constraints.maxWidth * 0.08),
                  ],
                ),
              );
            }),
          ),
          if (trades.isNotEmpty && hasMoreState.value) ...<Widget>[
            AppPadding.content.heightBox.sliver,
            CustomFilledButton(
              label: 'Load more',
              onPressedAsync: handleLoadMorePressed,
            ).sliver
          ],
        ],
      ],
    ).paddingHorizontal(AppPadding.content).refreshIndicator(listTradesQuery.refetch);
  }
}
