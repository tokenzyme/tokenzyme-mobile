import 'package:decimal/decimal.dart';
import 'package:flutter/services.dart';
import 'package:tokenzyme_mobile/utils/env.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';
import 'package:web3dart/web3dart.dart';

Future<DeployedContract> getLaunchpadContract() async {
  String abiJson = await rootBundle.loadString('assets/launchpad_abi.json');
  return DeployedContract(
    ContractAbi.fromJson(abiJson, 'Launchpad'),
    EthereumAddress.fromHex(getLaunchpadAddress()),
  );
}

Future<DeployedContract> getErc20Contract(String address) async {
  String abiJson = await rootBundle.loadString('assets/erc20_abi.json');
  return DeployedContract(
    ContractAbi.fromJson(abiJson, 'ERC20'),
    EthereumAddress.fromHex(address),
  );
}

String getAddressUrl(String address) => '${getNetworkInfo().explorerUrl}/address/$address';

String getTransactionUrl(String txHash) => '${getNetworkInfo().explorerUrl}/tx/$txHash';

String formatAddress(String address) {
  if (address.length < 12) {
    return address;
  }
  return '${address.substring(0, 6)}...${address.substring(address.length - 6)}';
}

String formatAccountAddress(String address) {
  if (address.length < 8) {
    return address;
  }
  return address.replaceFirst(RegExp(r'^0x'), '').substring(0, 6);
}

Decimal formatEther(BigInt value) {
  Decimal numerator = Decimal.fromBigInt(value);
  Decimal denominator = Decimal.parse('1000000000000000000');
  return (numerator / denominator).toDecimal();
}

BigInt parseEther(Decimal value) {
  Decimal multiplier = Decimal.parse('1000000000000000000');
  Decimal wei = value * multiplier;
  return BigInt.parse(wei.toBigInt().toString());
}

Future<void> waitForTxConfirmation(Web3Client client, String txHash) async {
  int attempts = 0;
  int maxAttempts = 60;
  Duration interval = const Duration(seconds: 1);
  TransactionReceipt? receipt;
  while (receipt == null && attempts < maxAttempts) {
    await Future<void>.delayed(interval);
    receipt = await client.getTransactionReceipt(txHash);
    attempts++;
  }
  if (receipt == null || receipt.status == false) {
    throw Exception('Transaction not confirmed after 1 minute');
  }
}
