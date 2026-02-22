// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pattern_update_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(patternUpdateService)
final patternUpdateServiceProvider = PatternUpdateServiceProvider._();

final class PatternUpdateServiceProvider
    extends
        $FunctionalProvider<
          PatternUpdateService,
          PatternUpdateService,
          PatternUpdateService
        >
    with $Provider<PatternUpdateService> {
  PatternUpdateServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'patternUpdateServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$patternUpdateServiceHash();

  @$internal
  @override
  $ProviderElement<PatternUpdateService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PatternUpdateService create(Ref ref) {
    return patternUpdateService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatternUpdateService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatternUpdateService>(value),
    );
  }
}

String _$patternUpdateServiceHash() =>
    r'420fee4301bb8a0d6d4d041b0f6572d0833bd801';
