import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/custom_keyword_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/detection_history_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/services/audio_capture_service.dart';

/// Provides AudioCaptureService instance
///
/// Service is initialized on first access and disposed when provider is disposed.
/// Automatically stops audio capture on disposal to prevent resource leaks.
final audioCaptureServiceProvider = Provider<AudioCaptureService>((ref) {
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
  ref.onDispose(() async {
    print('🗑️ Disposing AudioCaptureService...');
    await service.stopCapture();
  });
  
  return service;
});
