import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_log.dart';

void main() {
  group('CallLog Entity', () {
    final testDateTime = DateTime(2024, 2, 10, 12, 0, 0);
    final testAnsweredAt = DateTime(2024, 2, 10, 12, 0, 5);
    final testEndedAt = DateTime(2024, 2, 10, 12, 1, 0);

    test('should create CallLog with all fields', () {
      final callLog = CallLog(
        id: 1,
        phoneNumber: '+82-10-1234-5678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
        isKorean: true,
        isInternational: false,
        isSpoofingRisk: false,
        isWhitelisted: true,
        callState: 'ringing',
        receivedAt: testDateTime,
        answeredAt: testAnsweredAt,
        endedAt: testEndedAt,
        durationSeconds: 55,
      );

      expect(callLog.id, 1);
      expect(callLog.phoneNumber, '+82-10-1234-5678');
      expect(callLog.formattedNumber, '+82-10-1234-5678');
      expect(callLog.isPrivate, false);
      expect(callLog.isKorean, true);
      expect(callLog.isInternational, false);
      expect(callLog.isSpoofingRisk, false);
      expect(callLog.isWhitelisted, true);
      expect(callLog.callState, 'ringing');
      expect(callLog.receivedAt, testDateTime);
      expect(callLog.answeredAt, testAnsweredAt);
      expect(callLog.endedAt, testEndedAt);
      expect(callLog.durationSeconds, 55);
    });

    test('should create CallLog with nullable fields as null', () {
      final callLog = CallLog(
        id: 2,
        phoneNumber: '070-1234-5678',
        formattedNumber: '070-1234-5678',
        isPrivate: false,
        isKorean: true,
        isInternational: false,
        isSpoofingRisk: true,
        isWhitelisted: false,
        callState: 'ringing',
        receivedAt: testDateTime,
      );

      expect(callLog.answeredAt, null);
      expect(callLog.endedAt, null);
      expect(callLog.durationSeconds, null);
    });

    test('should support copyWith', () {
      final callLog = CallLog(
        id: 3,
        phoneNumber: '+1-555-1234',
        formattedNumber: '+1-555-1234',
        isPrivate: false,
        isKorean: false,
        isInternational: true,
        isSpoofingRisk: true,
        isWhitelisted: false,
        callState: 'ringing',
        receivedAt: testDateTime,
      );

      final updated = callLog.copyWith(
        callState: 'offhook',
        answeredAt: testAnsweredAt,
      );

      expect(updated.id, 3);
      expect(updated.callState, 'offhook');
      expect(updated.answeredAt, testAnsweredAt);
      expect(updated.phoneNumber, '+1-555-1234');
    });

    test('should serialize to JSON', () {
      final callLog = CallLog(
        id: 4,
        phoneNumber: '+82-10-1234-5678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
        isKorean: true,
        isInternational: false,
        isSpoofingRisk: false,
        isWhitelisted: true,
        callState: 'disconnected',
        receivedAt: testDateTime,
        answeredAt: testAnsweredAt,
        endedAt: testEndedAt,
        durationSeconds: 55,
      );

      final json = callLog.toJson();

      expect(json['id'], 4);
      expect(json['phoneNumber'], '+82-10-1234-5678');
      expect(json['callState'], 'disconnected');
      expect(json['durationSeconds'], 55);
    });

    test('should deserialize from JSON', () {
      final json = {
        'id': 5,
        'phoneNumber': '070-1234-5678',
        'formattedNumber': '070-1234-5678',
        'isPrivate': false,
        'isKorean': true,
        'isInternational': false,
        'isSpoofingRisk': true,
        'isWhitelisted': false,
        'callState': 'ringing',
        'receivedAt': testDateTime.toIso8601String(),
      };

      final callLog = CallLog.fromJson(json);

      expect(callLog.id, 5);
      expect(callLog.phoneNumber, '070-1234-5678');
      expect(callLog.isSpoofingRisk, true);
      expect(callLog.answeredAt, null);
    });

    test('should handle null optional fields in JSON', () {
      final json = {
        'id': 6,
        'phoneNumber': '+1-555-1234',
        'formattedNumber': '+1-555-1234',
        'isPrivate': false,
        'isKorean': false,
        'isInternational': true,
        'isSpoofingRisk': true,
        'isWhitelisted': false,
        'callState': 'ringing',
        'receivedAt': testDateTime.toIso8601String(),
        'answeredAt': null,
        'endedAt': null,
        'durationSeconds': null,
      };

      final callLog = CallLog.fromJson(json);

      expect(callLog.answeredAt, null);
      expect(callLog.endedAt, null);
      expect(callLog.durationSeconds, null);
    });
  });
}
