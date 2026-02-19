import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/whitelist_local_datasource.dart';

void main() {
  late AppDatabase database;
  late WhitelistLocalDataSource dataSource;

  setUp(() {
    // Create in-memory database for testing
    database = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = WhitelistLocalDataSource(database);
  });

  tearDown(() async {
    await database.close();
  });

  group('WhitelistLocalDataSource', () {
    test('isWhitelisted() should return false for non-existent hash', () async {
      final result = await dataSource.isWhitelisted('nonexistenthash');
      expect(result, isFalse);
    });

    test('addToWhitelist() should add entry and return data', () async {
      final hash = 'a' * 64;
      const contactName = 'John Doe';

      final result = await dataSource.addToWhitelist(
        phoneNumberHash: hash,
        contactName: contactName,
      );

      expect(result.phoneNumberHash, equals(hash));
      expect(result.contactName, equals(contactName));
      expect(result.id, isPositive);
    });

    test('isWhitelisted() should return true for existing hash', () async {
      final hash = 'b' * 64;

      await dataSource.addToWhitelist(
        phoneNumberHash: hash,
        contactName: 'Jane Doe',
      );

      final result = await dataSource.isWhitelisted(hash);
      expect(result, isTrue);
    });

    test('removeFromWhitelist() should remove entry', () async {
      final hash = 'c' * 64;

      await dataSource.addToWhitelist(
        phoneNumberHash: hash,
        contactName: 'Bob Smith',
      );

      final removed = await dataSource.removeFromWhitelist(hash);
      expect(removed, equals(1));

      final exists = await dataSource.isWhitelisted(hash);
      expect(exists, isFalse);
    });

    test('getAllWhitelistEntries() should return all entries', () async {
      await dataSource.addToWhitelist(
        phoneNumberHash: 'd' * 64,
        contactName: 'Alice',
      );
      await dataSource.addToWhitelist(
        phoneNumberHash: 'e' * 64,
        contactName: 'Bob',
      );

      final entries = await dataSource.getAllWhitelistEntries();
      expect(entries.length, equals(2));
    });

    test('clearWhitelist() should remove all entries', () async {
      await dataSource.addToWhitelist(
        phoneNumberHash: 'f' * 64,
        contactName: 'Charlie',
      );
      await dataSource.addToWhitelist(
        phoneNumberHash: 'g' * 64,
        contactName: 'David',
      );

      final deleted = await dataSource.clearWhitelist();
      expect(deleted, equals(2));

      final entries = await dataSource.getAllWhitelistEntries();
      expect(entries, isEmpty);
    });

    test('batchInsert() should insert multiple entries', () async {
      final entries = [
        WhitelistTableCompanion.insert(
          phoneNumberHash: 'h' * 64,
          addedAt: DateTime.now(),
          contactName: const Value('Eve'),
        ),
        WhitelistTableCompanion.insert(
          phoneNumberHash: 'i' * 64,
          addedAt: DateTime.now(),
          contactName: const Value('Frank'),
        ),
        WhitelistTableCompanion.insert(
          phoneNumberHash: 'j' * 64,
          addedAt: DateTime.now(),
        ),
      ];

      final count = await dataSource.batchInsert(entries);
      expect(count, equals(3));

      final allEntries = await dataSource.getAllWhitelistEntries();
      expect(allEntries.length, equals(3));
    });

    test('batchInsert() should ignore duplicates', () async {
      final hash = 'k' * 64;

      // Insert first time
      await dataSource.addToWhitelist(
        phoneNumberHash: hash,
        contactName: 'Grace',
      );

      // Try to insert duplicate
      final entries = [
        WhitelistTableCompanion.insert(
          phoneNumberHash: hash,
          addedAt: DateTime.now(),
          contactName: const Value('Grace Duplicate'),
        ),
      ];

      // batchInsert with insertOrIgnore mode
      // The count may be 1 (successful insert attempt) even though it's ignored
      final count = await dataSource.batchInsert(entries);

      // The important check: still only one entry in database
      final allEntries = await dataSource.getAllWhitelistEntries();
      expect(allEntries.length, equals(1)); // Still only one entry
      
      // Verify the original entry wasn't overwritten
      expect(allEntries.first.contactName, equals('Grace'));
    });
  });
}
