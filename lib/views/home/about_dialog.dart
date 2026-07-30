import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';

class AboutDialog extends StatelessWidget {
  final PackageInfo packageInfo;

  const AboutDialog({super.key, required this.packageInfo});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(AppPadding.content),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppPadding.md,
        children: <Widget>[
          'About'.text(style: context.dialogTitle),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppPadding.sm,
            children: <Widget>[
              'App version:'.text(style: context.bodyLarge),
              '${packageInfo.version}+${packageInfo.buildNumber}'
                  .text(style: context.bodyLarge, fontWeight: FontWeight.bold),
            ],
          ),
          'This app was developed by the Tokenzyme team. You can contact us through our support channel.'.text(),
        ],
      ).paddingAll(AppPadding.content),
    );
  }
}
