// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pattern_recognition_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for PatternRecognitionService

@ProviderFor(patternRecognitionService)
final patternRecognitionServiceProvider = PatternRecognitionServiceProvider._();

/// Provider for PatternRecognitionService

final class PatternRecognitionServiceProvider
    extends
        $FunctionalProvider<
          PatternRecognitionService,
          PatternRecognitionService,
          PatternRecognitionService
        >
    with $Provider<PatternRecognitionService> {
  /// Provider for PatternRecognitionService
  PatternRecognitionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patternRecognitionServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patternRecognitionServiceHash();

  @$internal
  @override
  $ProviderElement<PatternRecognitionService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PatternRecognitionService create(Ref ref) {
    return patternRecognitionService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatternRecognitionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatternRecognitionService>(value),
    );
  }
}

String _$patternRecognitionServiceHash() =>
    r'691defb3fb46b6a4763918a495dcdcdbf19b7e07';
