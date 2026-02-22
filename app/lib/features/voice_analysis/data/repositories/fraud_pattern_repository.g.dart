// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_pattern_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fraudPatternRepository)
final fraudPatternRepositoryProvider = FraudPatternRepositoryProvider._();

final class FraudPatternRepositoryProvider
    extends
        $FunctionalProvider<
          FraudPatternRepository,
          FraudPatternRepository,
          FraudPatternRepository
        >
    with $Provider<FraudPatternRepository> {
  FraudPatternRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fraudPatternRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fraudPatternRepositoryHash();

  @$internal
  @override
  $ProviderElement<FraudPatternRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FraudPatternRepository create(Ref ref) {
    return fraudPatternRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FraudPatternRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FraudPatternRepository>(value),
    );
  }
}

String _$fraudPatternRepositoryHash() =>
    r'4f4eeeee4b09aed04f85342d6b62591ac44a9994';
