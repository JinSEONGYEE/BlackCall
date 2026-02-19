/// Utility class for detecting spoofing risk patterns in phone numbers
///
/// Identifies suspicious number patterns commonly used in voice phishing:
/// - 070 numbers (Korean VoIP numbers often used for spoofing)
/// - International numbers (non-Korean)
class SpoofingDetector {
  /// Detects if a phone number has spoofing risk patterns
  ///
  /// Returns true if:
  /// - Number starts with 070 (Korean VoIP numbers often used for spoofing)
  /// - Number starts with + and is international (non-Korean)
  ///
  /// Examples:
  /// ```dart
  /// SpoofingDetector.isSpoofingRisk('070-1234-5678'); // true
  /// SpoofingDetector.isSpoofingRisk('+1-555-1234'); // true
  /// SpoofingDetector.isSpoofingRisk('010-1234-5678'); // false
  /// SpoofingDetector.isSpoofingRisk('+82-10-1234-5678'); // false
  /// ```
  static bool isSpoofingRisk(String phoneNumber) {
    // Normalize: remove all non-digit characters except +
    final normalized = phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '');

    // Empty or unknown numbers are not spoofing risks
    if (normalized.isEmpty || normalized == 'unknown') {
      return false;
    }

    // Check for 070 prefix (Korean VoIP)
    if (normalized.startsWith('070')) {
      return true;
    }

    // Check for +82070 (Korean VoIP with country code)
    if (normalized.startsWith('+82070')) {
      return true;
    }

    // Check for international numbers (non-Korean)
    // International numbers start with + but not +82
    if (normalized.startsWith('+') && !normalized.startsWith('+82')) {
      return true;
    }

    return false;
  }
}
