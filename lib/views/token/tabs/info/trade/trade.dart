import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/app_radius.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/hooks/use_app_kit_modal.dart';
import 'package:tokenzyme_mobile/hooks/use_erc20_contract.dart';
import 'package:tokenzyme_mobile/hooks/use_launchpad_contract.dart';
import 'package:tokenzyme_mobile/providers/providers.dart';
import 'package:tokenzyme_mobile/utils/blockchain.dart';
import 'package:tokenzyme_mobile/utils/env.dart';
import 'package:tokenzyme_mobile/utils/messages.dart';
import 'package:tokenzyme_mobile/utils/numbers.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';
import 'package:tokenzyme_mobile/views/token/tabs/info/trade/slippage_dialog.dart';
import 'package:tokenzyme_mobile/widgets/connect_wallet_button.dart';
import 'package:tokenzyme_mobile/widgets/custom_filled_button.dart';
import 'package:tokenzyme_mobile/widgets/custom_outlined_button.dart';
import 'package:tokenzyme_mobile/widgets/small_circular_progress_indicator.dart';

class Trade extends HookConsumerWidget {
  final Query$GetToken$token token;

  const Trade({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<double> slippageAsyncValue = ref.watch(slippageProvider);

    ValueNotifier<bool> isBuyState = useState(true);
    ValueNotifier<Decimal> ethBalanceState = useState(Decimal.zero);
    ValueNotifier<Decimal> tokenBalanceState = useState(Decimal.zero);
    ValueNotifier<bool> isBuyingMoreThanAvailableState = useState(false);

    GlobalKey<FormState> formKey = useMemoized(() => GlobalKey<FormState>(), <dynamic>[]);

    TextEditingController amountInController = useTextEditingController();
    TextEditingController amountOutController = useTextEditingController(text: '0');

    useListenable(amountOutController);

    AsyncSnapshot<ReownAppKitModal> appKitModalSnapshot = useAppKitModal(context, ref);
    LaunchpadContract launchpadContract = useLaunchpadContract();
    Erc20Contract erc20contract = useErc20Contract(token.address);

    ValueNotifier<String> ethBalanceNotifier = useListenable(
      appKitModalSnapshot.data?.balanceNotifier ?? ValueNotifier<String>(''),
    );

    void updateEthBalance() {
      ethBalanceState.value = parseBalance(ethBalanceNotifier.value);
    }

    void updateTokenBalance() async {
      ReownAppKitModal? appKitModal = appKitModalSnapshot.data;
      if (appKitModal != null && appKitModal.isConnected) {
        tokenBalanceState.value = await erc20contract.getBalance(appKitModal);
      } else {
        tokenBalanceState.value = Decimal.zero;
      }
    }

    void handleTradeTypePressed(bool isBuy) {
      isBuyState.value = isBuy;
      amountInController.text = '';
      amountOutController.text = '0';
      isBuyingMoreThanAvailableState.value = false;
    }

    void handleSettingsPressed() {
      showDialog(
        context: context,
        builder: (_) => SlippageDialog(),
      );
    }

    void handleAmountChanged(String value) async {
      if (value.isEmpty) {
        amountOutController.text = '0';
        isBuyingMoreThanAvailableState.value = false;
        return;
      }

      if (isBuyState.value) {
        Decimal tokensToBuy = await launchpadContract.estimateTokensToBuy(
          token.address,
          parseEther(Decimal.parse(value)),
        );
        amountOutController.text = formatDecimal(tokensToBuy);
        isBuyingMoreThanAvailableState.value = tokensToBuy > token.reserve;
      } else {
        Decimal ethForSellingTokens = await launchpadContract.estimateEthForSellingTokens(
          token.address,
          parseEther(Decimal.parse(value)),
        );
        amountOutController.text = formatDecimal(ethForSellingTokens);
      }
    }

    Future<void> refreshAfterBuyingOrSelling() async {
      amountInController.text = '';
      amountOutController.text = '0';

      await appKitModalSnapshot.requireData.loadAccountData();

      updateEthBalance();
      updateTokenBalance();

      if (context.mounted) {
        context.showSuccess(isBuyState.value ? 'Tokens bought!' : 'Tokens sold!');
      }
    }

    Decimal applySlippage(Decimal expectedAmount, double slippage) {
      Decimal slippageDecimal = Decimal.parse(slippage.toString());
      Decimal slippageFactor = Decimal.one - (slippageDecimal / Decimal.fromInt(100)).toDecimal();
      return expectedAmount * slippageFactor;
    }

    Future<void> handleBuyPressed() async {
      if (formKey.currentState?.validate() == true) {
        Decimal amountIn = parseAmount(amountInController.text);
        Decimal amountOut = parseAmount(amountOutController.text);
        await launchpadContract.buyTokens(
          appKitModalSnapshot.requireData,
          token.address,
          amountIn,
          applySlippage(amountOut, slippageAsyncValue.requireValue),
        );
        await refreshAfterBuyingOrSelling();
      }
    }

    Future<void> handleSellPressed() async {
      if (formKey.currentState?.validate() == true) {
        Decimal amountIn = parseAmount(amountInController.text);
        Decimal amountOut = parseAmount(amountOutController.text);
        Decimal allowance = await erc20contract.allowance(appKitModalSnapshot.requireData, getLaunchpadAddress());
        if (allowance < amountIn) {
          await erc20contract.approve(appKitModalSnapshot.requireData, getLaunchpadAddress(), amountIn);
        }
        await launchpadContract.sellTokens(
          appKitModalSnapshot.requireData,
          token.address,
          amountIn,
          applySlippage(amountOut, slippageAsyncValue.requireValue),
        );
        await refreshAfterBuyingOrSelling();
      }
    }

    useEffect(() {
      updateEthBalance();
      return null;
    }, <dynamic>[ethBalanceNotifier.value]);

    useEffect(() {
      updateTokenBalance();
      return null;
    }, <dynamic>[appKitModalSnapshot.data, appKitModalSnapshot.data?.isConnected]);

    return Form(
      key: formKey,
      child: Card(
        child: Builder(builder: (_) {
          if (appKitModalSnapshot.isLoading ||
              launchpadContract.isLoading ||
              erc20contract.isLoading ||
              slippageAsyncValue.isLoading) {
            return SmallCircularProgressIndicator().toCenter();
          }
          if (appKitModalSnapshot.hasError ||
              launchpadContract.hasError ||
              erc20contract.hasError ||
              slippageAsyncValue.hasError) {
            return 'An unexpected error occurred. Please try again!'.text(align: TextAlign.center).toCenter();
          }
          ReownAppKitModal appKitModal = appKitModalSnapshot.requireData;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (isBuyState.value) ...<Widget>[
                    CustomFilledButton(
                      label: 'Buy',
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(context.appTheme.buy),
                        shape: WidgetStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppRadius.sm),
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(AppRadius.sm),
                              bottomRight: Radius.zero,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () => handleTradeTypePressed(true),
                    ).expanded(),
                    CustomOutlinedButton(
                      label: 'Sell',
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(AppRadius.sm),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.circular(AppRadius.sm),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () => handleTradeTypePressed(false),
                    ).expanded(),
                  ] else ...<Widget>[
                    CustomOutlinedButton(
                      label: 'Buy',
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppRadius.sm),
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(AppRadius.sm),
                              bottomRight: Radius.zero,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () => handleTradeTypePressed(true),
                    ).expanded(),
                    CustomFilledButton(
                      label: 'Sell',
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(context.appTheme.sell),
                        shape: WidgetStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(AppRadius.sm),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.circular(AppRadius.sm),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () => handleTradeTypePressed(false),
                    ).expanded(),
                  ],
                  AppPadding.md.widthBox,
                  IconButton(
                    icon: Icon(HugeIcons.strokeRoundedSettings01),
                    onPressed: handleSettingsPressed,
                  ),
                ],
              ),
              AppPadding.md.heightBox,
              if (appKitModal.isConnected) ...<Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    '${isBuyState.value ? 'S' : token.symbol} balance:'.text(),
                    formatDecimal(isBuyState.value ? ethBalanceState.value : tokenBalanceState.value).text(),
                  ],
                ),
                AppPadding.sm.heightBox,
                TextFormField(
                  controller: amountInController,
                  decoration: InputDecoration(
                    hintText: 'Enter ${isBuyState.value ? 'S' : token.symbol} amount', // <-- isto é o placeholder
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Amount is required';
                    }
                    try {
                      Decimal amountIn = Decimal.parse(value);
                      if (amountIn == Decimal.zero) {
                        return 'Amount must be greater than 0';
                      }
                      if ((isBuyState.value && amountIn > ethBalanceState.value) ||
                          (!isBuyState.value && amountIn > tokenBalanceState.value)) {
                        return 'Insufficient balance';
                      }
                      return null;
                    } catch (ex) {
                      return 'Invalid amount';
                    }
                  },
                  onChanged: handleAmountChanged,
                ),
                AppPadding.sm.heightBox,
                'You receive: ${amountOutController.text} ${isBuyState.value ? token.symbol : 'S'}'.text(),
                AppPadding.sm.heightBox,
                'Slippage: ${formatNumber(slippageAsyncValue.requireValue)}%'.text(),
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
                AppPadding.md.heightBox,
                Row(
                  children: <Widget>[
                    if (isBuyState.value)
                      CustomFilledButton(
                        label: 'Buy ${token.symbol}',
                        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(context.appTheme.buy)),
                        onPressedAsync: handleBuyPressed,
                      ).expanded()
                    else
                      CustomFilledButton(
                        label: 'Sell ${token.symbol}',
                        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(context.appTheme.sell)),
                        onPressedAsync: handleSellPressed,
                      ).expanded(),
                  ],
                )
              ] else
                Row(
                  children: <Widget>[
                    ConnectWalletButton(appKitModal: appKitModal).expanded(),
                  ],
                ),
            ],
          );
        }).paddingAll(AppPadding.content),
      ),
    );
  }
}
