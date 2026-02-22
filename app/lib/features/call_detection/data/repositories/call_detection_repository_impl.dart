import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/call_detection_platform_channel.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_event.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/call_detection_repository.dart';

/// Implementation of CallDetectionRepository
///
/// This class implements the repository interface and handles:
/// - Platform channel communication
/// - Error mapping from platform exceptions to domain failures
/// - Permission management
class CallDetectionRepositoryImpl implements CallDetectionRepository {
  CallDetectionRepositoryImpl(this._platformChannel);
  
  final CallDetectionPlatformChannel _platformChannel;
  
  @override
  Stream<Either<Failure, CallEvent>> watchCallEvents() {
    return _platformChannel.callEventStream.map((eventData) {
      try {
        final callEvent = _platformChannel.mapToCallEvent(eventData);
        return right<Failure, CallEvent>(callEvent);
      } catch (e) {
        return left<Failure, CallEvent>(
          PlatformFailure('Failed to parse call event: ${e.toString()}'),
        );
      }
    }).handleError((error) {
      if (error is PlatformException) {
        return left<Failure, CallEvent>(
          PlatformFailure('Platform error: ${error.message}'),
        );
      }
      return left<Failure, CallEvent>(
        PlatformFailure('Unknown error: ${error.toString()}'),
      );
    });
  }
  
  @override
  Future<Either<Failure, bool>> hasPhonePermissions() async {
    try {
      final phoneStatus = await Permission.phone.status;
      return right(phoneStatus.isGranted);
    } catch (e) {
      return left(
        PermissionFailure('Failed to check phone permissions: ${e.toString()}'),
      );
    }
  }
  
  @override
  Future<Either<Failure, bool>> requestPhonePermissions() async {
    try {
      final status = await Permission.phone.request();
      return right(status.isGranted);
    } catch (e) {
      return left(
        PermissionFailure('Failed to request phone permissions: ${e.toString()}'),
      );
    }
  }
}
