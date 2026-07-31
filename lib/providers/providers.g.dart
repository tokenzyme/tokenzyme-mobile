// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Native token price in USD, pushed in by the indexer's WebSocket feed.

@ProviderFor(EthPrice)
final ethPriceProvider = EthPriceProvider._();

/// Native token price in USD, pushed in by the indexer's WebSocket feed.
final class EthPriceProvider extends $NotifierProvider<EthPrice, double> {
  /// Native token price in USD, pushed in by the indexer's WebSocket feed.
  EthPriceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ethPriceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ethPriceHash();

  @$internal
  @override
  EthPrice create() => EthPrice();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$ethPriceHash() => r'b83dff06e13bb8d6144924ca790328bfb07ae6d0';

/// Native token price in USD, pushed in by the indexer's WebSocket feed.

abstract class _$EthPrice extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(theme)
final themeProvider = ThemeProvider._();

final class ThemeProvider
    extends
        $FunctionalProvider<
          AsyncValue<ThemeMode>,
          ThemeMode,
          FutureOr<ThemeMode>
        >
    with $FutureModifier<ThemeMode>, $FutureProvider<ThemeMode> {
  ThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeHash();

  @$internal
  @override
  $FutureProviderElement<ThemeMode> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ThemeMode> create(Ref ref) {
    return theme(ref);
  }
}

String _$themeHash() => r'093e05de91ee4bdba6e0fe9e942089d6ad44154c';

@ProviderFor(slippage)
final slippageProvider = SlippageProvider._();

final class SlippageProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  SlippageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'slippageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$slippageHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return slippage(ref);
  }
}

String _$slippageHash() => r'aadec28e63229e4c1483b5850f039bdc92db9399';
