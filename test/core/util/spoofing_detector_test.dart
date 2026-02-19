import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/core/util/spoofing_detector.dart';

void main() {
  group('SpoofingDetector', () {
    group('070 numbers (Korean VoIP)', () {
      test('should detect 070 number without formatting', () {
        expect(SpoofingDetector.isSpoofingRisk('07012345678'), isTrue);
      });

      test('should detect 070 number with dashes', () {
        expect(SpoofingDetector.isSpoofingRisk('070-1234-5678'), isTrue);
      });

      test('should detect 070 number with spaces', () {
        expect(SpoofingDetector.isSpoofingRisk('070 1234 5678'), isTrue);
      });

      test('should detect +82070 number', () {
        expect(SpoofingDetector.isSpoofingRisk('+8207012345678'), isTrue);
      });

      test('should detect +82070 number with formatting', () {
        expect(SpoofingDetector.isSpoofingRisk('+82-070-1234-5678'), isTrue);
      });
    });

    group('International numbers (non-Korean)', () {
      test('should detect US number (+1)', () {
        expect(SpoofingDetector.isSpoofingRisk('+1-555-1234'), isTrue);
      });

      test('should detect China number (+86)', () {
        expect(SpoofingDetector.isSpoofingRisk('+86-138-1234-5678'), isTrue);
      });

      test('should detect UK number (+44)', () {
        expect(SpoofingDetector.isSpoofingRisk('+44-20-1234-5678'), isTrue);
      });

      test('should detect Japan number (+81)', () {
        expect(SpoofingDetector.isSpoofingRisk('+81-90-1234-5678'), isTrue);
      });

      test('should detect international number without formatting', () {
        expect(SpoofingDetector.isSpoofingRisk('+15551234567'), isTrue);
      });
    });

    group('Korean numbers (NOT spoofing risk)', () {
      test('should NOT detect Korean mobile (010)', () {
        expect(SpoofingDetector.isSpoofingRisk('010-1234-5678'), isFalse);
      });

      test('should NOT detect Korean mobile with +82', () {
        expect(SpoofingDetector.isSpoofingRisk('+82-10-1234-5678'), isFalse);
      });

      test('should NOT detect Korean mobile without formatting', () {
        expect(SpoofingDetector.isSpoofingRisk('01012345678'), isFalse);
      });

      test('should NOT detect Seoul landline (02)', () {
        expect(SpoofingDetector.isSpoofingRisk('02-1234-5678'), isFalse);
      });

      test('should NOT detect regional landline (031)', () {
        expect(SpoofingDetector.isSpoofingRisk('031-123-4567'), isFalse);
      });

      test('should NOT detect Korean toll-free (080)', () {
        expect(SpoofingDetector.isSpoofingRisk('080-1234-5678'), isFalse);
      });

      test('should NOT detect Korean customer service (1588)', () {
        expect(SpoofingDetector.isSpoofingRisk('1588-1234'), isFalse);
      });
    });

    group('Edge cases', () {
      test('should NOT detect empty string', () {
        expect(SpoofingDetector.isSpoofingRisk(''), isFalse);
      });

      test('should NOT detect "unknown"', () {
        expect(SpoofingDetector.isSpoofingRisk('unknown'), isFalse);
      });

      test('should handle number with parentheses', () {
        expect(SpoofingDetector.isSpoofingRisk('(070) 1234-5678'), isTrue);
      });

      test('should handle number with dots', () {
        expect(SpoofingDetector.isSpoofingRisk('070.1234.5678'), isTrue);
      });
    });
  });
}
