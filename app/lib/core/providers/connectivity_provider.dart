import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/detection_history_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/services/pattern_update_service.dart';

part 'connectivity_provider.g.dart';

/// Provider for connectivity status stream
@riverpod
Stream<List<ConnectivityResult>> connectivityStream(Ref ref) {
  return Connectivity().onConnectivityChanged;
}

/// Observer class to handle automatic pattern updates on connectivity changes
class ConnectivityObserver {
  final Ref _ref;
  bool _isFirstCheck = true;

  ConnectivityObserver(this._ref) {
    _listen();
  }

  void _listen() {
    _ref.listen(connectivityStreamProvider, (previous, next) {
      next.whenData((results) {
        final hasConnection = results.any((result) => 
          result == ConnectivityResult.wifi || 
          result == ConnectivityResult.mobile || 
          result == ConnectivityResult.ethernet);

        if (hasConnection) {
          // Trigger update only if it's the first check (app start) or a reconnection
          if (_isFirstCheck) {
            print('🌐 App started with connection. Checking for pattern updates...');
            _isFirstCheck = false;
            _triggerUpdate();
          } else {
            print('🌐 Connection established. Updating fraud patterns...');
            _triggerUpdate();
          }
        }
      });
    });
  }

  Future<void> _triggerUpdate() async {
    try {
      final updateService = _ref.read(patternUpdateServiceProvider);
      await updateService.updatePatterns();
    } catch (e) {
      print('❌ Automatic pattern update failed: $e');
    }
  }
}

/// Provider to initialize and keep the observer alive
@Riverpod(keepAlive: true)
ConnectivityObserver connectivityObserver(Ref ref) {
  return ConnectivityObserver(ref);
}
