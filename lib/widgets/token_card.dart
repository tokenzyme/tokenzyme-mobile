import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/app_radius.dart';
import 'package:tokenzyme_mobile/constants/icon_size.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';
import 'package:tokenzyme_mobile/utils/blockchain.dart';
import 'package:url_launcher/link.dart';

class TokenCard extends StatelessWidget {
  final ImageProvider logo;
  final String name;
  final String symbol;
  final String description;
  final String? websiteUrl;
  final String? xUrl;
  final String? telegramUrl;
  final String? discordUrl;
  final String? redditUrl;
  final String? facebookUrl;
  final String? instagramUrl;
  final String? address;

  const TokenCard({
    super.key,
    required this.logo,
    required this.name,
    required this.symbol,
    required this.description,
    required this.websiteUrl,
    required this.xUrl,
    required this.telegramUrl,
    required this.discordUrl,
    required this.redditUrl,
    required this.facebookUrl,
    required this.instagramUrl,
    this.address,
  });

  @override
  Widget build(BuildContext context) {
    void handleCopyAddressPressed() {
      Clipboard.setData(ClipboardData(text: address!));
      context.showInfo('Contract address copied to clipboard', duration: const Duration(milliseconds: 500));
    }

    return Card(
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
                  image: DecorationImage(image: logo, fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppPadding.md,
                children: <Widget>[
                  name.text(style: context.titleLarge, fontWeight: FontWeight.bold),
                  symbol.toUpperCase().text(color: context.colors.outline, fontWeight: FontWeight.bold),
                  Row(
                    spacing: AppPadding.sm,
                    children: <Widget>[
                      if (websiteUrl?.isNotEmpty == true)
                        Link(
                          uri: Uri.parse(websiteUrl!),
                          builder: (_, FollowLink? followLink) => Icon(
                            HugeIcons.strokeRoundedGlobe02,
                            size: IconSize.md,
                          ).tappable(customBorder: CircleBorder(), onPressed: followLink),
                        ),
                      if (xUrl?.isNotEmpty == true)
                        Link(
                          uri: Uri.parse(xUrl!),
                          builder: (_, FollowLink? followLink) => Icon(
                            HugeIcons.strokeRoundedNewTwitter,
                            size: IconSize.md,
                          ).tappable(customBorder: CircleBorder(), onPressed: followLink),
                        ),
                      if (telegramUrl?.isNotEmpty == true)
                        Link(
                          uri: Uri.parse(telegramUrl!),
                          builder: (_, FollowLink? followLink) => Icon(
                            HugeIcons.strokeRoundedTelegram,
                            size: IconSize.md,
                          ).tappable(customBorder: CircleBorder(), onPressed: followLink),
                        ),
                      if (discordUrl?.isNotEmpty == true)
                        Link(
                          uri: Uri.parse(discordUrl!),
                          builder: (_, FollowLink? followLink) => Icon(
                            HugeIcons.strokeRoundedDiscord,
                            size: IconSize.md,
                          ).tappable(customBorder: CircleBorder(), onPressed: followLink),
                        ),
                      if (redditUrl?.isNotEmpty == true)
                        Link(
                          uri: Uri.parse(redditUrl!),
                          builder: (_, FollowLink? followLink) => Icon(
                            HugeIcons.strokeRoundedReddit,
                            size: IconSize.md,
                          ).tappable(customBorder: CircleBorder(), onPressed: followLink),
                        ),
                      if (facebookUrl?.isNotEmpty == true)
                        Link(
                          uri: Uri.parse(facebookUrl!),
                          builder: (_, FollowLink? followLink) => Icon(
                            HugeIcons.strokeRoundedFacebook01,
                            size: IconSize.md,
                          ).tappable(customBorder: CircleBorder(), onPressed: followLink),
                        ),
                      if (instagramUrl?.isNotEmpty == true)
                        Link(
                          uri: Uri.parse(instagramUrl!),
                          builder: (_, FollowLink? followLink) => Icon(
                            HugeIcons.strokeRoundedInstagram,
                            size: IconSize.md,
                          ).tappable(customBorder: CircleBorder(), onPressed: followLink),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          description.text(),
          if (address != null) ...<Widget>[
            Divider(height: AppPadding.md),
            Row(
              spacing: AppPadding.md,
              children: <Widget>[
                'Contract address: ${formatAddress(address!)}'.text().expanded(),
                Icon(
                  HugeIcons.strokeRoundedCopy01,
                  size: IconSize.md,
                ).tappable(customBorder: CircleBorder(), onPressed: handleCopyAddressPressed),
                Link(
                  uri: Uri.parse(getAddressUrl(address!)),
                  builder: (_, FollowLink? followLink) => Icon(
                    HugeIcons.strokeRoundedLink02,
                    size: IconSize.md,
                  ).tappable(customBorder: CircleBorder(), onPressed: followLink),
                ),
              ],
            ),
          ],
        ],
      ).paddingAll(AppPadding.content),
    );
  }
}
