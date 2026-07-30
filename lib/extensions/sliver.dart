import 'package:flutter/material.dart';

extension SliverExtensions on Widget {
  SliverPadding sliverPaddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      SliverPadding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        sliver: this,
      );

  SliverPadding sliverPaddingAll(double value) => SliverPadding(
        padding: EdgeInsets.all(value),
        sliver: this,
      );

  SliverPadding sliverPaddingSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      SliverPadding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        sliver: this,
      );

  SliverFillRemaining sliverFillRemaining({bool hasScrollBody = false}) => SliverFillRemaining(
        hasScrollBody: hasScrollBody,
        child: this,
      );
}
