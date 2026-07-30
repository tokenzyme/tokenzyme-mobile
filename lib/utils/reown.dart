import 'package:decimal/decimal.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:tokenzyme_mobile/constants/branding.dart';
import 'package:tokenzyme_mobile/utils/env.dart';

late ReownAppKit appKit;

Future<void> initAppKit() async {
  ReownAppKitModalNetworks.removeSupportedNetworks('eip155');
  ReownAppKitModalNetworks.removeSupportedNetworks('solana');
  ReownAppKitModalNetworks.addSupportedNetworks('eip155', <ReownAppKitModalNetworkInfo>[getNetworkInfo()]);

  appKit = await ReownAppKit.createInstance(
    projectId: getReownProjectId(),
    // Shown to the user by their wallet when approving the connection, so it must
    // identify YOUR deployment. Name and URL scheme come from constants/branding.dart;
    // the URL is APP_URL, the host this app already loads the chart from.
    metadata: PairingMetadata(
      name: appName,
      description: '',
      url: getAppUrl(),
      redirect: Redirect(
        native: appLinkScheme,
        universal: getAppUrl(),
        linkMode: false,
      ),
    ),
  );
  await appKit.init();
}

ReownAppKitModalNetworkInfo getNetworkInfo() {
  switch (getNetwork()) {
    case 'mainnet':
      return ReownAppKitModalNetworkInfo(
        name: 'Sonic',
        chainId: 'eip155:146',
        chainIcon: 'https://s2.coinmarketcap.com/static/img/coins/200x200/32684.png',
        currency: 'S',
        rpcUrl: 'https://rpc.soniclabs.com',
        explorerUrl: 'https://sonicscan.org',
      );
    case 'testnet':
      return ReownAppKitModalNetworkInfo(
        name: 'Sonic Testnet',
        chainId: 'eip155:14601',
        chainIcon: 'https://s2.coinmarketcap.com/static/img/coins/200x200/32684.png',
        currency: 'S',
        rpcUrl: 'https://rpc.testnet.soniclabs.com',
        explorerUrl: 'https://testnet.sonicscan.org',
        isTestNetwork: true,
      );
    case 'testnet-legacy':
      return ReownAppKitModalNetworkInfo(
        name: 'Sonic Blaze Testnet',
        chainId: 'eip155:57054',
        chainIcon: 'https://s2.coinmarketcap.com/static/img/coins/200x200/32684.png',
        currency: 'S',
        rpcUrl: 'https://rpc.blaze.soniclabs.com',
        explorerUrl: 'https://blaze.soniclabs.com',
        isTestNetwork: true,
      );
    default:
      throw Exception('Invalid NETWORK environment variable');
  }
}

Set<String> supportedWalletIds = <String>{
  // MetaMask
  'c57ca95b47569778a828d19178114f4db188b89b763c899ba0be274e97267d96',
  // Trust
  '4622a2b2d6af1c9844944291e5e7351a6aa24cd7b23099efac1b2fd875da31a0',
  // Rabby
  '18388be9ac2d02726dbac9777c96efaac06d744b2f6d580fccdd4127a6d01fd1',
  // 1inch
  'c286eebc742a537cd1d6818363e9dc53b21759a1e8e5d9b263d0c03ec7703576',
  // OKX
  '971e689d0a5be527bac79629b4ee9b925e82208e5168b733496a09c0faed0709',
  // Bitget
  '38f5d18bd8522c244bdd70cb4a68e0e718865155811c043f052fb9f1c51de662',
};

ReownAppKitModalSession getConnectedSession(ReownAppKitModal appKitModal) {
  ReownAppKitModalSession? session = appKitModal.session;
  if (session == null) {
    throw Exception('Wallet is not connected');
  }
  return session;
}

String getConnectedAddress(ReownAppKitModal appKitModal) {
  String? address = getConnectedSession(appKitModal).getAddress('eip155');
  if (address == null) {
    throw Exception('Wallet is not connected');
  }
  return address;
}

String? getConnectedAddressOrNull(ReownAppKitModal appKitModal) {
  try {
    return getConnectedAddress(appKitModal);
  } catch (ex) {
    return null;
  }
}

Decimal parseBalance(String balance) {
  try {
    return Decimal.parse(balance.replaceAll(' S', ''));
  } catch (ex) {
    return Decimal.zero;
  }
}
