import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../../domain/repositories/settings_repository.dart';
import '../repositories/settings_repository_impl.dart';

part 'settings_repository_provider.g.dart';

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return SettingsRepositoryImpl(dio);
}
