// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tflite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tfliteServiceHash() => r'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6';

/// Provides TFLiteService instance
///
/// Copied from [tfliteService].
@ProviderFor(tfliteService)
final tfliteServiceProvider = AutoDisposeProvider<TFLiteService>.internal(
  tfliteService,
  name: r'tfliteServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tfliteServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TfliteServiceRef = AutoDisposeProviderRef<TFLiteService>;
String _$tfliteRepositoryHash() => r'b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7';

/// Provides TFLiteRepository instance
///
/// Copied from [tfliteRepository].
@ProviderFor(tfliteRepository)
final tfliteRepositoryProvider =
    AutoDisposeProvider<TFLiteRepository>.internal(
  tfliteRepository,
  name: r'tfliteRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tfliteRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TfliteRepositoryRef = AutoDisposeProviderRef<TFLiteRepository>;
String _$tFLiteModelLoaderHash() => r'c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8';

/// Provides model loading state
///
/// Automatically loads the test model when the provider is first accessed.
/// This performs a "warm-up" to reduce first inference latency.
///
/// Copied from [TFLiteModelLoader].
@ProviderFor(TFLiteModelLoader)
final tFLiteModelLoaderProvider =
    AutoDisposeAsyncNotifierProvider<TFLiteModelLoader, void>.internal(
  TFLiteModelLoader.new,
  name: r'tFLiteModelLoaderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tFLiteModelLoaderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TFLiteModelLoader = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
