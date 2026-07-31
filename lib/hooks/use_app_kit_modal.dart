import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:tokenzyme_mobile/hooks/use_reloadable_future_snapshot.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';
import 'package:tokenzyme_mobile/utils/storage.dart';

AsyncSnapshot<ReownAppKitModal> useAppKitModal(BuildContext context, WidgetRef ref) {
  final (AsyncSnapshot<ReownAppKitModal> modalSnapshot, VoidCallback reload) = useReloadableFutureSnapshot(() async {
    ReownAppKitModal modal = ReownAppKitModal(
      context: context,
      appKit: appKit,
      enableAnalytics: true,
      disconnectOnDispose: false,
      includedWalletIds: supportedWalletIds,
      featuredWalletIds: supportedWalletIds,
    );
    await modal.init();
    if (modal.status == ReownAppKitModalStatus.error) {
      throw Exception('Error initializing wallet');
    }
    return modal;
  });

  useEffect(() {
    if (modalSnapshot.data != null) {
      ReownAppKitModal appKitModal = modalSnapshot.requireData;
      appKitModal.onModalConnect.subscribe((_) {
        if (context.mounted) {
          reload();
        }
      });
      appKitModal.onModalDisconnect.subscribe((_) async {
        if (context.mounted) {
          await removeToken();
          reload();
        }
      });
    }
    return () {
      modalSnapshot.data?.onModalConnect.unsubscribeAll();
      modalSnapshot.data?.onModalDisconnect.unsubscribeAll();
    };
  }, <dynamic>[modalSnapshot.data]);

  return modalSnapshot;
}
