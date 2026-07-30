import 'package:flutter_dotenv/flutter_dotenv.dart';

String getCoreUrl() {
  String? coreUrl = dotenv.env['CORE_URL'];
  if (coreUrl == null) {
    throw Exception('Missing CORE_URL environment variable');
  }
  return coreUrl;
}

String getIndexerUrl() {
  String? indexerUrl = dotenv.env['INDEXER_URL'];
  if (indexerUrl == null) {
    throw Exception('Missing INDEXER_URL environment variable');
  }
  return indexerUrl;
}

String getAppUrl() {
  String? appUrl = dotenv.env['APP_URL'];
  if (appUrl == null) {
    throw Exception('Missing APP_URL environment variable');
  }
  return appUrl;
}

String getNetwork() {
  String? network = dotenv.env['NETWORK'];
  if (network == null) {
    throw Exception('Missing NETWORK environment variable');
  }
  return network;
}

String getLaunchpadAddress() {
  String? launchpadAddress = dotenv.env['LAUNCHPAD_ADDRESS'];
  if (launchpadAddress == null) {
    throw Exception('Missing LAUNCHPAD_ADDRESS environment variable');
  }
  return launchpadAddress;
}

String getReownProjectId() {
  String? reownProjectId = dotenv.env['REOWN_PROJECT_ID'];
  if (reownProjectId == null) {
    throw Exception('Missing REOWN_PROJECT_ID environment variable');
  }
  return reownProjectId;
}
