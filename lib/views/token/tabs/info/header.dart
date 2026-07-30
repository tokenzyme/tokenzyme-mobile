import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/providers/providers.dart';
import 'package:tokenzyme_mobile/utils/numbers.dart';
import 'package:tokenzyme_mobile/widgets/account_badge.dart';

class Header extends HookConsumerWidget {
  final Query$GetToken$token token;

  const Header({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double? ethPrice = ref.watch(ethPriceProvider);

    String marketCap = useMemoized(
      () => formatDecimal(
        (token.price * token.totalSupply * Decimal.parse(ethPrice.toString())).round(),
      ),
      <dynamic>[token.price, ethPrice],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: AppPadding.content,
      children: <Widget>[
        'Market cap: \$$marketCap'.text(color: context.colors.tertiary),
        Row(
          spacing: AppPadding.sm,
          children: <Widget>[
            format(token.createdAt, locale: 'en_short_with_ago').text(),
            'by'.text(color: context.colors.outline),
            AccountBadge(address: token.creatorAddress),
          ],
        )
      ],
    );
  }
}
