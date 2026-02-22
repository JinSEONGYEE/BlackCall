import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/vad_service.dart';

part 'vad_provider.g.dart';

/// Provides VadService instance
///
/// Service is initialized on first access and disposed when provider is disposed.
@riverpod
VadService vadService(Ref ref) {
  final service = VadService();
  
  // Cleanup on dispose
  ref.onDispose(() {
    service.reset();
  });
  
  return service;
}
