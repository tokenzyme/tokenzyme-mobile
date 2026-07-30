import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tokenzyme_mobile/utils/env.dart';

Socket coreSocket = io(
  getCoreUrl(),
  OptionBuilder().setTransports(<String>['websocket']).build(),
);
Socket indexerSocket = io(
  getIndexerUrl(),
  OptionBuilder().setTransports(<String>['websocket']).build(),
);

void useSocketEvent<T>(Socket socket, String event, void Function(dynamic) handler) {
  useEffect(() {
    socket.on(event, handler);
    return () => socket.off(event, handler);
  }, <dynamic>[socket, event, handler]);
}

void useCoreSocketEvent<T>(String event, void Function(dynamic) handler) {
  useSocketEvent<T>(coreSocket, event, handler);
}

void useIndexerSocketEvent<T>(String event, void Function(dynamic) handler) {
  useSocketEvent<T>(indexerSocket, event, handler);
}
