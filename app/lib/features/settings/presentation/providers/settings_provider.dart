import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/features/settings/data/providers/settings_repository_provider.dart';
import 'package:voice_phishing_app/features/settings/domain/entities/app_settings.dart';

part 'settings_provider.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Future<AppSettings> build() async {
    final repository = ref.watch(settingsRepositoryProvider);
    final result = await repository.fetchSettings();
    
    return result.fold(
      (failure) => throw failure.message,
      (settings) => settings,
    );
  }

  Future<void> updateSettings(AppSettings settings) async {
    final repository = ref.read(settingsRepositoryProvider);
    final result = await repository.updateSettings(settings);

    result.fold(
      (failure) => null, // Handle error UI if needed
      (updated) => state = AsyncData(updated),
    );
  }

  Future<void> toggleDetection(bool enabled) async {
    final current = state.value;
    if (current == null) return;
    
    final updated = current.copyWith(isDetectionEnabled: enabled);
    await updateSettings(updated);
  }
}
