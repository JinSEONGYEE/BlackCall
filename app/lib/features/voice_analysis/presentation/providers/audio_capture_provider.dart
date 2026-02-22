import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/fraud_pattern_repository.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/custom_keyword_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/detection_history_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/services/audio_capture_service.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/fraud_pattern_definition_repository.dart';

part 'audio_capture_provider.g.dart';

/// Provides AudioCaptureService instance
@riverpod
AudioCaptureService audioCaptureService(Ref ref) {
  final customKeywordRepository = ref.watch(customKeywordRepositoryProvider);
  final fraudPatternRepository = ref.watch(fraudPatternRepositoryProvider);
  final fraudPatternDefinitionRepository = ref.watch(fraudPatternDefinitionRepositoryProvider);
  final service = AudioCaptureService(
    customKeywordRepository,
    fraudPatternRepository,
    fraudPatternDefinitionRepository,
  );
  service.initialize();
  
  // Cleanup on dispose
  ref.onDispose(() {
    print('🗑️ Disposing AudioCaptureService...');
    service.stopCapture();
  });
  
  return service;
}
