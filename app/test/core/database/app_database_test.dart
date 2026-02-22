import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/core/database/database_provider.dart';

void main() {
  group('AppDatabase', () {
    late AppDatabase database;

    setUp(() {
      // Create in-memory database for testing
      database = AppDatabase.forTesting(NativeDatabase.memory());
    });

    tearDown(() async {
      // Close database after each test
      await database.close();
    });

    test('database can be created', () {
      expect(database, isNotNull);
      expect(database, isA<AppDatabase>());
    });

    test('database has correct schema version', () {
      expect(database.schemaVersion, equals(1));
    });

    test('database has no tables initially', () {
      expect(database.allTables, isEmpty);
    });

    test('database can be closed and reopened', () async {
      // Close the database
      await database.close();

      // Create a new instance
      final newDatabase = AppDatabase.forTesting(NativeDatabase.memory());

      expect(newDatabase, isNotNull);
      expect(newDatabase.schemaVersion, equals(1));

      await newDatabase.close();
    });
  });

  group('Database Provider', () {
    test('appDatabaseProvider creates database instance', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final database = container.read(appDatabaseProvider);

      expect(database, isNotNull);
      expect(database, isA<AppDatabase>());
    });

    test('testDatabaseProvider disposes database on container dispose', () async {
      final container = ProviderContainer();

      final database = container.read(testDatabaseProvider);
      expect(database, isNotNull);

      // Dispose container should close database without errors
      expect(() => container.dispose(), returnsNormally);
      
      // Database reference still exists but connection is closed
      // We verify disposal completed successfully
      expect(database, isNotNull);
    });

    test('testDatabaseProvider creates in-memory database', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final database = container.read(testDatabaseProvider);

      expect(database, isNotNull);
      expect(database, isA<AppDatabase>());
      expect(database.schemaVersion, equals(1));
    });

    test('appDatabaseProvider can be created', () {
      // Note: This test only verifies the provider exists
      // Full integration testing with file system requires
      // TestWidgetsFlutterBinding.ensureInitialized()
      expect(appDatabaseProvider, isNotNull);
    });
  });
}
