import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/history/data/repositories/history_sync_service.dart';
import '../../features/call_detection/presentation/providers/whitelist_sync_provider.dart';
import '../../features/settings/data/providers/settings_repository_provider.dart';
import '../../features/voice_analysis/data/providers/fraud_repository_provider.dart';

part 'sync_service.g.dart';

@Riverpod(keepAlive: true)
class SyncService extends _$SyncService {
  @override
  void build() {
    // Listen to Auth State
    ref.listen(authProvider, (previous, next) {
      if (next.status == AuthStatus.loggedIn) {
        _triggerFullSync();
      }
    });
  }

  Future<void> _triggerFullSync() async {
    print('🔄 SyncService: Starting full sync...');
    
    try {
      // 1. Sync History
      await ref.read(historySyncServiceProvider.notifier).syncLocalLogsToServer();
      print('✅ SyncService: History synced');

      // 2. Sync Whitelist
      await ref.read(whitelistSyncProvider.notifier).sync();
      print('✅ SyncService: Whitelist synced');

      // 3. Fetch Latest Fraud Patterns
      final fraudRepo = ref.read(fraudRepositoryProvider);
      await fraudRepo.fetchFraudPatterns();
      print('✅ SyncService: Fraud patterns updated');

      // 4. Fetch App Settings
      final settingsRepo = ref.read(settingsRepositoryProvider);
      await settingsRepo.fetchSettings();
      print('✅ SyncService: Settings updated');

    } catch (e) {
      print('❌ SyncService: Full sync failed: $e');
    }
  }
}
