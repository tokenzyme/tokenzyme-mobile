import 'dart:async';
import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/icon_size.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/sliver.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';
import 'package:tokenzyme_mobile/graphql/schema.graphql.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/hooks/use_route_visibility.dart';
import 'package:tokenzyme_mobile/providers/providers.dart';
import 'package:tokenzyme_mobile/views/home/tabs/launchpad/token_summary_card.dart';
import 'package:tokenzyme_mobile/views/launch_token/launch_token.dart';
import 'package:tokenzyme_mobile/widgets/custom_filled_button.dart';

class Launchpad extends HookConsumerWidget {
  final int pageSize = 20;

  const Launchpad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double ethPrice = ref.watch(ethPriceProvider);

    ValueNotifier<Enum$TokenSortType> sortTypeState = useState(Enum$TokenSortType.NEW);
    ValueNotifier<bool> hasMoreState = useState(false);

    RouteVisibility? routeVisibility = useRouteVisibility(context);

    QueryHookResult<Query$ListTokens> listTokensQuery = useQuery$ListTokens(Options$Query$ListTokens(
      variables: Variables$Query$ListTokens(sortType: sortTypeState.value, pageSize: pageSize),
      onComplete: (Map<String, dynamic>? data, Query$ListTokens? parsedData) {
        if (parsedData != null) {
          hasMoreState.value = parsedData.tokens.length % pageSize == 0;
        }
      },
    ));

    void handleSortTypePressed(Enum$TokenSortType sortType) {
      hasMoreState.value = false;
      sortTypeState.value = sortType;
    }

    void handleLaunchTokenPressed() {
      context.push(LaunchToken());
    }

    Future<void> handleLoadMorePressed() async {
      QueryResult<Query$ListTokens> fetchMoreTokensResult = await listTokensQuery.fetchMore(
        FetchMoreOptions$Query$ListTokens(
          variables: Variables$Query$ListTokens(
            sortType: sortTypeState.value,
            pageSize: pageSize,
            lastTokenAddress: listTokensQuery.result.parsedData?.tokens.last.address,
          ),
          updateQuery: (
            Map<String, dynamic>? previousResultData,
            Map<String, dynamic>? fetchMoreResultData,
          ) =>
              <String, dynamic>{
            ...?previousResultData,
            'tokens': <dynamic>[
              ...previousResultData?['tokens'],
              ...fetchMoreResultData?['tokens'],
            ]
          },
        ),
      );
      if (fetchMoreTokensResult.hasException) {
        if (context.mounted) {
          context.showError('Error loading more tokens');
        }
        return;
      }
    }

    useEffect(() {
      Timer timer = Timer.periodic(const Duration(seconds: 10), (_) async {
        if (routeVisibility != RouteVisibility.visible) {
          return;
        }
        await listTokensQuery.fetchMore(
          FetchMoreOptions$Query$ListTokens(
            variables: Variables$Query$ListTokens(
              sortType: sortTypeState.value,
              pageSize:
                  max(pageSize, ((listTokensQuery.result.parsedData?.tokens.length ?? 0) / pageSize).ceil() * pageSize),
            ),
            updateQuery: (
              Map<String, dynamic>? previousResultData,
              Map<String, dynamic>? fetchMoreResultData,
            ) =>
                fetchMoreResultData,
          ),
        );
      });
      return timer.cancel;
    }, <dynamic>[]);

    if (listTokensQuery.result.isLoading && listTokensQuery.result.data == null) {
      return CircularProgressIndicator().toCenter();
    }

    if (listTokensQuery.result.hasException) {
      return 'An unexpected error occurred. Please try again!'
          .text(style: context.headlineSmall, align: TextAlign.center)
          .toCenter()
          .paddingAll(AppPadding.content);
    }

    List<Query$ListTokens$tokens> tokens = listTokensQuery.result.parsedData!.tokens;

    return CustomScrollView(
      slivers: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: AppPadding.md,
            children: <Widget>[
              if (sortTypeState.value == Enum$TokenSortType.NEW)
                FilledButton.icon(
                  label: 'New'.text(),
                  icon: Icon(HugeIcons.strokeRoundedEye),
                  onPressed: () => handleSortTypePressed(Enum$TokenSortType.NEW),
                )
              else
                OutlinedButton.icon(
                  label: 'New'.text(),
                  icon: Icon(HugeIcons.strokeRoundedEye),
                  onPressed: () => handleSortTypePressed(Enum$TokenSortType.NEW),
                ),
              if (sortTypeState.value == Enum$TokenSortType.PROGRESS)
                FilledButton.icon(
                  label: 'Progress'.text(),
                  icon: Icon(HugeIcons.strokeRoundedTradeUp),
                  onPressed: () => handleSortTypePressed(Enum$TokenSortType.PROGRESS),
                )
              else
                OutlinedButton.icon(
                  label: 'Progress'.text(),
                  icon: Icon(HugeIcons.strokeRoundedTradeUp),
                  onPressed: () => handleSortTypePressed(Enum$TokenSortType.PROGRESS),
                ),
              if (sortTypeState.value == Enum$TokenSortType.PROMOTED)
                FilledButton.icon(
                  label: 'Promoted'.text(),
                  icon: Icon(HugeIcons.strokeRoundedRocket01),
                  onPressed: () => handleSortTypePressed(Enum$TokenSortType.PROMOTED),
                )
              else
                OutlinedButton.icon(
                  label: 'Promoted'.text(),
                  icon: Icon(HugeIcons.strokeRoundedRocket01),
                  onPressed: () => handleSortTypePressed(Enum$TokenSortType.PROMOTED),
                ),
            ],
          ),
        ).sliver,
        AppPadding.content.heightBox.sliver,
        if (tokens.isEmpty)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppPadding.content,
            children: <Widget>[
              Icon(HugeIcons.strokeRoundedNeutral, size: IconSize.xl),
              'No tokens here yet'.text(style: context.headlineSmall),
              CustomFilledButton(
                label: 'Launch a Token',
                onPressed: handleLaunchTokenPressed,
              )
            ],
          ).sliverFillRemaining()
        else ...<Widget>[
          SliverList.separated(
            separatorBuilder: (_, __) => AppPadding.md.heightBox,
            itemCount: tokens.length,
            itemBuilder: (_, int index) => TokenSummaryCard(token: tokens[index], ethPrice: ethPrice),
          ),
          if (hasMoreState.value)
            CustomFilledButton(
              label: 'Load more',
              onPressedAsync: handleLoadMorePressed,
            ).paddingOnly(top: AppPadding.content).sliver,
          AppPadding.content.heightBox.sliver,
        ],
      ],
    ).paddingHorizontal(AppPadding.content).refreshIndicator(listTokensQuery.refetch);
  }
}
