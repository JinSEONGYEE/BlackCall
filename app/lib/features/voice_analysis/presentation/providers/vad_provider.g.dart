// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vad_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides VadService instance
///
/// Service is initialized on first access and disposed when provider is disposed.

@ProviderFor(vadService)
final vadServiceProvider = VadServiceProvider._();

/// Provides VadService instance
///
/// Service is initialized on first access and disposed when provider is disposed.

final class VadServiceProvider
    extends $FunctionalProvider<VadService, VadService, VadService>
    with $Provider<VadService> {
  /// Provides VadService instance
  ///
  /// Service is initialized on first access and disposed when provider is disposed.
  VadServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vadServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vadServiceHash();

  @$internal
  @override
  $ProviderElement<VadService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VadService create(Ref ref) {
    return vadService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VadService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VadService>(value),
    );
  }
}

String _$vadServiceHash() => r'19dc9b2118ea6f725a3a6644f757c3f01d765e68';
