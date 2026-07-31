import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';
import 'package:tokenzyme_mobile/utils/blockchain.dart';
import 'package:url_launcher/link.dart';

class AccountBadge extends StatelessWidget {
  final String address;

  const AccountBadge({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor() {
      String hex = formatAccountAddress(address).padRight(6, '0');
      return Color(int.parse('FF$hex', radix: 16));
    }

    Color getTextColor() {
      Color bgColor = getBackgroundColor();

      int r = (bgColor.r * 255).round() & 0xff;
      int g = (bgColor.g * 255).round() & 0xff;
      int b = (bgColor.b * 255).round() & 0xff;

      double yiq = (r * 299 + g * 587 + b * 114) / 1000;
      return yiq >= 128 ? Colors.black : Colors.white;
    }

    return Card(
      color: getBackgroundColor(),
      child: Link(
        uri: Uri.parse(getAddressUrl(address)),
        builder: (_, FollowLink? followLink) => formatAccountAddress(address)
            .text(color: getTextColor())
            .paddingSymmetric(horizontal: AppPadding.sm)
            .tappable(customBorder: CircleBorder(), onPressed: followLink),
      ),
    );
  }
}
