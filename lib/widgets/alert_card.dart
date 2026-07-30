import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';

enum AlertType { info, warning }

class AlertCard extends StatelessWidget {
  final String content;
  final AlertType alertType;
  final CrossAxisAlignment? crossAxisAlignment;

  const AlertCard({
    super.key,
    required this.content,
    this.alertType = AlertType.info,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = alertType == AlertType.warning ? Colors.yellow.shade800 : Colors.blue.shade700;
    Color textColor = alertType == AlertType.warning ? Colors.black : Colors.white;
    IconData iconData =
        alertType == AlertType.warning ? HugeIcons.strokeRoundedAlert02 : HugeIcons.strokeRoundedInformationCircle;

    return Card(
      color: bgColor,
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: <Widget>[
          Icon(iconData, color: textColor),
          AppPadding.md.widthBox,
          content.text(style: context.bodySmall, color: textColor).expanded(),
        ],
      ).paddingAll(AppPadding.content),
    );
  }
}
