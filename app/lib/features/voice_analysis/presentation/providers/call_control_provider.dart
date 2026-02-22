import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/services/call_control_service.dart';

part 'call_control_provider.g.dart';

/// Provider for CallControlService
@riverpod
CallControlService callControlService(Ref ref) {
  return CallControlService();
}
