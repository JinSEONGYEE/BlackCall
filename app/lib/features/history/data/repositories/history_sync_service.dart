import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/detection_history.dart';
import '../providers/history_repository_provider.dart';
import '../../../voice_analysis/data/repositories/fraud_pattern_repository.dart';

part 'history_sync_service.g.dart';

@Riverpod(keepAlive: true)
class HistorySyncService extends _$HistorySyncService {
  @override
  void build() {}

  /// Sync local detection logs to the server
  Future<void> syncLocalLogsToServer() async {
    final historyRepo = ref.read(historyRepositoryProvider);
    final fraudRepo = ref.read(fraudPatternRepositoryProvider);

    // 1. Get local history items
    final localItems = await fraudRepo.getDetectionHistory();

    // 2. Fetch server history to avoid duplicates (simplified approach)
    final serverResult = await historyRepo.fetchHistory();
    final serverItems = serverResult.getOrElse((_) => []);
    
    // Create a set of existing server IDs or unique identifiers
    // For simplicity, we assume if we have local items, we try to add them
    // A more robust way would involve tracking 'synced' status in the local DB
    
    for (final item in localItems) {
      // Check if already synced (this is a simplified check)
      final alreadySynced = serverItems.any((s) => 
        s.detectedAt == item.timestamp && s.detectionType == item.patternType
      );

      if (!alreadySynced) {
        final entry = DetectionHistory(
          phoneNumberHash: item.phoneNumber, // Note: In a real app, use the actual hash
          detectedAt: item.timestamp,
          detectionType: item.patternType,
          confidence: item.confidence,
          details: item.detectedKeywords,
        );
        
        await historyRepo.addHistory(entry);
      }
    }
  }
}
