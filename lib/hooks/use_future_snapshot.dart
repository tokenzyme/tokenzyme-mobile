import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AsyncSnapshot<T> useFutureSnapshot<T>(Future<T> Function() func) {
  Future<T> future = useMemoized(func);
  AsyncSnapshot<T> snapshot = useFuture(future);
  return snapshot;
}
