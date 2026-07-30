import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timeago/timeago.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/app_radius.dart';
import 'package:tokenzyme_mobile/constants/icon_size.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/utils/numbers.dart';
import 'package:tokenzyme_mobile/views/token/token.dart';

class TokenSummaryCard extends HookWidget {
  final Query$ListTokens$tokens token;
  final double? ethPrice;

  const TokenSummaryCard({
    super.key,
    required this.token,
    required this.ethPrice,
  });

  @override
  Widget build(BuildContext context) {
    String marketCap = useMemoized(
      () => formatDecimal(
        (token.price * token.totalSupply * Decimal.parse(ethPrice.toString())).round(),
      ),
      <dynamic>[token.price, ethPrice],
    );

    double migrationPercentage = useMemoized(
      () => (1 - (token.reserve / token.bondingCurveSupply).toDouble()) * 100,
      <dynamic>[token.price, ethPrice],
    );

    void handleCardPressed() {
      context.push(Token(address: token.address));
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppPadding.md,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppPadding.content,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  image: DecorationImage(image: NetworkImage(token.logoUrl), fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppPadding.sm,
                children: <Widget>[
                  token.name.text(style: context.titleMedium, fontWeight: FontWeight.bold),
                  token.symbol.text(color: context.colors.outline, fontWeight: FontWeight.bold),
                  'Market cap: \$$marketCap'.text(color: context.colors.outline),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.all(Radius.circular(AppRadius.sm)),
                    value: migrationPercentage / 100,
                    minHeight: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: AppPadding.content,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            HugeIcons.strokeRoundedTradeUp,
                            size: IconSize.sm,
                            color: context.colors.outline,
                          ),
                          AppPadding.sm.widthBox,
                          token.tradesCount.toString().text(color: context.colors.outline),
                          AppPadding.md.widthBox,
                          Icon(
                            HugeIcons.strokeRoundedComment02,
                            size: IconSize.sm,
                            color: context.colors.outline,
                          ),
                          AppPadding.sm.widthBox,
                          token.commentsCount.toString().text(color: context.colors.outline),
                        ],
                      ),
                      format(token.createdAt, locale: 'en_short_with_ago').text(color: context.colors.outline),
                    ],
                  ),
                ],
              ).expanded(),
            ],
          ),
        ],
      ).paddingAll(AppPadding.content).inkWell(onPressed: handleCardPressed),
    );
  }
}
