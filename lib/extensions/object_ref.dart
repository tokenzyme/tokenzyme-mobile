import 'package:flutter_hooks/flutter_hooks.dart';

extension ObjectRefExtensions<T> on ObjectRef<T?> {
  bool get hasValue => value != null;

  T get requireValue => value!;
}
