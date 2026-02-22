/// Phone number formatting utility
///
/// Provides functions to format phone numbers according to Korean and
/// international standards.
class PhoneNumberFormatter {
  /// Default country code for Korea
  static const String defaultCountryCode = '+82';
  
  /// Format a phone number to standard format
  ///
  /// Examples:
  /// - Korean: 01012345678 → +82-10-1234-5678
  /// - International: +15551234 → +1-555-1234
  /// - Private: null/empty → "Private Number"
  static String format(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Private Number';
    }
    
    // Normalize: remove all non-digit characters except +
    final normalized = _normalize(phoneNumber);
    
    if (normalized.isEmpty) {
      return 'Private Number';
    }
    
    // Check if it's an international number
    if (normalized.startsWith('+')) {
      return _formatInternational(normalized);
    }
    
    // Assume Korean number if no country code
    return _formatKorean(normalized);
  }
  
  /// Normalize phone number by removing spaces, dashes, parentheses
  static String _normalize(String phoneNumber) {
    // Keep only digits and +
    return phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
  }
  
  /// Format Korean phone number
  ///
  /// Examples:
  /// - 01012345678 → +82-10-1234-5678
  /// - 0212345678 → +82-2-1234-5678
  static String _formatKorean(String phoneNumber) {
    // Remove leading 0 if present
    final withoutLeadingZero = phoneNumber.startsWith('0') 
        ? phoneNumber.substring(1) 
        : phoneNumber;
    
    // Add country code
    final withCountryCode = '$defaultCountryCode$withoutLeadingZero';
    
    // Format based on length
    if (withCountryCode.length == 13) {
      // Mobile: +82-10-1234-5678
      return '${withCountryCode.substring(0, 3)}-${withCountryCode.substring(3, 5)}-${withCountryCode.substring(5, 9)}-${withCountryCode.substring(9)}';
    } else if (withCountryCode.length == 12) {
      // Seoul landline: +82-2-1234-5678
      return '${withCountryCode.substring(0, 3)}-${withCountryCode.substring(3, 4)}-${withCountryCode.substring(4, 8)}-${withCountryCode.substring(8)}';
    } else if (withCountryCode.length == 13 && withCountryCode.substring(3, 5) == '02') {
      // Seoul with area code: +82-2-XXXX-XXXX
      return '${withCountryCode.substring(0, 3)}-${withCountryCode.substring(3, 4)}-${withCountryCode.substring(4, 8)}-${withCountryCode.substring(8)}';
    }
    
    // Fallback: format number part generically
    return '+82-${_formatNumberPart(withoutLeadingZero)}';
  }
  
  /// Format international phone number
  ///
  /// Examples:
  /// - +15551234 → +1-555-1234
  /// - +8615512345678 → +86-155-1234-5678
  static String _formatInternational(String phoneNumber) {
    // Extract country code (1-3 digits after +)
    final match = RegExp(r'^\+(\d{1,3})(.+)$').firstMatch(phoneNumber);
    
    if (match == null) {
      return phoneNumber;
    }
    
    final countryCode = match.group(1)!;
    final number = match.group(2)!;
    
    // Format based on country code
    if (countryCode == '1') {
      // US/Canada: +1-555-1234 or +1-555-123-4567
      if (number.length == 7) {
        return '+$countryCode-${number.substring(0, 3)}-${number.substring(3)}';
      } else if (number.length == 10) {
        return '+$countryCode-${number.substring(0, 3)}-${number.substring(3, 6)}-${number.substring(6)}';
      }
    } else if (countryCode == '82') {
      // Korean number with country code - remove leading 0 if present
      final normalizedNumber = number.startsWith('0') ? number.substring(1) : number;
      return _formatKorean(normalizedNumber);
    }
    
    // Generic formatting for other countries
    return '+$countryCode-${_formatNumberPart(number)}';
  }
  
  /// Format the number part (after country code) generically
  static String _formatNumberPart(String number) {
    if (number.length <= 4) {
      return number;
    }
    
    final buffer = StringBuffer();
    var index = 0;
    
    while (index < number.length) {
      if (buffer.isNotEmpty) {
        buffer.write('-');
      }
      
      final remaining = number.length - index;
      final chunkSize = remaining > 4 ? 3 : remaining;
      
      buffer.write(number.substring(index, index + chunkSize));
      index += chunkSize;
    }
    
    return buffer.toString();
  }
  
  /// Check if a phone number is private/blocked
  static bool isPrivate(String? phoneNumber) {
    return phoneNumber == null || phoneNumber.isEmpty;
  }
  
  /// Check if a phone number is Korean
  static bool isKorean(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }
    
    final normalized = _normalize(phoneNumber);
    return normalized.startsWith('+82') || normalized.startsWith('0');
  }
  
  /// Check if a phone number is international
  static bool isInternational(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }
    
    final normalized = _normalize(phoneNumber);
    return normalized.startsWith('+') && !normalized.startsWith('+82');
  }
}
