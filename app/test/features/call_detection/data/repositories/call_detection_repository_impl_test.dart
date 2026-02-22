import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failures.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/call_detection_platform_channel.dart';
import 'package:voice_phishing_app/features/call_detection/data/repositories/call_detection_repository_impl.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_event.dart';

// Mock CallDetectionPlatformChannel for testing
class MockCallDetectionPlatformChannel extends CallDetectionPlatformChannel {
  final StreamController<Map<String, dynamic>> _controller =
      StreamController<Map<String, dynamic>>.broadcast();

  @override
  Stream<Map<String, dynamic>> get callEventStream => _controller.stream;

  void emitEvent(Map<String, dynamic> event) {
    _controller.add(event);
  }

  void emitError(Object error) {
    _controller.addError(error);
  }

  void close() {
    _controller.close();
  }
}

void main() {
  group('CallDetectionRepositoryImpl', () {
    late MockCallDetectionPlatformChannel mockPlatformChannel;
    late CallDetectionRepositoryImpl repository;

    setUp(() {
      mockPlatformChannel = MockCallDetectionPlatformChannel();
      repository = CallDetectionRepositoryImpl(mockPlatformChannel);
    });

    tearDown(() {
      mockPlatformChannel.close();
    });

    group('watchCallEvents', () {
      test('should emit Right(CallEvent) when platform emits valid event', () async {
        // Arrange
        final eventData = {
          'phoneNumber': '+1234567890',
          'callState': 'ringing',
          'timestamp': 1234567890,
        };

        // Act
        final stream = repository.watchCallEvents();
        final future = stream.first;
        mockPlatformChannel.emitEvent(eventData);
        final result = await future;

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should not be a failure'),
          (callEvent) {
            expect(callEvent.phoneNumber, '+1234567890');
            expect(callEvent.callState, CallState.ringing);
            expect(callEvent.timestamp, 1234567890);
          },
        );
      });

      test('should emit Right(CallEvent) with empty phone number for private calls', () async {
        // Arrange
        final eventData = {
          'phoneNumber': '',
          'callState': 'ringing',
          'timestamp': 1234567890,
        };

        // Act
        final stream = repository.watchCallEvents();
        final future = stream.first;
        mockPlatformChannel.emitEvent(eventData);
        final result = await future;

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Should not be a failure'),
          (callEvent) {
            expect(callEvent.phoneNumber, '');
            expect(callEvent.callState, CallState.ringing);
          },
        );
      });

      test('should emit Left(PlatformFailure) when platform emits error', () async {
        // Arrange
        final platformError = PlatformException(
          code: 'PERMISSION_DENIED',
          message: 'Phone permission not granted',
        );

        // Act
        final stream = repository.watchCallEvents();
        final future = stream.first;
        mockPlatformChannel.emitError(platformError);
        final result = await future;

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<PlatformFailure>());
            expect(failure.message, contains('Platform error'));
          },
          (callEvent) => fail('Should not be a success'),
        );
      });

      test('should emit multiple events correctly', () async {
        // Arrange
        final events = [
          {
            'phoneNumber': '+1111111111',
            'callState': 'ringing',
            'timestamp': 1000,
          },
          {
            'phoneNumber': '+1111111111',
            'callState': 'offhook',
            'timestamp': 2000,
          },
          {
            'phoneNumber': '+1111111111',
            'callState': 'idle',
            'timestamp': 3000,
          },
        ];

        // Act
        final stream = repository.watchCallEvents();
        final results = <Either<Failure, CallEvent>>[];
        
        final subscription = stream.listen((result) {
          results.add(result);
        });

        for (final event in events) {
          mockPlatformChannel.emitEvent(event);
          await Future.delayed(const Duration(milliseconds: 10));
        }

        await Future.delayed(const Duration(milliseconds: 50));
        await subscription.cancel();

        // Assert
        expect(results.length, 3);
        expect(results[0].isRight(), true);
        expect(results[1].isRight(), true);
        expect(results[2].isRight(), true);

        results[0].fold(
          (failure) => fail('Should not be a failure'),
          (callEvent) => expect(callEvent.callState, CallState.ringing),
        );

        results[1].fold(
          (failure) => fail('Should not be a failure'),
          (callEvent) => expect(callEvent.callState, CallState.offhook),
        );

        results[2].fold(
          (failure) => fail('Should not be a failure'),
          (callEvent) => expect(callEvent.callState, CallState.idle),
        );
      });
    });
  });

  group('CallDetectionPlatformChannel', () {
    test('parseCallState should parse all valid states', () {
      // Arrange
      final channel = CallDetectionPlatformChannel();

      // Act & Assert
      expect(channel.parseCallState('idle'), CallState.idle);
      expect(channel.parseCallState('ringing'), CallState.ringing);
      expect(channel.parseCallState('offhook'), CallState.offhook);
      expect(channel.parseCallState('disconnected'), CallState.disconnected);
      expect(channel.parseCallState('unknown'), CallState.unknown);
      expect(channel.parseCallState('RINGING'), CallState.ringing); // Case insensitive
      expect(channel.parseCallState('invalid'), CallState.unknown);
    });

    test('mapToCallEvent should map event data correctly', () {
      // Arrange
      final channel = CallDetectionPlatformChannel();
      final eventData = {
        'phoneNumber': '+1234567890',
        'callState': 'ringing',
        'timestamp': 1234567890,
      };

      // Act
      final callEvent = channel.mapToCallEvent(eventData);

      // Assert
      expect(callEvent.phoneNumber, '+1234567890');
      expect(callEvent.callState, CallState.ringing);
      expect(callEvent.timestamp, 1234567890);
    });

    test('mapToCallEvent should handle missing fields with defaults', () {
      // Arrange
      final channel = CallDetectionPlatformChannel();
      final eventData = <String, dynamic>{};

      // Act
      final callEvent = channel.mapToCallEvent(eventData);

      // Assert
      expect(callEvent.phoneNumber, '');
      expect(callEvent.callState, CallState.unknown);
      expect(callEvent.timestamp, greaterThan(0)); // Should use current time
    });
  });
}
