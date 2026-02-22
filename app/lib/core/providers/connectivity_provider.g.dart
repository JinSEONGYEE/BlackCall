// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for connectivity status stream

@ProviderFor(connectivityStream)
final connectivityStreamProvider = ConnectivityStreamProvider._();

/// Provider for connectivity status stream

final class ConnectivityStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ConnectivityResult>>,
          List<ConnectivityResult>,
          Stream<List<ConnectivityResult>>
        >
    with
        $FutureModifier<List<ConnectivityResult>>,
        $StreamProvider<List<ConnectivityResult>> {
  /// Provider for connectivity status stream
  ConnectivityStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<ConnectivityResult>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ConnectivityResult>> create(Ref ref) {
    return connectivityStream(ref);
  }
}

String _$connectivityStreamHash() =>
    r'dbd2c4ce5970f1f97dad2730821bb5ca0b99c327';

/// Provider to initialize and keep the observer alive

@ProviderFor(connectivityObserver)
final connectivityObserverProvider = ConnectivityObserverProvider._();

/// Provider to initialize and keep the observer alive

final class ConnectivityObserverProvider
    extends
        $FunctionalProvider<
          ConnectivityObserver,
          ConnectivityObserver,
          ConnectivityObserver
        >
    with $Provider<ConnectivityObserver> {
  /// Provider to initialize and keep the observer alive
  ConnectivityObserverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityObserverProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityObserverHash();

  @$internal
  @override
  $ProviderElement<ConnectivityObserver> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectivityObserver create(Ref ref) {
    return connectivityObserver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityObserver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityObserver>(value),
    );
  }
}

String _$connectivityObserverHash() =>
    r'dfc02fe16eb407331e19841d8b8b49523623ebab';
