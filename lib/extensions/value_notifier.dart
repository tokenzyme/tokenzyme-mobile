import 'package:flutter/material.dart';

extension ValueNotifierExtensions<T> on ValueNotifier<T?> {
  bool get hasValue => value != null;

  T get requireValue => value!;
}
