import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/app_radius.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';
import 'package:tokenzyme_mobile/hooks/use_app_kit_modal.dart';
import 'package:tokenzyme_mobile/utils/blockchain.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';
import 'package:tokenzyme_mobile/widgets/connect_wallet_button.dart';
import 'package:tokenzyme_mobile/widgets/small_circular_progress_indicator.dart';

class AccountButton extends HookConsumerWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncSnapshot<ReownAppKitModal> appKitModalSnapshot = useAppKitModal(context, ref);

    void handleAccountPressed() {
      appKitModalSnapshot.requireData.openModalView(ReownAppKitModalMainWalletsPage());
    }

    if (appKitModalSnapshot.isLoading) {
      return IconButton(
        icon: SmallCircularProgressIndicator(),
        onPressed: null,
      );
    }
    if (appKitModalSnapshot.hasError) {
      return SizedBox.shrink();
    }

    ReownAppKitModal appKitModal = appKitModalSnapshot.requireData;
    if (!appKitModal.isConnected) {
      return ConnectWalletButton(appKitModal: appKitModal, asIcon: true);
    }
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(AppRadius.lg)),
      child: Row(
        spacing: AppPadding.md,
        children: <Widget>[
          Icon(HugeIcons.strokeRoundedWallet01),
          formatAccountAddress(getConnectedAddress(appKitModal)).text(),
        ],
      ).paddingSymmetric(horizontal: AppPadding.md, vertical: AppPadding.sm).tappable(onPressed: handleAccountPressed),
    );
  }
}
