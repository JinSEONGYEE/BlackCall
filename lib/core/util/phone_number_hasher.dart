import 'package:crypto/crypto.dart';
import 'dart:convert';

/// Utility class for hashing phone numbers for privacy-preserving storage
///
/// Uses SHA-256 to hash normalized phone numbers before storing in the whitelist.
/// This ensures that raw phone numbers are never stored in the database.
class PhoneNumberHasher {
  /// Normalizes a phone number to consistent format
  ///
  /// Removes all non-digit characters except + and ensures consistent formatting.
  static String _normalize(String phoneNumber) {
    // Remove all non-digit characters except +
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    
    // If already has +, keep it
    if (digitsOnly.startsWith('+')) {
      return digitsOnly;
    }
    
    // Korean mobile number (010-XXXX-XXXX)
    if (digitsOnly.startsWith('010') && digitsOnly.length == 11) {
      return '+8210${digitsOnly.substring(3)}';
    }
    
    // Korean number with country code but no +
    if (digitsOnly.startsWith('8210')) {
      return '+$digitsOnly';
    }
    
    // Add + if missing
    if (digitsOnly.startsWith('82')) {
      return '+$digitsOnly';
    }
    
    // Assume Korean number starting with 0
    if (digitsOnly.startsWith('0')) {
      return '+82${digitsOnly.substring(1)}';
    }
    
    // Default: add +
    return '+$digitsOnly';
  }

  /// Hashes a phone number using SHA-256
  ///
  /// The phone number is first normalized to consistent format, then hashed with SHA-256.
  ///
  /// Returns a 64-character hexadecimal string (SHA-256 hash).
  ///
  /// Example:
  /// ```dart
  /// final hash = PhoneNumberHasher.hash('010-1234-5678');
  /// // Returns: 'a1b2c3d4e5f6...' (64 chars)
  /// ```
  static String hash(String phoneNumber) {
    // Normalize the phone number first
    final normalized = _normalize(phoneNumber);
    
    // Convert to bytes
    final bytes = utf8.encode(normalized);
    
    // Hash with SHA-256
    final digest = sha256.convert(bytes);
    
    // Return as hexadecimal string
    return digest.toString();
  }

  /// Checks if a phone number matches a given hash
  ///
  /// Useful for verifying whitelist membership without storing raw numbers.
  ///
  /// Example:
  /// ```dart
  /// final hash = PhoneNumberHasher.hash('010-1234-5678');
  /// final matches = PhoneNumberHasher.matches('010-1234-5678', hash);
  /// // Returns: true
  /// ```
  static bool matches(String phoneNumber, String hash) {
    return hash == PhoneNumberHasher.hash(phoneNumber);
  }
}
