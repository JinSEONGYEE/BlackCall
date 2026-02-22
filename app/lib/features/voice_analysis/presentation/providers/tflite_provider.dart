import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/tflite_repository_impl.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/tflite_service.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/repositories/tflite_repository.dart';

part 'tflite_provider.g.dart';

/// Provides TFLiteService instance
@riverpod
TFLiteService tfliteService(Ref ref) {
  final service = TFLiteService();
  
  // Dispose service when provider is disposed
  ref.onDispose(() {
    service.disposeModel();
  });
  
  return service;
}

/// Provides TFLiteRepository instance
@riverpod
TFLiteRepository tfliteRepository(Ref ref) {
  final service = ref.watch(tfliteServiceProvider);
  return TFLiteRepositoryImpl(service);
}

/// Provides model loading state
///
/// Automatically loads the test model when the provider is first accessed.
/// This performs a "warm-up" to reduce first inference latency.
@riverpod
class TFLiteModelLoader extends _$TFLiteModelLoader {
  @override
  Future<void> build() async {
    final repository = ref.watch(tfliteRepositoryProvider);
    
    print('🔄 Loading TFLite model...');
    
    final result = await repository.loadModel('assets/models/test_model.tflite');
    
    result.fold(
      (failure) {
        print('❌ Failed to load TFLite model: ${failure.message}');
        throw Exception(failure.message);
      },
      (_) {
        print('✅ TFLite model loaded successfully');
      },
    );
  }
}
