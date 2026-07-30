import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:tokenzyme_mobile/exceptions/contract_call_exception.dart';
import 'package:tokenzyme_mobile/hooks/use_future_snapshot.dart';
import 'package:tokenzyme_mobile/utils/blockchain.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';

class Erc20Contract {
  AsyncSnapshot<DeployedContract> contractSnapshot;

  Erc20Contract({required this.contractSnapshot});

  bool get isLoading => contractSnapshot.isLoading;

  bool get hasError => contractSnapshot.hasError;

  final Web3Client _web3client = Web3Client(getNetworkInfo().rpcUrl, Client());

  Future<Decimal> allowance(ReownAppKitModal appKitModal, String spenderAddress) async {
    String ownerAddress = getConnectedAddress(appKitModal);
    ContractFunction function = contractSnapshot.requireData.functions.firstWhere(
      (ContractFunction curr) => curr.name == 'allowance',
    );
    dynamic response = await _web3client.call(
      contract: contractSnapshot.requireData,
      function: function,
      params: <dynamic>[
        EthereumAddress.fromHex(ownerAddress),
        EthereumAddress.fromHex(spenderAddress),
      ],
    );
    throwContractCallExceptionIfNeeded(response);
    return formatEther(response[0]);
  }

  Future<String> approve(ReownAppKitModal appKitModal, String spenderAddress, Decimal amount) async {
    ReownAppKitModalSession session = getConnectedSession(appKitModal);
    String address = getConnectedAddress(appKitModal);
    dynamic response = await appKitModal.requestWriteContract(
      topic: session.topic,
      chainId: getNetworkInfo().chainId,
      deployedContract: contractSnapshot.requireData,
      functionName: 'approve',
      transaction: Transaction(
        from: EthereumAddress.fromHex(address), // sender address
        value: EtherAmount.zero(),
      ),
      parameters: <dynamic>[
        EthereumAddress.fromHex(spenderAddress),
        parseEther(amount),
      ],
    );
    throwContractCallExceptionIfNeeded(response);
    await waitForTxConfirmation(_web3client, response);
    return response;
  }

  Future<Decimal> getBalance(ReownAppKitModal appKitModal) async {
    String ownerAddress = getConnectedAddress(appKitModal);
    ContractFunction function = contractSnapshot.requireData.functions.firstWhere(
      (ContractFunction curr) => curr.name == 'balanceOf',
    );
    dynamic response = await _web3client.call(
      contract: contractSnapshot.requireData,
      function: function,
      params: <dynamic>[EthereumAddress.fromHex(ownerAddress)],
    );
    throwContractCallExceptionIfNeeded(response);
    return formatEther(response[0]);
  }

  void throwContractCallExceptionIfNeeded(dynamic response) {
    if (response is Map && response.containsKey('code') && response.containsKey('message')) {
      throw ContractCallException(response['code'], response['message']);
    }
  }
}

Erc20Contract useErc20Contract(String address) {
  AsyncSnapshot<DeployedContract> contractSnapshot = useFutureSnapshot(() => getErc20Contract(address));
  return Erc20Contract(contractSnapshot: contractSnapshot);
}
