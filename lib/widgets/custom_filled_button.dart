import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';

class CustomFilledButton extends HookWidget {
  final String label;
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final Future<void> Function()? onPressedAsync;

  const CustomFilledButton({
    super.key,
    required this.label,
    this.style,
    this.onPressed,
    this.onPressedAsync,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isLoadingState = useState(false);

    void handleButtonPressed() async {
      if (onPressed != null) {
        onPressed!();
      }
      if (onPressedAsync != null) {
        try {
          isLoadingState.value = true;
          await onPressedAsync!();
        } finally {
          isLoadingState.value = false;
        }
      }
    }

    return FilledButton(
      style: style,
      onPressed: !isLoadingState.value ? handleButtonPressed : null,
      child: !isLoadingState.value
          ? label.text(fontSize: context.titleMedium?.fontSize).paddingVertical(10)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: AppPadding.md,
              children: <Widget>[
                CircularProgressIndicator(
                  color: context.colors.onSurface,
                  strokeWidth: 2,
                ).sizedBox(width: 16, height: 16),
                label.text(fontSize: context.titleMedium?.fontSize),
              ],
            ).paddingVertical(10),
    );
  }
}
