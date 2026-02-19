import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/keyword_spotting_service.dart';

part 'keyword_spotting_provider.g.dart';

/// Provides KeywordSpottingService instance
///
/// Service is initialized on first access and disposed when provider is disposed.
@riverpod
KeywordSpottingService keywordSpottingService(KeywordSpottingServiceRef ref) {
  final service = KeywordSpottingService();
  
  // Cleanup on dispose
  ref.onDispose(() {
    print('🧹 Disposing KeywordSpottingService');
    service.reset();
  });
  
  return service;
}
