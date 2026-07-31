import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/branding.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/utils/env.dart';
import 'package:tokenzyme_mobile/views/home/about_dialog.dart' as about_dialog;
import 'package:tokenzyme_mobile/views/home/theme_dialog.dart';
import 'package:tokenzyme_mobile/views/launch_token/launch_token.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends HookConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MainDrawer({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleLaunchTokenPressed() {
      context.push(LaunchToken());
    }

    void handleChangeThemePressed() {
      showDialog(
        context: context,
        builder: (_) => ThemeDialog(),
      );
    }

    void handleAboutPressed() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (_) => about_dialog.AboutDialog(packageInfo: packageInfo),
        );
      }
    }

    // Community links come from constants/branding.dart; the website is APP_URL.
    // Replace both when forking — see the note at the top of branding.dart.
    void handleXPressed() {
      launchUrl(Uri.parse(xUrl));
    }

    void handleTelegramPressed() {
      launchUrl(Uri.parse(telegramUrl));
    }

    void handleRedditPressed() {
      launchUrl(Uri.parse(redditUrl));
    }

    void handleWebsitePressed() {
      launchUrl(Uri.parse(getAppUrl()));
    }

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppPadding.content.heightBox,
            ListTile(
              leading: Icon(HugeIcons.strokeRoundedRocket01),
              title: 'Launch a Token'.text(),
              onTap: handleLaunchTokenPressed,
            ),
            Divider(),
            'Community'.text(style: context.titleMedium, color: context.colors.outline).paddingAll(AppPadding.content),
            if (xUrl.isNotEmpty)
              ListTile(
                leading: Icon(HugeIcons.strokeRoundedNewTwitter),
                title: 'X'.text(),
                onTap: handleXPressed,
              ),
            if (telegramUrl.isNotEmpty)
              ListTile(
                leading: Icon(HugeIcons.strokeRoundedTelegram),
                title: 'Telegram'.text(),
                onTap: handleTelegramPressed,
              ),
            if (redditUrl.isNotEmpty)
              ListTile(
                leading: Icon(HugeIcons.strokeRoundedReddit),
                title: 'Reddit'.text(),
                onTap: handleRedditPressed,
              ),
            ListTile(
              leading: Icon(HugeIcons.strokeRoundedGlobe02),
              title: 'Website'.text(),
              onTap: handleWebsitePressed,
            ),
            Divider(),
            if (telegramUrl.isNotEmpty)
              ListTile(
                leading: Icon(HugeIcons.strokeRoundedCustomerSupport),
                title: 'Support channel'.text(),
                onTap: handleTelegramPressed,
              ),
            ListTile(
              leading: Icon(HugeIcons.strokeRoundedPaintBucket),
              title: 'Change theme'.text(),
              onTap: handleChangeThemePressed,
            ),
            ListTile(
              leading: Icon(HugeIcons.strokeRoundedInformationCircle),
              title: 'About'.text(),
              onTap: handleAboutPressed,
            ),
          ],
        ),
      ),
    );
  }
}
