// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the application database instance
///
/// This provider creates a singleton instance of [AppDatabase]
/// that will be disposed when the provider is disposed.
///
/// Note: keepAlive is set to true to ensure the database remains
/// open throughout the app lifecycle and is not auto-disposed.

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

/// Provides the application database instance
///
/// This provider creates a singleton instance of [AppDatabase]
/// that will be disposed when the provider is disposed.
///
/// Note: keepAlive is set to true to ensure the database remains
/// open throughout the app lifecycle and is not auto-disposed.

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// Provides the application database instance
  ///
  /// This provider creates a singleton instance of [AppDatabase]
  /// that will be disposed when the provider is disposed.
  ///
  /// Note: keepAlive is set to true to ensure the database remains
  /// open throughout the app lifecycle and is not auto-disposed.
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'6db5c6e8abbcbc1700e5d6d9989b84206be84f9b';

/// Provides a test database instance with in-memory storage
///
/// This should only be used in tests.

@ProviderFor(testDatabase)
final testDatabaseProvider = TestDatabaseProvider._();

/// Provides a test database instance with in-memory storage
///
/// This should only be used in tests.

final class TestDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// Provides a test database instance with in-memory storage
  ///
  /// This should only be used in tests.
  TestDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return testDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$testDatabaseHash() => r'140e3f05ecfa263f9d17ced2d6bb69c640e84ef4';
