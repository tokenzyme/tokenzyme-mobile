import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/providers/providers.dart';
import 'package:tokenzyme_mobile/utils/storage.dart';

class ThemeDialog extends ConsumerWidget {
  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ThemeMode> themeAsyncValue = ref.watch(themeProvider);

    void handleThemePressed(ThemeMode theme) async {
      await saveTheme(theme);
      ref.invalidate(themeProvider);
      if (context.mounted) {
        context.pop();
      }
    }

    if (themeAsyncValue.isLoading || themeAsyncValue.hasError) {
      return SizedBox.shrink();
    }

    return SimpleDialog(
      title: 'Choose theme'.text(),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () => handleThemePressed(ThemeMode.system),
          child: Row(
            children: <Widget>[
              Icon(
                HugeIcons.strokeRoundedSettings01,
                color: themeAsyncValue.requireValue == ThemeMode.system ? Colors.blue : null,
              ),
              AppPadding.md.widthBox,
              'System'.text(),
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: () => handleThemePressed(ThemeMode.light),
          child: Row(
            children: <Widget>[
              Icon(HugeIcons.strokeRoundedSun02,
                  color: themeAsyncValue.requireValue == ThemeMode.light ? Colors.blue : null),
              AppPadding.md.widthBox,
              'Light'.text(),
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: () => handleThemePressed(ThemeMode.dark),
          child: Row(
            children: <Widget>[
              Icon(HugeIcons.strokeRoundedMoon02,
                  color: themeAsyncValue.requireValue == ThemeMode.dark ? Colors.blue : null),
              AppPadding.md.widthBox,
              'Dark'.text(),
            ],
          ),
        ),
      ],
    );
  }
}
