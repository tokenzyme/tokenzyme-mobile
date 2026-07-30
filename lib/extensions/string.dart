import 'package:flutter/material.dart';

extension StringExtensions on String {
  Text text({
    TextStyle? style,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? align,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
        style: style != null
            ? style.copyWith(fontSize: fontSize, fontWeight: fontWeight, color: color)
            : TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      );
}
