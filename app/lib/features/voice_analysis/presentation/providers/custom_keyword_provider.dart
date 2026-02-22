import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/core/database/database_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/custom_keyword_repository.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/custom_keyword.dart';

part 'custom_keyword_provider.g.dart';

@Riverpod(keepAlive: true)
CustomKeywordRepository customKeywordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return CustomKeywordRepository(db);
}

@riverpod
class CustomKeywordsNotifier extends _$CustomKeywordsNotifier {
  @override
  FutureOr<List<CustomKeyword>> build() async {
    final repository = ref.watch(customKeywordRepositoryProvider);
    return repository.getAllKeywords();
  }

  Future<void> addKeyword(String keyword) async {
    final repository = ref.read(customKeywordRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repository.addKeyword(keyword);
      return repository.getAllKeywords();
    });
  }

  Future<void> removeKeyword(int id) async {
    final repository = ref.read(customKeywordRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repository.deleteKeyword(id);
      return repository.getAllKeywords();
    });
  }
}
