import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/core/util/phone_number_hasher.dart';

void main() {
  group('PhoneNumberHasher', () {
    test('hash() should return consistent SHA-256 hash for same number', () {
      const phoneNumber = '010-1234-5678';
      
      final hash1 = PhoneNumberHasher.hash(phoneNumber);
      final hash2 = PhoneNumberHasher.hash(phoneNumber);
      
      expect(hash1, equals(hash2));
      expect(hash1.length, equals(64)); // SHA-256 produces 64 hex characters
    });

    test('hash() should normalize phone number before hashing', () {
      // Different formats of the same number should produce same hash
      const number1 = '010-1234-5678';
      const number2 = '01012345678';
      const number3 = '+82-10-1234-5678';
      
      final hash1 = PhoneNumberHasher.hash(number1);
      final hash2 = PhoneNumberHasher.hash(number2);
      final hash3 = PhoneNumberHasher.hash(number3);
      
      // All should normalize to same format and produce same hash
      expect(hash1, equals(hash2));
      expect(hash2, equals(hash3));
    });

    test('hash() should produce different hashes for different numbers', () {
      const number1 = '010-1234-5678';
      const number2 = '010-9876-5432';
      
      final hash1 = PhoneNumberHasher.hash(number1);
      final hash2 = PhoneNumberHasher.hash(number2);
      
      expect(hash1, isNot(equals(hash2)));
    });

    test('matches() should return true for matching phone number and hash', () {
      const phoneNumber = '010-1234-5678';
      final hash = PhoneNumberHasher.hash(phoneNumber);
      
      expect(PhoneNumberHasher.matches(phoneNumber, hash), isTrue);
    });

    test('matches() should return false for non-matching phone number and hash', () {
      const phoneNumber1 = '010-1234-5678';
      const phoneNumber2 = '010-9876-5432';
      
      final hash1 = PhoneNumberHasher.hash(phoneNumber1);
      
      expect(PhoneNumberHasher.matches(phoneNumber2, hash1), isFalse);
    });

    test('matches() should work with different formats of same number', () {
      const number1 = '010-1234-5678';
      const number2 = '+82-10-1234-5678';
      
      final hash = PhoneNumberHasher.hash(number1);
      
      // Different format but same number should match
      expect(PhoneNumberHasher.matches(number2, hash), isTrue);
    });
  });
}
