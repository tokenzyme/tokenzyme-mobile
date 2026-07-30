import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tokenzyme_mobile/hooks/models/trade.dart';
import 'package:tokenzyme_mobile/hooks/use_socket_event.dart';

void useTradesEvent(String tokenAddress, void Function(Trade) handler) {
  Function(dynamic) converterHandler = useCallback((dynamic tradeJson) {
    handler(Trade.fromJson(tradeJson));
  }, <dynamic>[handler]);

  useIndexerSocketEvent('tokens:$tokenAddress:trades', converterHandler);
}
