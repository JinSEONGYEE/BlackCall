// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haptic_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for HapticService

@ProviderFor(hapticService)
final hapticServiceProvider = HapticServiceProvider._();

/// Provider for HapticService

final class HapticServiceProvider
    extends $FunctionalProvider<HapticService, HapticService, HapticService>
    with $Provider<HapticService> {
  /// Provider for HapticService
  HapticServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hapticServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hapticServiceHash();

  @$internal
  @override
  $ProviderElement<HapticService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HapticService create(Ref ref) {
    return hapticService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HapticService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HapticService>(value),
    );
  }
}

String _$hapticServiceHash() => r'f4cde3bb129c95bc0a12dc178c513c8bd4d3f0da';
