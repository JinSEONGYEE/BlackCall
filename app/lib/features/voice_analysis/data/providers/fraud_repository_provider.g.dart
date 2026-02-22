// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fraudRepository)
final fraudRepositoryProvider = FraudRepositoryProvider._();

final class FraudRepositoryProvider
    extends
        $FunctionalProvider<FraudRepository, FraudRepository, FraudRepository>
    with $Provider<FraudRepository> {
  FraudRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fraudRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fraudRepositoryHash();

  @$internal
  @override
  $ProviderElement<FraudRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FraudRepository create(Ref ref) {
    return fraudRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FraudRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FraudRepository>(value),
    );
  }
}

String _$fraudRepositoryHash() => r'f67443140cf3ecf8d1f7d326887d4077acf6c9a3';
