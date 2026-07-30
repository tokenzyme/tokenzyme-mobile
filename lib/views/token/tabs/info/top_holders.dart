import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/utils/numbers.dart';
import 'package:tokenzyme_mobile/widgets/account_badge.dart';

class TopHolders extends HookConsumerWidget {
  final Query$GetToken$token token;

  const TopHolders({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    QueryHookResult<Query$ListTopHolders> listTopHoldersQuery = useQuery$ListTopHolders(Options$Query$ListTopHolders(
      variables: Variables$Query$ListTopHolders(tokenAddress: token.address),
    ));

    return Card(
      child: Builder(builder: (_) {
        if (listTopHoldersQuery.result.isLoading) {
          return CircularProgressIndicator().toCenter();
        }
        if (listTopHoldersQuery.result.hasException) {
          return 'An unexpected error occurred. Please try again!'.text(align: TextAlign.center).toCenter();
        }

        List<Query$ListTopHolders$topHolders> topHolders = listTopHoldersQuery.result.parsedData!.topHolders;
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppPadding.content,
          children: <Widget>[
            'Top Holders'.text(style: context.bodyLarge, fontWeight: FontWeight.bold),
            if (topHolders.isEmpty)
              'No holders here yet'.text(color: context.colors.outline).toCenter()
            else
              Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(40),
                },
                children: List<TableRow>.generate(topHolders.length, (int index) {
                  Query$ListTopHolders$topHolders topHolder = topHolders[index];
                  return TableRow(
                    decoration: BoxDecoration(),
                    children: <Widget>[
                      '#${index + 1}'.text(color: context.colors.outline).paddingVertical(AppPadding.md),
                      Row(
                        children: <Widget>[
                          AccountBadge(address: topHolder.accountAddress),
                        ],
                      ).paddingVertical(AppPadding.md),
                      formatDecimal(topHolder.balance, pretty: true)
                          .text(color: context.colors.outline)
                          .alignAtCenterRight()
                          .paddingVertical(AppPadding.md),
                      '${formatPercentage(topHolder.percentage)}%'
                          .text()
                          .alignAtCenterRight()
                          .paddingVertical(AppPadding.md),
                    ],
                  );
                }),
              )
          ],
        );
      }).paddingAll(AppPadding.content),
    );
  }
}
