// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whitelist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for WhitelistLocalDataSource

@ProviderFor(whitelistLocalDataSource)
final whitelistLocalDataSourceProvider = WhitelistLocalDataSourceProvider._();

/// Provider for WhitelistLocalDataSource

final class WhitelistLocalDataSourceProvider
    extends
        $FunctionalProvider<
          WhitelistLocalDataSource,
          WhitelistLocalDataSource,
          WhitelistLocalDataSource
        >
    with $Provider<WhitelistLocalDataSource> {
  /// Provider for WhitelistLocalDataSource
  WhitelistLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'whitelistLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$whitelistLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<WhitelistLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WhitelistLocalDataSource create(Ref ref) {
    return whitelistLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WhitelistLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WhitelistLocalDataSource>(value),
    );
  }
}

String _$whitelistLocalDataSourceHash() =>
    r'2bafe469a3e1f64ed18ee4125522a4b52b7603d8';

/// Provider for WhitelistRepository

@ProviderFor(whitelistRepository)
final whitelistRepositoryProvider = WhitelistRepositoryProvider._();

/// Provider for WhitelistRepository

final class WhitelistRepositoryProvider
    extends
        $FunctionalProvider<
          WhitelistRepository,
          WhitelistRepository,
          WhitelistRepository
        >
    with $Provider<WhitelistRepository> {
  /// Provider for WhitelistRepository
  WhitelistRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'whitelistRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$whitelistRepositoryHash();

  @$internal
  @override
  $ProviderElement<WhitelistRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WhitelistRepository create(Ref ref) {
    return whitelistRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WhitelistRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WhitelistRepository>(value),
    );
  }
}

String _$whitelistRepositoryHash() =>
    r'007fdec0f14d43d026f90a4692fb8a256d8ede16';
