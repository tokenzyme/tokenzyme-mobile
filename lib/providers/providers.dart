import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokenzyme_mobile/utils/storage.dart';

part 'providers.g.dart';

StateProvider<double> ethPriceProvider = StateProvider<double>((_) => 0);

StateProvider<String?> accountChangedProvider = StateProvider<String?>((_) => null);

@riverpod
Future<ThemeMode> theme(Ref ref) {
  ref.keepAlive();
  return getTheme();
}

@riverpod
Future<double> slippage(Ref ref) {
  ref.keepAlive();
  return getSlippage();
}
