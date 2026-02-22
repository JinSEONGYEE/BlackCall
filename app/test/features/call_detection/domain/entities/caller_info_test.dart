import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/caller_info.dart';

void main() {
  group('CallerInfo', () {
    test('should create CallerInfo with all required fields', () {
      // Arrange & Act
      const callerInfo = CallerInfo(
        phoneNumber: '+821012345678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
        isKorean: true,
        isInternational: false,
      );

      // Assert
      expect(callerInfo.phoneNumber, '+821012345678');
      expect(callerInfo.formattedNumber, '+82-10-1234-5678');
      expect(callerInfo.isPrivate, false);
      expect(callerInfo.isKorean, true);
      expect(callerInfo.isInternational, false);
    });

    test('should create CallerInfo with default values', () {
      // Arrange & Act
      const callerInfo = CallerInfo(
        phoneNumber: '+15551234',
        formattedNumber: '+1-555-1234',
        isPrivate: false,
      );

      // Assert
      expect(callerInfo.isKorean, false);
      expect(callerInfo.isInternational, false);
    });

    test('should create private caller info', () {
      // Arrange & Act
      const callerInfo = CallerInfo(
        phoneNumber: '',
        formattedNumber: 'Private Number',
        isPrivate: true,
      );

      // Assert
      expect(callerInfo.phoneNumber, '');
      expect(callerInfo.formattedNumber, 'Private Number');
      expect(callerInfo.isPrivate, true);
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      const callerInfo = CallerInfo(
        phoneNumber: '+821012345678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
        isKorean: true,
        isInternational: false,
      );

      // Act
      final json = callerInfo.toJson();

      // Assert
      expect(json['phoneNumber'], '+821012345678');
      expect(json['formattedNumber'], '+82-10-1234-5678');
      expect(json['isPrivate'], false);
      expect(json['isKorean'], true);
      expect(json['isInternational'], false);
    });

    test('should deserialize from JSON correctly', () {
      // Arrange
      final json = {
        'phoneNumber': '+821012345678',
        'formattedNumber': '+82-10-1234-5678',
        'isPrivate': false,
        'isKorean': true,
        'isInternational': false,
      };

      // Act
      final callerInfo = CallerInfo.fromJson(json);

      // Assert
      expect(callerInfo.phoneNumber, '+821012345678');
      expect(callerInfo.formattedNumber, '+82-10-1234-5678');
      expect(callerInfo.isPrivate, false);
      expect(callerInfo.isKorean, true);
      expect(callerInfo.isInternational, false);
    });

    test('should support copyWith for immutability', () {
      // Arrange
      const original = CallerInfo(
        phoneNumber: '+821012345678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
        isKorean: true,
      );

      // Act
      final modified = original.copyWith(formattedNumber: '+82-10-9999-9999');

      // Assert
      expect(modified.phoneNumber, original.phoneNumber);
      expect(modified.formattedNumber, '+82-10-9999-9999');
      expect(modified.isPrivate, original.isPrivate);
      expect(original.formattedNumber, '+82-10-1234-5678'); // Original unchanged
    });

    test('should compare CallerInfo correctly', () {
      // Arrange
      const info1 = CallerInfo(
        phoneNumber: '+821012345678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
      );

      const info2 = CallerInfo(
        phoneNumber: '+821012345678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
      );

      const info3 = CallerInfo(
        phoneNumber: '+15551234',
        formattedNumber: '+1-555-1234',
        isPrivate: false,
      );

      // Assert
      expect(info1, equals(info2));
      expect(info1, isNot(equals(info3)));
    });
  });
}
