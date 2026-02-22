import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/services/haptic_service.dart';

part 'haptic_provider.g.dart';

/// Provider for HapticService
@riverpod
HapticService hapticService(Ref ref) {
  return HapticService();
}
