import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_event.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/caller_info.dart';
import 'package:voice_phishing_app/features/call_detection/domain/usecases/check_whitelist.dart';
import 'package:voice_phishing_app/features/call_detection/domain/usecases/format_caller_id.dart';
import 'package:voice_phishing_app/features/call_detection/domain/usecases/log_call.dart';
import 'package:voice_phishing_app/features/call_detection/domain/usecases/update_call_state.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/providers/call_log_provider.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/providers/call_state_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/audio_capture_provider.dart';

/// Service to automatically log incoming calls
///
/// Listens to call events and creates/updates call log entries in the database.
class CallLogService {
  CallLogService(this._ref);

  final Ref _ref;
  StreamSubscription? _callEventsSubscription;
  int? _currentCallLogId; // Track current call log entry
  DateTime? _currentCallStartTime; // Track when call started ringing

  /// Handle call event either
  void handleEitherEvent(Either<Failure, CallEvent> either) {
    either.fold(
      (failure) => print('❌ CallLogService: Error receiving call event: ${failure.message}'),
      (callEvent) {
        print('📞 CallLogService: Received call event: ${callEvent.callState}');
        _handleCallEvent(callEvent);
      },
    );
  }

  // Deprecated manual subscription
  void startListening() {}

  /// Handle call event based on state
  Future<void> _handleCallEvent(CallEvent event) async {
    try {
      switch (event.callState) {
        case CallState.ringing:
          await _logNewCall(event);
          break;
        case CallState.offhook:
          await _updateCallAnswered();
          break;
        case CallState.disconnected:
          await _updateCallEnded();
          break;
        case CallState.idle:
        case CallState.unknown:
          // No action needed for idle/unknown states
          break;
      }
    } catch (e) {
      print('❌ CallLogService: Unexpected error in _handleCallEvent: $e');
      // Don't rethrow - logging is non-critical
    }
  }

  /// Log a new incoming call
  Future<void> _logNewCall(CallEvent event) async {
    try {
      print('📝 CallLogService: Logging new call from ${event.phoneNumber}');

      // 1. Format caller ID
      final formatCallerIdUseCase = _ref.read(formatCallerIdUseCaseProvider);
      final callerInfo = formatCallerIdUseCase.execute(event);

      // 2. Check whitelist status
      final checkWhitelistUseCase = _ref.read(checkWhitelistUseCaseProvider);
      final whitelistResult = await checkWhitelistUseCase.execute(event.phoneNumber);

      final isWhitelisted = whitelistResult.fold(
        (failure) {
          print('⚠️ CallLogService: Failed to check whitelist: ${failure.message}');
          return false;
        },
        (isWhitelisted) => isWhitelisted,
      );

      // 3. Create call log entry
      final logCallUseCase = _ref.read(logCallUseCaseProvider);
      final receivedAt = DateTime.fromMillisecondsSinceEpoch(event.timestamp);
      _currentCallStartTime = receivedAt;

      final logResult = await logCallUseCase.execute(
        callerInfo: callerInfo,
        callState: 'ringing',
        receivedAt: receivedAt,
        isWhitelisted: isWhitelisted,
      );

      logResult.fold(
        (failure) {
          print('❌ CallLogService: Failed to log call: ${failure.message}');
          _currentCallLogId = null;
        },
        (callLog) {
          print('✅ CallLogService: Call logged with ID ${callLog.id}');
          _currentCallLogId = callLog.id;
        },
      );
    } catch (e) {
      print('❌ CallLogService: Unexpected error in _logNewCall: $e');
      _currentCallLogId = null;
    }
  }

  /// Update call log when call is answered
  Future<void> _updateCallAnswered() async {
    if (_currentCallLogId == null) {
      print('⚠️ CallLogService: No active call log to update (answered)');
      return;
    }

    try {
      print('📝 CallLogService: Updating call log ${_currentCallLogId} - answered');

      final updateCallStateUseCase = _ref.read(updateCallStateUseCaseProvider);
      final answeredAt = DateTime.now();

      final updateResult = await updateCallStateUseCase.execute(
        callLogId: _currentCallLogId!,
        callState: 'offhook',
        timestamp: answeredAt,
      );

      updateResult.fold(
        (failure) {
          print('❌ CallLogService: Failed to update call (answered): ${failure.message}');
        },
        (callLog) {
          print('✅ CallLogService: Call log updated - answered at ${callLog.answeredAt}');
          
          // Start audio capture when call is answered
          final audioCaptureService = _ref.read(audioCaptureServiceProvider);
          audioCaptureService.startCapture(callLogId: _currentCallLogId);
        },
      );
    } catch (e) {
      print('❌ CallLogService: Unexpected error in _updateCallAnswered: $e');
    }
  }

  /// Update call log when call ends
  Future<void> _updateCallEnded() async {
    if (_currentCallLogId == null) {
      print('⚠️ CallLogService: No active call log to update (ended)');
      return;
    }

    try {
      print('📝 CallLogService: Updating call log ${_currentCallLogId} - ended');

      // Stop audio capture when call ends
      final audioCaptureService = _ref.read(audioCaptureServiceProvider);
      audioCaptureService.stopCapture();

      final updateCallStateUseCase = _ref.read(updateCallStateUseCaseProvider);
      final endedAt = DateTime.now();

      final updateResult = await updateCallStateUseCase.execute(
        callLogId: _currentCallLogId!,
        callState: 'disconnected',
        timestamp: endedAt,
      );

      updateResult.fold(
        (failure) {
          print('❌ CallLogService: Failed to update call (ended): ${failure.message}');
        },
        (callLog) {
          print('✅ CallLogService: Call log updated - ended at ${callLog.endedAt}, duration: ${callLog.durationSeconds}s');
        },
      );

      // Clear current call log ID
      _currentCallLogId = null;
      _currentCallStartTime = null;
    } catch (e) {
      print('❌ CallLogService: Unexpected error in _updateCallEnded: $e');
      _currentCallLogId = null;
      _currentCallStartTime = null;
    }
  }

  /// Stop listening to call events
  void stopListening() {
    print('📞 CallLogService: Stopping call event listener');
    _callEventsSubscription?.cancel();
    _callEventsSubscription = null;
    _currentCallLogId = null;
    _currentCallStartTime = null;
  }

  /// Dispose resources
  void dispose() {
    stopListening();
  }
}
