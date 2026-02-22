import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/core/database/database_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/detection_history_item.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/fraud_pattern_repository.dart';

part 'detection_history_provider.g.dart';

@riverpod
Future<List<DetectionHistoryItem>> detectionHistory(Ref ref) async {
  final repository = ref.watch(fraudPatternRepositoryProvider);
  return await repository.getDetectionHistory();
}
