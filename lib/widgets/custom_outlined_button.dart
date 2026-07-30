import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String label;
  final ButtonStyle? style;
  final VoidCallback? onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.label,
    this.style,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: style,
      onPressed: onPressed,
      child: label.text(fontSize: context.titleMedium?.fontSize).paddingVertical(10),
    );
  }
}
