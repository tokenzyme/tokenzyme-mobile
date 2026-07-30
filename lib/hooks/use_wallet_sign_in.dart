import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:tokenzyme_mobile/graphql/account.graphql.dart';
import 'package:tokenzyme_mobile/graphql/schema.graphql.dart';
import 'package:tokenzyme_mobile/graphql/signature_message.graphql.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';
import 'package:tokenzyme_mobile/utils/storage.dart';
import 'package:web3dart/crypto.dart';

typedef SignInWithWalletFn = Future<void> Function(ReownAppKitModal);

SignInWithWalletFn useWalletSignIn() {
  Mutation$CreateSignatureMessage$HookResult createSignatureMessageMutation = useMutation$CreateSignatureMessage();
  Mutation$SignIn$HookResult signInMutation = useMutation$SignIn();

  SignInWithWalletFn signInWithWallet = useCallback((ReownAppKitModal appKitModal) async {
    String? token = await getToken();
    if (token != null) {
      return;
    }

    String? accountAddress = getConnectedAddressOrNull(appKitModal);
    if (accountAddress != null) {
      QueryResult<Mutation$CreateSignatureMessage>? createSignatureMessageResult = await createSignatureMessageMutation
          .runMutation(Variables$Mutation$CreateSignatureMessage(
            input: Input$CreateSignatureMessageInput(
              accountAddress: accountAddress,
              type: Enum$SignatureMessageType.SIGN_IN,
            ),
          ))
          .networkResult;
      Mutation$CreateSignatureMessage$createSignatureMessage? signatureMessage =
          createSignatureMessageResult?.parsedData?.createSignatureMessage;
      if (signatureMessage == null) {
        return;
      }

      ReownAppKitModalSession session = getConnectedSession(appKitModal);
      Uint8List bytes = utf8.encode(signatureMessage.message);
      String signature = await appKitModal.request(
        topic: session.topic,
        chainId: getNetworkInfo().chainId,
        request: SessionRequestParams(
          method: 'personal_sign',
          params: <String>['0x${bytesToHex(bytes)}', accountAddress],
        ),
      );

      QueryResult<Mutation$SignIn>? signInResult = await signInMutation
          .runMutation(Variables$Mutation$SignIn(
            input: Input$SignInInput(
              signatureMessageId: signatureMessage.id,
              signature: signature,
            ),
          ))
          .networkResult;
      Mutation$SignIn$signIn? signInData = signInResult?.parsedData?.signIn;
      if (signInData == null) {
        return;
      }

      saveToken(signInData.token);
    }
  }, <dynamic>[]);

  return signInWithWallet;
}
