import 'dart:io';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/exception.dart';
import 'package:tokenzyme_mobile/extensions/object_ref.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/value_notifier.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/hooks/use_app_kit_modal.dart';
import 'package:tokenzyme_mobile/hooks/use_launchpad_contract.dart';
import 'package:tokenzyme_mobile/utils/async.dart';
import 'package:tokenzyme_mobile/utils/blockchain.dart';
import 'package:tokenzyme_mobile/utils/files.dart';
import 'package:tokenzyme_mobile/utils/messages.dart';
import 'package:tokenzyme_mobile/utils/numbers.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';
import 'package:tokenzyme_mobile/views/token/token.dart';
import 'package:tokenzyme_mobile/widgets/connect_wallet_button.dart';
import 'package:tokenzyme_mobile/widgets/custom_filled_button.dart';
import 'package:tokenzyme_mobile/widgets/custom_outlined_button.dart';
import 'package:tokenzyme_mobile/widgets/token_card.dart';

class ConfirmationForm extends HookConsumerWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<File?> logoFileState;
  final TextEditingController nameController;
  final TextEditingController symbolController;
  final TextEditingController descriptionController;
  final TextEditingController websiteUrlController;
  final TextEditingController xUrlController;
  final TextEditingController telegramUrlController;
  final TextEditingController discordUrlController;
  final TextEditingController redditUrlController;
  final TextEditingController facebookUrlController;
  final TextEditingController instagramUrlController;
  final TextEditingController buyAmountController;
  final VoidCallback onBackPressed;

  const ConfirmationForm({
    super.key,
    required this.formKey,
    required this.logoFileState,
    required this.nameController,
    required this.symbolController,
    required this.descriptionController,
    required this.websiteUrlController,
    required this.xUrlController,
    required this.telegramUrlController,
    required this.discordUrlController,
    required this.redditUrlController,
    required this.facebookUrlController,
    required this.instagramUrlController,
    required this.buyAmountController,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ObjectRef<Decimal?> bondingCurveSupplyRef = useRef(null);
    ValueNotifier<Decimal> amountOutState = useState(Decimal.fromInt(0));
    ValueNotifier<bool> isBuyingMoreThanAvailableState = useState(false);

    GraphQLClient gqlClient = useGraphQLClient();

    AsyncSnapshot<ReownAppKitModal> appKitModalSnapshot = useAppKitModal(context, ref);
    LaunchpadContract launchpadContract = useLaunchpadContract();

    ValueNotifier<String> balanceNotifier = useListenable(
      appKitModalSnapshot.data?.balanceNotifier ?? ValueNotifier<String>(''),
    );

    void handleBuyAmountChanged(String value) async {
      if (value.isEmpty) {
        amountOutState.value = Decimal.zero;
        isBuyingMoreThanAvailableState.value = false;
        return;
      }
      bondingCurveSupplyRef.value = bondingCurveSupplyRef.value ?? await launchpadContract.getBondingCurveSupply();
      Decimal tokensToBuy = await launchpadContract.estimateFirstTokensToBuy(parseEther(Decimal.parse(value)));
      amountOutState.value = tokensToBuy;
      isBuyingMoreThanAvailableState.value = tokensToBuy > bondingCurveSupplyRef.requireValue;
    }

    Future<void> handleLaunchTokenPressed() async {
      if (formKey.currentState?.validate() == true) {
        try {
          QueryResult<Query$GetTokenLogoUploadUrl> logoUploadUrlResult = await gqlClient.query$GetTokenLogoUploadUrl(
            Options$Query$GetTokenLogoUploadUrl(fetchPolicy: FetchPolicy.noCache),
          );
          Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl? logoUploadUrl =
              logoUploadUrlResult.parsedData?.tokenLogoUploadUrl;
          if (logoUploadUrlResult.hasException || logoUploadUrl == null) {
            throw Exception('Error uploading token logo');
          }

          await uploadFile(logoFileState.requireValue, logoUploadUrl.uploadUrl);

          EthereumAddress tokenAddress = await launchpadContract.launchToken(
            appKitModalSnapshot.requireData,
            nameController.text.trim(),
            symbolController.text.trim().toUpperCase(),
            TokenInfo(
              description: descriptionController.text.trim(),
              logoUrl: logoUploadUrl.cdnUrl,
              websiteUrl: websiteUrlController.text.trim(),
              socialMedia: SocialMedia(
                xUrl: xUrlController.text.trim(),
                telegramUrl: telegramUrlController.text.trim(),
                discordUrl: discordUrlController.text.trim(),
                redditUrl: redditUrlController.text.trim(),
                facebookUrl: facebookUrlController.text.trim(),
                instagramUrl: instagramUrlController.text.trim(),
              ),
            ),
            buyAmountController.text.isNotEmpty ? Decimal.parse(buyAmountController.text) : Decimal.zero,
          );

          bool? isTokenRegistered = await waitFor<bool>(
            20,
            const Duration(seconds: 1),
            () async {
              try {
                QueryResult<Query$IsTokenRegistered> result = await gqlClient.query$IsTokenRegistered(
                  Options$Query$IsTokenRegistered(
                    variables: Variables$Query$IsTokenRegistered(address: tokenAddress.hex),
                    fetchPolicy: FetchPolicy.noCache,
                  ),
                );
                return result.parsedData?.isTokenRegistered == true ? true : null;
              } catch (ex) {
                return null;
              }
            },
          );
          if (isTokenRegistered != true) {
            if (context.mounted) {
              context.showWarning(
                'Your token was successfully launched, but it has not been registered in the system yet. Do not worry — you will see it soon.',
                duration: const Duration(seconds: 6),
              );
              context.pop();
            }
            return;
          }

          if (context.mounted) {
            context.showSuccess('Token launched');
            context.pushReplacement(Token(address: tokenAddress.hex));
          }
        } on Exception catch (ex) {
          if (context.mounted) {
            context.showError(ex.message);
          }
        }
      }
    }

    if (appKitModalSnapshot.isLoading || launchpadContract.isLoading) {
      return CircularProgressIndicator().toCenter();
    }
    if (appKitModalSnapshot.hasError || launchpadContract.hasError) {
      return 'An unexpected error occurred. Please try again!'
          .text(style: context.headlineSmall, align: TextAlign.center)
          .toCenter()
          .paddingAll(AppPadding.content);
    }

    ReownAppKitModal appKitModal = appKitModalSnapshot.requireData;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                'Confirmation'.text(style: context.headlineSmall, fontWeight: FontWeight.bold).toCenter(),
                AppPadding.content.heightBox,
                'This is how your token will look like:'.text(style: context.bodyLarge),
                AppPadding.md.heightBox,
                TokenCard(
                  logo: FileImage(logoFileState.requireValue),
                  name: nameController.text,
                  symbol: symbolController.text,
                  description: descriptionController.text,
                  websiteUrl: websiteUrlController.text,
                  xUrl: xUrlController.text,
                  telegramUrl: telegramUrlController.text,
                  discordUrl: discordUrlController.text,
                  redditUrl: redditUrlController.text,
                  facebookUrl: facebookUrlController.text,
                  instagramUrl: instagramUrlController.text,
                ),
                AppPadding.md.heightBox,
                if (appKitModal.isConnected) ...<Widget>[
                  'Secure your spot and buy the first tokens'.text(style: context.bodyLarge),
                  AppPadding.sm.heightBox,
                  'S balance: ${formatDecimal(parseBalance(balanceNotifier.value))}'.text(),
                  AppPadding.sm.heightBox,
                  TextFormField(
                    controller: buyAmountController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(hintText: 'Enter amount'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      try {
                        if (value != null &&
                            value.isNotEmpty &&
                            Decimal.parse(value) > parseBalance(balanceNotifier.value)) {
                          return 'Insufficient balance';
                        }
                        return null;
                      } catch (ex) {
                        return 'Invalid amount';
                      }
                    },
                    onChanged: handleBuyAmountChanged,
                  ),
                  AppPadding.sm.heightBox,
                  'You receive: ${formatDecimal(amountOutState.value)} ${symbolController.text.toUpperCase()}'.text(),
                  if (isBuyingMoreThanAvailableState.value) ...<Widget>[
                    AppPadding.sm.heightBox,
                    Card(
                      color: Colors.yellow.shade800,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(HugeIcons.strokeRoundedAlert02, color: Colors.black),
                          AppPadding.md.widthBox,
                          buyingMoreThanAvailableMessage.text(style: context.bodySmall, color: Colors.black).expanded(),
                        ],
                      ).paddingAll(AppPadding.content),
                    ),
                  ],
                ],
                const SizedBox.shrink().expanded(),
                AppPadding.sm.heightBox,
                Card(
                  color: Colors.blue.shade700,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(HugeIcons.strokeRoundedInformationCircle, color: Colors.white),
                      AppPadding.md.widthBox,
                      'Token data cannot be modified after launch.'
                          .text(style: context.bodySmall, color: Colors.white)
                          .expanded(),
                    ],
                  ).paddingAll(AppPadding.content),
                ),
                AppPadding.content.heightBox,
                Row(
                  children: <Widget>[
                    CustomOutlinedButton(
                      label: 'Back',
                      onPressed: onBackPressed,
                    ).expanded(),
                    AppPadding.md.widthBox,
                    if (!appKitModal.isConnected)
                      ConnectWalletButton(appKitModal: appKitModal)
                    else
                      CustomFilledButton(
                        label: 'Launch Token',
                        onPressedAsync: handleLaunchTokenPressed,
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
