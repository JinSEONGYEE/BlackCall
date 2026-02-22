// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tflite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides TFLiteService instance

@ProviderFor(tfliteService)
final tfliteServiceProvider = TfliteServiceProvider._();

/// Provides TFLiteService instance

final class TfliteServiceProvider
    extends $FunctionalProvider<TFLiteService, TFLiteService, TFLiteService>
    with $Provider<TFLiteService> {
  /// Provides TFLiteService instance
  TfliteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tfliteServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tfliteServiceHash();

  @$internal
  @override
  $ProviderElement<TFLiteService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TFLiteService create(Ref ref) {
    return tfliteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TFLiteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TFLiteService>(value),
    );
  }
}

String _$tfliteServiceHash() => r'4382c9c067832f0f46a9cccef77fc7c83ba658f8';

/// Provides TFLiteRepository instance

@ProviderFor(tfliteRepository)
final tfliteRepositoryProvider = TfliteRepositoryProvider._();

/// Provides TFLiteRepository instance

final class TfliteRepositoryProvider
    extends
        $FunctionalProvider<
          TFLiteRepository,
          TFLiteRepository,
          TFLiteRepository
        >
    with $Provider<TFLiteRepository> {
  /// Provides TFLiteRepository instance
  TfliteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tfliteRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tfliteRepositoryHash();

  @$internal
  @override
  $ProviderElement<TFLiteRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TFLiteRepository create(Ref ref) {
    return tfliteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TFLiteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TFLiteRepository>(value),
    );
  }
}

String _$tfliteRepositoryHash() => r'b08b7ee17bb4af624ac5b907aae85b6e65b95801';

/// Provides model loading state
///
/// Automatically loads the test model when the provider is first accessed.
/// This performs a "warm-up" to reduce first inference latency.

@ProviderFor(TFLiteModelLoader)
final tFLiteModelLoaderProvider = TFLiteModelLoaderProvider._();

/// Provides model loading state
///
/// Automatically loads the test model when the provider is first accessed.
/// This performs a "warm-up" to reduce first inference latency.
final class TFLiteModelLoaderProvider
    extends $AsyncNotifierProvider<TFLiteModelLoader, void> {
  /// Provides model loading state
  ///
  /// Automatically loads the test model when the provider is first accessed.
  /// This performs a "warm-up" to reduce first inference latency.
  TFLiteModelLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tFLiteModelLoaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tFLiteModelLoaderHash();

  @$internal
  @override
  TFLiteModelLoader create() => TFLiteModelLoader();
}

String _$tFLiteModelLoaderHash() => r'ff252bb36201b1fa25c55f49e5e2b07d1294c0a5';

/// Provides model loading state
///
/// Automatically loads the test model when the provider is first accessed.
/// This performs a "warm-up" to reduce first inference latency.

abstract class _$TFLiteModelLoader extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
