import 'dart:io';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/app_radius.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/value_notifier.dart';
import 'package:tokenzyme_mobile/widgets/custom_filled_button.dart';

class TokenInfoForm extends HookWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<File?> logoFileState;
  final TextEditingController nameController;
  final TextEditingController symbolController;
  final TextEditingController descriptionController;
  final TextEditingController websiteUrlController;
  final VoidCallback onContinuePressed;

  const TokenInfoForm({
    super.key,
    required this.formKey,
    required this.logoFileState,
    required this.nameController,
    required this.symbolController,
    required this.descriptionController,
    required this.websiteUrlController,
    required this.onContinuePressed,
  });

  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicker = useMemoized(() => ImagePicker(), <dynamic>[]);

    void handleSelectLogoPressed() async {
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        logoFileState.value = File(image.path);
      }
    }

    void handleContinuePressed() {
      if (formKey.currentState?.validate() == true && logoFileState.hasValue) {
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
                'Token Info'.text(style: context.headlineSmall, fontWeight: FontWeight.bold).toCenter(),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        image: logoFileState.hasValue
                            ? DecorationImage(
                                image: FileImage(logoFileState.requireValue),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                    Positioned(
                      bottom: AppPadding.sm,
                      right: AppPadding.sm,
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: context.colors.primary,
                        onPressed: handleSelectLogoPressed,
                        child: const Icon(HugeIcons.strokeRoundedImage01),
                      ),
                    ),
                  ],
                ).toCenter(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppPadding.sm,
                  children: <Widget>[
                    'Name *'.text(),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        if (value.length > 20) {
                          return 'Name too long';
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
                    'Symbol *'.text(),
                    TextFormField(
                      controller: symbolController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Symbol is required';
                        }
                        if (value.length > 20) {
                          return 'Symbol too long';
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
                    'Description *'.text(),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.content, vertical: AppPadding.md),
                      ),
                      minLines: 3,
                      maxLines: 5,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Description is required';
                        }
                        if (value.length > 255) {
                          return 'Description too long';
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
                    'Website URL'.text(),
                    TextFormField(
                      controller: websiteUrlController,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(hintText: 'https://...'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value != null && value.isNotEmpty && !value.startsWith(RegExp(r'^https://.+'))) {
                          return 'URL must start with https://';
                        }
                        return null;
                      },
                      // onChanged: onChanged,
                    ),
                  ],
                ),
                const SizedBox.shrink().expanded(),
                Row(
                  children: <Widget>[
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
