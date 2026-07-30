import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/app_radius.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/providers/providers.dart';
import 'package:tokenzyme_mobile/utils/numbers.dart';

class ProgressInfo {
  final String ethReserve;
  final String tokenReserve;
  final String migrationMarketCap;
  final String percentage;
  final String? dexPoolAddress;

  ProgressInfo({
    required this.ethReserve,
    required this.tokenReserve,
    required this.migrationMarketCap,
    required this.percentage,
    required this.dexPoolAddress,
  });
}

class Progress extends HookConsumerWidget {
  final Query$GetToken$token token;

  const Progress({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double ethPrice = ref.watch(ethPriceProvider);

    ProgressInfo getProgressInfo(Query$GetToken$token token, double ethPrice) {
      Decimal migrationMarketCap = (token.finalPrice * token.totalSupply * Decimal.parse(ethPrice.toString())).round();
      double percentage = (1 - (token.reserve / token.bondingCurveSupply).toDouble()) * 100;
      return ProgressInfo(
        tokenReserve: formatDecimal(token.reserve),
        ethReserve: formatDecimal(token.ethReserve),
        migrationMarketCap: formatDecimal(migrationMarketCap),
        percentage: formatPercentage(percentage),
        dexPoolAddress: token.dexPoolAddress,
      );
    }

    ValueNotifier<ProgressInfo> progressInfoState = useState(getProgressInfo(token, ethPrice));

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppPadding.md,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              'Promotion Progress'.text(style: context.bodyLarge, fontWeight: FontWeight.bold),
              '${progressInfoState.value.percentage}%'.text(style: context.bodyLarge, fontWeight: FontWeight.bold),
            ],
          ),
          LinearProgressIndicator(
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.sm)),
            value: (double.tryParse(progressInfoState.value.percentage) ?? 0) / 100,
            minHeight: 12,
          ),
          'This token will be promoted to Shadow Exchange once all available tokens have been sold. At that point, the market cap will reach \$${progressInfoState.value.migrationMarketCap}.'
              .text(color: context.colors.outline),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              'Tokens available for sale: ${progressInfoState.value.tokenReserve}'.text(),
              'Amount of S collected: ${progressInfoState.value.ethReserve}'.text(),
            ],
          )
        ],
      ).paddingAll(AppPadding.content),
    );
  }
}
