import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  RefreshIndicator refreshIndicator(
    RefreshCallback onRefresh,
  ) =>
      RefreshIndicator(
        onRefresh: onRefresh,
        child: this,
      );

  SizedBox sizedBox({
    double? width,
    double? height,
  }) =>
      SizedBox(
        width: width,
        height: height,
        child: this,
      );

  InkWell tappable({
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    required VoidCallback? onPressed,
  }) =>
      InkWell(
        customBorder: customBorder,
        onTap: onPressed,
        child: this,
      );
}
