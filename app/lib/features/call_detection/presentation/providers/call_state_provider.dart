import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/call_detection_platform_channel.dart';
import 'package:voice_phishing_app/features/call_detection/data/repositories/call_detection_repository_impl.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_event.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/call_detection_repository.dart';

part 'call_state_provider.g.dart';

/// Provider for the call detection platform channel
@riverpod
CallDetectionPlatformChannel callDetectionPlatformChannel(
  Ref ref,
) {
  return CallDetectionPlatformChannel();
}

/// Provider for the call detection repository
@riverpod
CallDetectionRepository callDetectionRepository(
  Ref ref,
) {
  final platformChannel = ref.watch(callDetectionPlatformChannelProvider);
  return CallDetectionRepositoryImpl(platformChannel);
}

/// Stream provider for call events
///
/// Emits `Either<Failure, CallEvent>` for each call state change.
/// Consumers should handle both success and failure cases.
@riverpod
Stream<Either<Failure, CallEvent>> callEvents(Ref ref) {
  final repository = ref.watch(callDetectionRepositoryProvider);
  return repository.watchCallEvents();
}

/// Provider for checking phone permissions
@riverpod
Future<Either<Failure, bool>> hasPhonePermissions(
  Ref ref,
) async {
  final repository = ref.watch(callDetectionRepositoryProvider);
  return repository.hasPhonePermissions();
}

/// Provider for requesting phone permissions
@riverpod
Future<Either<Failure, bool>> requestPhonePermissions(
  Ref ref,
) async {
  final repository = ref.watch(callDetectionRepositoryProvider);
  return repository.requestPhonePermissions();
}
