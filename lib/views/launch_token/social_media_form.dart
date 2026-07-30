import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/widgets/custom_filled_button.dart';
import 'package:tokenzyme_mobile/widgets/custom_outlined_button.dart';

class SocialMediaForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController xUrlController;
  final TextEditingController telegramUrlController;
  final TextEditingController discordUrlController;
  final TextEditingController redditUrlController;
  final TextEditingController facebookUrlController;
  final TextEditingController instagramUrlController;
  final VoidCallback onContinuePressed;
  final VoidCallback onBackPressed;

  const SocialMediaForm({
    super.key,
    required this.formKey,
    required this.xUrlController,
    required this.telegramUrlController,
    required this.discordUrlController,
    required this.redditUrlController,
    required this.facebookUrlController,
    required this.instagramUrlController,
    required this.onContinuePressed,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    void handleContinuePressed() {
      if (formKey.currentState?.validate() == true) {
        onContinuePressed();
      }
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppPadding.content,
              children: <Widget>[
                'Social Media'.text(style: context.headlineSmall, fontWeight: FontWeight.bold).toCenter(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppPadding.sm,
                  children: <Widget>[
                    'X URL'.text(),
                    TextFormField(
                      controller: xUrlController,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: 'https://x.com/...'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value != null && value.isNotEmpty && !value.startsWith(RegExp(r'^https://x\.com/.+'))) {
                          return 'URL must start with https://x.com/';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppPadding.sm,
                  children: <Widget>[
                    'Telegram URL'.text(),
                    TextFormField(
                      controller: telegramUrlController,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: 'https://t.me/...'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value != null && value.isNotEmpty && !value.startsWith(RegExp(r'^https://t\.me/.+'))) {
                          return 'URL must start with https://t.me/';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppPadding.sm,
                  children: <Widget>[
                    'Discord URL'.text(),
                    TextFormField(
                      controller: discordUrlController,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: 'https://discord.gg/...'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !value.startsWith(RegExp(r'^https://discord\.gg/.+'))) {
                          return 'URL must start with https://discord.gg/';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppPadding.sm,
                  children: <Widget>[
                    'Reddit URL'.text(),
                    TextFormField(
                      controller: redditUrlController,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: 'https://reddit.com/r/...'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !value.startsWith(RegExp(r'^https://reddit\.com/r/.+'))) {
                          return 'URL must start with https://reddit.com/r/';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppPadding.sm,
                  children: <Widget>[
                    'Facebook URL'.text(),
                    TextFormField(
                      controller: facebookUrlController,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: 'https://facebook.com/...'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !value.startsWith(RegExp(r'^https://facebook\.com/.+'))) {
                          return 'URL must start with https://facebook.com/';
                        }
                        return null;
                      },
                      // onChanged: onChanged,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppPadding.sm,
                  children: <Widget>[
                    'Instagram URL'.text(),
                    TextFormField(
                      controller: instagramUrlController,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(hintText: 'https://instagram.com/...'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !value.startsWith(RegExp(r'^https://instagram\.com/.+'))) {
                          return 'URL must start with https://instagram.com/';
                        }
                        return null;
                      },
                      // onChanged: onChanged,
                    ),
                  ],
                ),
                const SizedBox.shrink().expanded(),
                Row(
                  spacing: AppPadding.md,
                  children: <Widget>[
                    CustomOutlinedButton(
                      label: 'Back',
                      onPressed: onBackPressed,
                    ).expanded(),
                    CustomFilledButton(
                      label: 'Continue',
                      onPressed: handleContinuePressed,
                    ).expanded(),
                  ],
                ),
              ],
            ).paddingAll(AppPadding.content),
          ),
        ),
      ),
    );
  }
}
