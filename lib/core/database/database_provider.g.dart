// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'5f8e3c2a1b9d7e4f6a8c0b2d4e6f8a0c';

/// Provides the application database instance
///
/// This provider creates a singleton instance of [AppDatabase]
/// that will be disposed when the provider is disposed.
/// 
/// Note: keepAlive is set to true to ensure the database remains
/// open throughout the app lifecycle and is not auto-disposed.
///
/// Copied from [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDatabaseRef = ProviderRef<AppDatabase>;
String _$testDatabaseHash() => r'7a9b1c3d5e7f9a1b3c5d7e9f1a3b5c7d';

/// Provides a test database instance with in-memory storage
///
/// This should only be used in tests.
///
/// Copied from [testDatabase].
@ProviderFor(testDatabase)
final testDatabaseProvider = AutoDisposeProvider<AppDatabase>.internal(
  testDatabase,
  name: r'testDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$testDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TestDatabaseRef = AutoDisposeProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
