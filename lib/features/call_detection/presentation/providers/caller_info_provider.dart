import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_event.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/caller_info.dart';
import 'package:voice_phishing_app/features/call_detection/domain/usecases/format_caller_id.dart';

part 'caller_info_provider.g.dart';

/// Provider for FormatCallerIdUseCase
@riverpod
FormatCallerIdUseCase formatCallerIdUseCase(FormatCallerIdUseCaseRef ref) {
  return FormatCallerIdUseCase();
}

/// Provider to transform CallEvent to CallerInfo
///
/// Takes a CallEvent and returns CallerInfo with formatted phone number.
@riverpod
CallerInfo formatCallEvent(FormatCallEventRef ref, CallEvent callEvent) {
  final formatUseCase = ref.watch(formatCallerIdUseCaseProvider);
  return formatUseCase.execute(callEvent);
}
