import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

(AsyncSnapshot<T>, VoidCallback) useReloadableFutureSnapshot<T>(Future<T> Function() func) {
  ValueNotifier<int> reloadKey = useState(0);
  Future<T> future = useMemoized(func, <dynamic>[reloadKey.value]);
  AsyncSnapshot<T> snapshot = useFuture(future);

  void reload() {
    reloadKey.value += 1;
  }

  return (snapshot, reload);
}
