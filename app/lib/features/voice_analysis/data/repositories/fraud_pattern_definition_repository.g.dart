// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_pattern_definition_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fraudPatternDefinitionRepository)
final fraudPatternDefinitionRepositoryProvider =
    FraudPatternDefinitionRepositoryProvider._();

final class FraudPatternDefinitionRepositoryProvider
    extends
        $FunctionalProvider<
          FraudPatternDefinitionRepository,
          FraudPatternDefinitionRepository,
          FraudPatternDefinitionRepository
        >
    with $Provider<FraudPatternDefinitionRepository> {
  FraudPatternDefinitionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fraudPatternDefinitionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fraudPatternDefinitionRepositoryHash();

  @$internal
  @override
  $ProviderElement<FraudPatternDefinitionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FraudPatternDefinitionRepository create(Ref ref) {
    return fraudPatternDefinitionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FraudPatternDefinitionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FraudPatternDefinitionRepository>(
        value,
      ),
    );
  }
}

String _$fraudPatternDefinitionRepositoryHash() =>
    r'418a32d95eb6fd28a17cbf56f3e5d74f2efc35be';
