import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_event.dart';

void main() {
  group('CallEvent', () {
    test('should create CallEvent with all required fields', () {
      // Arrange
      const phoneNumber = '+1234567890';
      const callState = CallState.ringing;
      final timestamp = DateTime.now().millisecondsSinceEpoch;

      // Act
      final callEvent = CallEvent(
        phoneNumber: phoneNumber,
        callState: callState,
        timestamp: timestamp,
      );

      // Assert
      expect(callEvent.phoneNumber, phoneNumber);
      expect(callEvent.callState, callState);
      expect(callEvent.timestamp, timestamp);
    });

    test('should create CallEvent with empty phone number', () {
      // Arrange & Act
      final callEvent = CallEvent(
        phoneNumber: '',
        callState: CallState.ringing,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      );

      // Assert
      expect(callEvent.phoneNumber, '');
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      final callEvent = CallEvent(
        phoneNumber: '+1234567890',
        callState: CallState.offhook,
        timestamp: 1234567890,
      );

      // Act
      final json = callEvent.toJson();

      // Assert
      expect(json['phoneNumber'], '+1234567890');
      expect(json['callState'], 'offhook');
      expect(json['timestamp'], 1234567890);
    });

    test('should deserialize from JSON correctly', () {
      // Arrange
      final json = {
        'phoneNumber': '+1234567890',
        'callState': 'ringing',
        'timestamp': 1234567890,
      };

      // Act
      final callEvent = CallEvent.fromJson(json);

      // Assert
      expect(callEvent.phoneNumber, '+1234567890');
      expect(callEvent.callState, CallState.ringing);
      expect(callEvent.timestamp, 1234567890);
    });

    test('should support copyWith for immutability', () {
      // Arrange
      final original = CallEvent(
        phoneNumber: '+1234567890',
        callState: CallState.ringing,
        timestamp: 1234567890,
      );

      // Act
      final modified = original.copyWith(callState: CallState.offhook);

      // Assert
      expect(modified.phoneNumber, original.phoneNumber);
      expect(modified.callState, CallState.offhook);
      expect(modified.timestamp, original.timestamp);
      expect(original.callState, CallState.ringing); // Original unchanged
    });

    test('should compare CallEvents correctly', () {
      // Arrange
      final event1 = CallEvent(
        phoneNumber: '+1234567890',
        callState: CallState.ringing,
        timestamp: 1234567890,
      );

      final event2 = CallEvent(
        phoneNumber: '+1234567890',
        callState: CallState.ringing,
        timestamp: 1234567890,
      );

      final event3 = CallEvent(
        phoneNumber: '+0987654321',
        callState: CallState.ringing,
        timestamp: 1234567890,
      );

      // Assert
      expect(event1, equals(event2));
      expect(event1, isNot(equals(event3)));
    });
  });

  group('CallState', () {
    test('should have all expected states', () {
      expect(CallState.values, contains(CallState.idle));
      expect(CallState.values, contains(CallState.ringing));
      expect(CallState.values, contains(CallState.offhook));
      expect(CallState.values, contains(CallState.disconnected));
      expect(CallState.values, contains(CallState.unknown));
    });

    test('should serialize to correct string values', () {
      expect(CallState.idle.name, 'idle');
      expect(CallState.ringing.name, 'ringing');
      expect(CallState.offhook.name, 'offhook');
      expect(CallState.disconnected.name, 'disconnected');
      expect(CallState.unknown.name, 'unknown');
    });
  });
}
