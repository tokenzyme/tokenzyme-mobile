import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:tokenzyme_mobile/extensions/theme.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension ContextExtensions on BuildContext {
  void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

extension ThemeExtensions on BuildContext {
  AppThemeExtension get appTheme => Theme.of(this).extension<AppThemeExtension>()!;
}

extension TextThemeExtensions on BuildContext {
  TextStyle? get dialogTitle => textTheme.titleLarge;
}

extension ColorExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

extension AlertExtensions on BuildContext {
  void showInfo(String message, {Duration? duration}) {
    showTopSnackBar(
      Overlay.of(this),
      CustomSnackBar.info(backgroundColor: Colors.blue, message: message, maxLines: 3),
      displayDuration: duration ?? const Duration(seconds: 2),
    );
  }

  void showSuccess(String message, {Duration? duration}) {
    showTopSnackBar(
      Overlay.of(this),
      CustomSnackBar.success(backgroundColor: Colors.green, message: message, maxLines: 3),
      displayDuration: duration ?? const Duration(seconds: 2),
    );
  }

  void showWarning(String message, {Duration? duration}) {
    showTopSnackBar(
      Overlay.of(this),
      CustomSnackBar.info(
        backgroundColor: Colors.yellow.shade800,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        message: message,
        maxLines: 3,
      ),
      displayDuration: duration ?? const Duration(seconds: 2),
    );
  }

  void showError(String message, {Duration? duration}) {
    showTopSnackBar(
      Overlay.of(this),
      CustomSnackBar.error(backgroundColor: Colors.red, message: message, maxLines: 3),
      displayDuration: duration ?? const Duration(seconds: 2),
    );
  }
}
