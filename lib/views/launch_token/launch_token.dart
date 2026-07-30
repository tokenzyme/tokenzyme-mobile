import 'dart:io';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/views/launch_token/confirmation_form.dart';
import 'package:tokenzyme_mobile/views/launch_token/social_media_form.dart';
import 'package:tokenzyme_mobile/views/launch_token/token_info_form.dart';
import 'package:tokenzyme_mobile/widgets/account_button.dart';

class LaunchToken extends HookWidget {
  const LaunchToken({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = usePageController();
    GlobalKey<FormState> formKey = useMemoized(() => GlobalKey<FormState>(), <dynamic>[]);
    ValueNotifier<File?> logoFileState = useState(null);
    TextEditingController nameController = useTextEditingController();
    TextEditingController symbolController = useTextEditingController();
    TextEditingController descriptionController = useTextEditingController();
    TextEditingController websiteUrlController = useTextEditingController();
    TextEditingController xUrlController = useTextEditingController();
    TextEditingController telegramUrlController = useTextEditingController();
    TextEditingController discordUrlController = useTextEditingController();
    TextEditingController redditUrlController = useTextEditingController();
    TextEditingController facebookUrlController = useTextEditingController();
    TextEditingController instagramUrlController = useTextEditingController();
    TextEditingController buyAmountController = useTextEditingController();

    void handleContinuePressed() async {
      context.hideKeyboard();
      pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
    }

    void handleBackPressed() async {
      context.hideKeyboard();
      pageController.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
    }

    return Scaffold(
      appBar: AppBar(
        title: 'Launch a Token'.text(),
        actions: <Widget>[
          AccountButton(),
          AppPadding.content.widthBox,
        ],
      ),
      body: Form(
        key: formKey,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            TokenInfoForm(
              formKey: formKey,
              logoFileState: logoFileState,
              nameController: nameController,
              symbolController: symbolController,
              descriptionController: descriptionController,
              websiteUrlController: websiteUrlController,
              onContinuePressed: handleContinuePressed,
            ),
            SocialMediaForm(
              formKey: formKey,
              xUrlController: xUrlController,
              telegramUrlController: telegramUrlController,
              discordUrlController: discordUrlController,
              redditUrlController: redditUrlController,
              facebookUrlController: facebookUrlController,
              instagramUrlController: instagramUrlController,
              onContinuePressed: handleContinuePressed,
              onBackPressed: handleBackPressed,
            ),
            ConfirmationForm(
              formKey: formKey,
              logoFileState: logoFileState,
              nameController: nameController,
              symbolController: symbolController,
              descriptionController: descriptionController,
              websiteUrlController: websiteUrlController,
              xUrlController: xUrlController,
              telegramUrlController: telegramUrlController,
              discordUrlController: discordUrlController,
              redditUrlController: redditUrlController,
              facebookUrlController: facebookUrlController,
              instagramUrlController: instagramUrlController,
              buyAmountController: buyAmountController,
              onBackPressed: handleBackPressed,
            ),
          ],
        ),
      ),
    );
  }
}
