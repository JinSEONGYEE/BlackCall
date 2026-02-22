import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/whitelist_entry.dart';

void main() {
  group('WhitelistEntry', () {
    test('should create WhitelistEntry with all fields', () {
      final entry = WhitelistEntry(
        id: 1,
        phoneNumberHash: 'a' * 64, // 64-character hash
        addedAt: DateTime(2026, 2, 9),
        contactName: 'John Doe',
      );

      expect(entry.id, equals(1));
      expect(entry.phoneNumberHash, equals('a' * 64));
      expect(entry.addedAt, equals(DateTime(2026, 2, 9)));
      expect(entry.contactName, equals('John Doe'));
    });

    test('should create WhitelistEntry without contact name', () {
      final entry = WhitelistEntry(
        id: 1,
        phoneNumberHash: 'a' * 64,
        addedAt: DateTime(2026, 2, 9),
      );

      expect(entry.contactName, isNull);
    });

    test('should support copyWith', () {
      final entry = WhitelistEntry(
        id: 1,
        phoneNumberHash: 'a' * 64,
        addedAt: DateTime(2026, 2, 9),
        contactName: 'John Doe',
      );

      final updated = entry.copyWith(contactName: 'Jane Doe');

      expect(updated.id, equals(1));
      expect(updated.phoneNumberHash, equals('a' * 64));
      expect(updated.contactName, equals('Jane Doe'));
    });

    test('should serialize to JSON', () {
      final entry = WhitelistEntry(
        id: 1,
        phoneNumberHash: 'a' * 64,
        addedAt: DateTime(2026, 2, 9, 10, 30),
        contactName: 'John Doe',
      );

      final json = entry.toJson();

      expect(json['id'], equals(1));
      expect(json['phoneNumberHash'], equals('a' * 64));
      expect(json['contactName'], equals('John Doe'));
      expect(json['addedAt'], isA<String>());
    });

    test('should deserialize from JSON', () {
      final json = {
        'id': 1,
        'phoneNumberHash': 'a' * 64,
        'addedAt': '2026-02-09T10:30:00.000',
        'contactName': 'John Doe',
      };

      final entry = WhitelistEntry.fromJson(json);

      expect(entry.id, equals(1));
      expect(entry.phoneNumberHash, equals('a' * 64));
      expect(entry.contactName, equals('John Doe'));
      expect(entry.addedAt, equals(DateTime(2026, 2, 9, 10, 30)));
    });

    test('should handle null contactName in JSON', () {
      final json = {
        'id': 1,
        'phoneNumberHash': 'a' * 64,
        'addedAt': '2026-02-09T10:30:00.000',
        'contactName': null,
      };

      final entry = WhitelistEntry.fromJson(json);

      expect(entry.contactName, isNull);
    });
  });
}
