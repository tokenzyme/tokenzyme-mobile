import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';
import 'package:tokenzyme_mobile/widgets/custom_filled_button.dart';

class ConnectWalletButton extends HookWidget {
  final ReownAppKitModal appKitModal;
  final bool asIcon;

  const ConnectWalletButton({super.key, required this.appKitModal, this.asIcon = false});

  @override
  Widget build(BuildContext context) {
    void handleConnectWalletPressed() async {
      if (!appKitModal.isConnected) {
        await appKitModal.openModalView();
      }
      ReownAppKitModalNetworkInfo networkInfo = getNetworkInfo();
      if (appKitModal.isConnected && appKitModal.selectedChain?.chainId != networkInfo.chainId) {
        await appKitModal.requestAddChain(networkInfo);
      }
    }

    return AppKitModalNetworkSelectButton(
      appKit: appKitModal,
      custom: asIcon
          ? IconButton(
              icon: Icon(HugeIcons.strokeRoundedWallet01),
              onPressed: handleConnectWalletPressed,
            )
          : CustomFilledButton(
              label: 'Connect Wallet',
              onPressed: handleConnectWalletPressed,
            ),
    );
  }
}
