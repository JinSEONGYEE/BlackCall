import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/core/util/phone_number_formatter.dart';

void main() {
  group('PhoneNumberFormatter', () {
    group('format', () {
      test('should format Korean mobile number correctly', () {
        // Arrange
        const phoneNumber = '01012345678';

        // Act
        final result = PhoneNumberFormatter.format(phoneNumber);

        // Assert
        expect(result, '+82-10-1234-5678');
      });

      test('should format Korean mobile number with leading zero', () {
        // Arrange
        const phoneNumber = '010-1234-5678';

        // Act
        final result = PhoneNumberFormatter.format(phoneNumber);

        // Assert
        expect(result, '+82-10-1234-5678');
      });

      test('should format Korean mobile number with spaces', () {
        // Arrange
        const phoneNumber = '010 1234 5678';

        // Act
        final result = PhoneNumberFormatter.format(phoneNumber);

        // Assert
        expect(result, '+82-10-1234-5678');
      });

      test('should format international number (US)', () {
        // Arrange
        const phoneNumber = '+15551234567';

        // Act
        final result = PhoneNumberFormatter.format(phoneNumber);

        // Assert
        expect(result, '+1-555-123-4567');
      });

      test('should format international number (US) short', () {
        // Arrange
        const phoneNumber = '+15551234';

        // Act
        final result = PhoneNumberFormatter.format(phoneNumber);

        // Assert
        expect(result, '+1-555-1234');
      });

      test('should return "Private Number" for null', () {
        // Act
        final result = PhoneNumberFormatter.format(null);

        // Assert
        expect(result, 'Private Number');
      });

      test('should return "Private Number" for empty string', () {
        // Act
        final result = PhoneNumberFormatter.format('');

        // Assert
        expect(result, 'Private Number');
      });

      test('should handle Korean number with country code', () {
        // Arrange
        const phoneNumber = '+821012345678';

        // Act
        final result = PhoneNumberFormatter.format(phoneNumber);

        // Assert
        expect(result, '+82-10-1234-5678');
      });
    });

    group('isPrivate', () {
      test('should return true for null', () {
        expect(PhoneNumberFormatter.isPrivate(null), true);
      });

      test('should return true for empty string', () {
        expect(PhoneNumberFormatter.isPrivate(''), true);
      });

      test('should return false for valid number', () {
        expect(PhoneNumberFormatter.isPrivate('01012345678'), false);
      });
    });

    group('isKorean', () {
      test('should return true for number starting with 0', () {
        expect(PhoneNumberFormatter.isKorean('01012345678'), true);
      });

      test('should return true for number with +82', () {
        expect(PhoneNumberFormatter.isKorean('+821012345678'), true);
      });

      test('should return false for international number', () {
        expect(PhoneNumberFormatter.isKorean('+15551234'), false);
      });

      test('should return false for null', () {
        expect(PhoneNumberFormatter.isKorean(null), false);
      });
    });

    group('isInternational', () {
      test('should return true for number with + but not +82', () {
        expect(PhoneNumberFormatter.isInternational('+15551234'), true);
      });

      test('should return false for Korean number', () {
        expect(PhoneNumberFormatter.isInternational('+821012345678'), false);
      });

      test('should return false for number without +', () {
        expect(PhoneNumberFormatter.isInternational('01012345678'), false);
      });

      test('should return false for null', () {
        expect(PhoneNumberFormatter.isInternational(null), false);
      });
    });
  });
}
