import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/views/token/tabs/info/chart.dart';
import 'package:tokenzyme_mobile/views/token/tabs/info/header.dart';
import 'package:tokenzyme_mobile/views/token/tabs/info/progress.dart';
import 'package:tokenzyme_mobile/views/token/tabs/info/top_holders.dart';
import 'package:tokenzyme_mobile/views/token/tabs/info/trade/trade.dart';
import 'package:tokenzyme_mobile/widgets/token_card.dart';

class Info extends HookWidget {
  final Query$GetToken$token token;
  final RefreshCallback onRefresh;

  const Info({
    super.key,
    required this.token,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: AppPadding.content,
        children: <Widget>[
          Header(token: token),
          Chart(token: token),
          Trade(token: token),
          TokenCard(
            address: token.address,
            logo: NetworkImage(token.logoUrl),
            name: token.name,
            symbol: token.symbol,
            description: token.description,
            websiteUrl: token.websiteUrl,
            xUrl: token.socialMedia?.xUrl,
            telegramUrl: token.socialMedia?.telegramUrl,
            discordUrl: token.socialMedia?.discordUrl,
            redditUrl: token.socialMedia?.redditUrl,
            facebookUrl: token.socialMedia?.facebookUrl,
            instagramUrl: token.socialMedia?.instagramUrl,
          ),
          Progress(token: token),
          TopHolders(token: token),
        ],
      ).paddingAll(AppPadding.content),
    ).refreshIndicator(onRefresh);
  }
}
