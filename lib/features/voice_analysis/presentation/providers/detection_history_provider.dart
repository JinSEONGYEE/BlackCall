import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/core/database/database_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/fraud_pattern_repository.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/detection_history_item.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/fraud_pattern_definition_repository.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/pattern_update_service.dart';

/// Provider for FraudPatternRepository
final fraudPatternRepositoryProvider = Provider<FraudPatternRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return FraudPatternRepository(db);
});

/// Provider for the list of detection history items
final detectionHistoryProvider = FutureProvider<List<DetectionHistoryItem>>((ref) async {
  final repository = ref.watch(fraudPatternRepositoryProvider);
  return await repository.getDetectionHistory();
});

/// Provider for FraudPatternDefinitionRepository
final fraudPatternDefinitionRepositoryProvider = Provider<FraudPatternDefinitionRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return FraudPatternDefinitionRepository(db);
});

/// Provider for PatternUpdateService
final patternUpdateServiceProvider = Provider<PatternUpdateService>((ref) {
  final repository = ref.watch(fraudPatternDefinitionRepositoryProvider);
  return PatternUpdateService(repository);
});
