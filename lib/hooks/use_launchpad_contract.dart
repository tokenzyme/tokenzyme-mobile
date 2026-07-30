import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:tokenzyme_mobile/exceptions/contract_call_exception.dart';
import 'package:tokenzyme_mobile/hooks/use_future_snapshot.dart';
import 'package:tokenzyme_mobile/utils/blockchain.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';

class SocialMedia {
  String xUrl;
  String telegramUrl;
  String discordUrl;
  String redditUrl;
  String facebookUrl;
  String instagramUrl;

  SocialMedia({
    required this.xUrl,
    required this.telegramUrl,
    required this.discordUrl,
    required this.redditUrl,
    required this.facebookUrl,
    required this.instagramUrl,
  });
}

class TokenInfo {
  String description;
  String logoUrl;
  String websiteUrl;
  SocialMedia socialMedia;

  TokenInfo({
    required this.description,
    required this.logoUrl,
    required this.websiteUrl,
    required this.socialMedia,
  });
}

class LaunchpadContract {
  AsyncSnapshot<DeployedContract> contractSnapshot;

  LaunchpadContract({required this.contractSnapshot});

  bool get isLoading => contractSnapshot.isLoading;

  bool get hasError => contractSnapshot.hasError;

  final Web3Client _web3client = Web3Client(getNetworkInfo().rpcUrl, Client());

