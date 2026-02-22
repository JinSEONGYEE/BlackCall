import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/pattern_recognition_service.dart';

part 'pattern_recognition_provider.g.dart';

/// Provider for PatternRecognitionService
@riverpod
PatternRecognitionService patternRecognitionService(Ref ref) {
  final service = PatternRecognitionService();
  
  ref.onDispose(() {
    service.reset();
  });
  
  return service;
}
