import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/tflite_provider.dart';

/// Simple test screen to verify TFLite model loading and inference
class TFLiteTestScreen extends ConsumerWidget {
  const TFLiteTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelLoaderAsync = ref.watch(tFLiteModelLoaderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TFLite Model Test'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Model loading status
            modelLoaderAsync.when(
              data: (_) => const Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 64),
                  SizedBox(height: 16),
                  Text(
                    '✅ Model Loaded Successfully!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              loading: () => const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading TFLite model...'),
                ],
              ),
              error: (error, stack) => Column(
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 64),
                  const SizedBox(height: 16),
                  Text(
                    '❌ Error: $error',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Test inference button
            ElevatedButton(
              onPressed: modelLoaderAsync.hasValue
                  ? () => _testInference(context, ref)
                  : null,
              child: const Text('Run Test Inference'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _testInference(BuildContext context, WidgetRef ref) async {
    final repository = ref.read(tfliteRepositoryProvider);
    
    // Create dummy audio data (1 second @ 16kHz)
    final dummyAudio = List.filled(16000, 0.0);
    
    // Show loading dialog
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    
    // Run inference
    final result = await repository.runInference(dummyAudio);
    
    // Close loading dialog
    if (!context.mounted) return;
    Navigator.of(context).pop();
    
    // Show result
    result.fold(
      (failure) {
        if (!context.mounted) return;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('❌ Inference Failed'),
            content: Text(failure.message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      (inferenceResult) {
        if (!context.mounted) return;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('✅ Inference Success'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Inference Time: ${inferenceResult.inferenceTimeMs}ms'),
                const SizedBox(height: 8),
                Text('Output Size: ${inferenceResult.output.length}'),
                const SizedBox(height: 8),
                Text(
                  'First 5 values: ${inferenceResult.output.take(5).toList()}',
                ),
                const SizedBox(height: 8),
                Text(
                  inferenceResult.inferenceTimeMs < 100
                      ? '✅ Performance: PASS (<100ms)'
                      : '❌ Performance: FAIL (>100ms)',
                  style: TextStyle(
                    color: inferenceResult.inferenceTimeMs < 100
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