  final ContractEvent _tokenLaunchedEvent = ContractEvent(
    false,
    'TokenLaunched',
    <EventComponent<dynamic>>[
      EventComponent<EthereumAddress>(FunctionParameter<EthereumAddress>('token', AddressType()), true),
      EventComponent<EthereumAddress>(FunctionParameter<EthereumAddress>('creator', AddressType()), true),
      EventComponent<String>(FunctionParameter<String>('name', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('symbol', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('description', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('logoUrl', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('websiteUrl', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('xUrl', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('telegramUrl', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('discordUrl', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('redditUrl', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('facebookUrl', StringType()), false),
      EventComponent<String>(FunctionParameter<String>('instagramUrl', StringType()), false),
    ],
  );

  Future<Decimal> getBondingCurveSupply() async {
    ContractFunction function = contractSnapshot.requireData.functions.firstWhere(
      (ContractFunction curr) => curr.name == 'bondingCurveSupply',
    );
    dynamic response = await _web3client.call(
      contract: contractSnapshot.requireData,
      function: function,
      params: <dynamic>[],
    );
    throwContractCallExceptionIfNeeded(response);
    return formatEther(response[0]);
  }

  Future<Decimal> estimateFirstTokensToBuy(BigInt ethAmount) async {
    ContractFunction function = contractSnapshot.requireData.functions.firstWhere(
      (ContractFunction curr) => curr.name == 'estimateFirstTokensToBuy',
    );
    dynamic response = await _web3client.call(
      contract: contractSnapshot.requireData,
      function: function,
      params: <dynamic>[ethAmount],
    );
    throwContractCallExceptionIfNeeded(response);
    return formatEther(response[0]);
  }

  Future<Decimal> estimateTokensToBuy(String tokenAddress, BigInt ethAmount) async {
    ContractFunction function = contractSnapshot.requireData.functions.firstWhere(
      (ContractFunction curr) => curr.name == 'estimateTokensToBuy',
    );
    dynamic response = await _web3client.call(
      contract: contractSnapshot.requireData,
      function: function,
      params: <dynamic>[EthereumAddress.fromHex(tokenAddress), ethAmount],
    );
    throwContractCallExceptionIfNeeded(response);
    return formatEther(response[0]);
  }

  Future<Decimal> estimateEthForSellingTokens(String tokenAddress, BigInt tokenAmount) async {
    ContractFunction function = contractSnapshot.requireData.functions.firstWhere(
      (ContractFunction curr) => curr.name == 'estimateEthForSellingTokens',
    );
    dynamic response = await _web3client.call(
      contract: contractSnapshot.requireData,
      function: function,
      params: <dynamic>[EthereumAddress.fromHex(tokenAddress), tokenAmount],
    );
    throwContractCallExceptionIfNeeded(response);
    return formatEther(response[0]);
  }

  Future<EthereumAddress> launchToken(
    ReownAppKitModal appKitModal,
    String name,
    String symbol,
    TokenInfo tokenInfo,
    Decimal buyAmount,
  ) async {
    ReownAppKitModalSession session = getConnectedSession(appKitModal);
    String address = getConnectedAddress(appKitModal);
    dynamic response = await appKitModal.requestWriteContract(
      topic: session.topic,
      chainId: getNetworkInfo().chainId,
      deployedContract: contractSnapshot.requireData,
      functionName: 'launchToken',
      transaction: Transaction(
        from: EthereumAddress.fromHex(address), // sender address
        value: EtherAmount.fromBigInt(EtherUnit.wei, parseEther(buyAmount)),
      ),
      parameters: <dynamic>[
        name,
        symbol,
        <dynamic>[
          tokenInfo.description,
          tokenInfo.logoUrl,
          tokenInfo.websiteUrl,
          <String>[
            tokenInfo.socialMedia.xUrl,
            tokenInfo.socialMedia.telegramUrl,
            tokenInfo.socialMedia.discordUrl,
            tokenInfo.socialMedia.redditUrl,
            tokenInfo.socialMedia.facebookUrl,
            tokenInfo.socialMedia.instagramUrl,
          ]
        ],
      ],
    );
    throwContractCallExceptionIfNeeded(response);
    await waitForTxConfirmation(_web3client, response);

    TransactionReceipt? receipt = await _web3client.getTransactionReceipt(response);
    if (receipt == null) {
      throw Exception('Transaction receipt not found');
    }
    List<List<dynamic>> events = receipt.logs
        .where(
          (FilterEvent log) {
            String? topic = log.topics?.first;
            return topic != null ? listEquals(hexToBytes(topic), _tokenLaunchedEvent.signature) : false;
          },
        )
        .map((FilterEvent log) => _tokenLaunchedEvent.decodeResults(log.topics!, log.data!))
        .toList();
    if (events.isEmpty) {
      throw Exception('Token launched event not found');
    }
    return events.first[0];
  }

  Future<String> buyTokens(
    ReownAppKitModal appKitModal,
    String tokenAddress,
    Decimal ethAmount,
    Decimal minExpectedTokens,
  ) async {
    ReownAppKitModalSession session = getConnectedSession(appKitModal);
    String address = getConnectedAddress(appKitModal);
    dynamic response = await appKitModal.requestWriteContract(
      topic: session.topic,
      chainId: getNetworkInfo().chainId,
      deployedContract: contractSnapshot.requireData,
      functionName: 'buyTokens',
      transaction: Transaction(
        from: EthereumAddress.fromHex(address),
        value: EtherAmount.fromBigInt(EtherUnit.wei, parseEther(ethAmount)),
      ),
      parameters: <dynamic>[
        EthereumAddress.fromHex(tokenAddress),
        parseEther(minExpectedTokens),
      ],
    );
    throwContractCallExceptionIfNeeded(response);
    await waitForTxConfirmation(_web3client, response);
    return response;
  }

  Future<String> sellTokens(
    ReownAppKitModal appKitModal,
    String tokenAddress,
    Decimal tokenAmount,
    Decimal minExpectedEth,
  ) async {
    ReownAppKitModalSession session = getConnectedSession(appKitModal);
    String address = getConnectedAddress(appKitModal);
    dynamic response = await appKitModal.requestWriteContract(
      topic: session.topic,
      chainId: getNetworkInfo().chainId,
      deployedContract: contractSnapshot.requireData,
      functionName: 'sellTokens',
      transaction: Transaction(
        from: EthereumAddress.fromHex(address),
        value: EtherAmount.zero(),
      ),
      parameters: <dynamic>[
        EthereumAddress.fromHex(tokenAddress),
        parseEther(tokenAmount),
        parseEther(minExpectedEth),
      ],
    );
    throwContractCallExceptionIfNeeded(response);
    await waitForTxConfirmation(_web3client, response);
    return response;
  }

  void throwContractCallExceptionIfNeeded(dynamic response) {
    if (response is Map && response.containsKey('code') && response.containsKey('message')) {
      throw ContractCallException(response['code'], response['message']);
    }
  }
}

LaunchpadContract useLaunchpadContract() {
  AsyncSnapshot<DeployedContract> contractSnapshot = useFutureSnapshot(getLaunchpadContract);
  return LaunchpadContract(contractSnapshot: contractSnapshot);
}
