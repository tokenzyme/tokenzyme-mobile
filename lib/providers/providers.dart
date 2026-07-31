import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokenzyme_mobile/utils/storage.dart';

part 'providers.g.dart';

/// Native token price in USD, pushed in by the indexer's WebSocket feed.
@riverpod
class EthPrice extends _$EthPrice {
  @override
  double build() => 0;

  void update(double value) => state = value;
}

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
