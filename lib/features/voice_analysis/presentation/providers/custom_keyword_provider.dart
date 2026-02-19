import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/core/database/database_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/data/repositories/custom_keyword_repository.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/custom_keyword.dart';

part 'custom_keyword_provider.g.dart';

@Riverpod(keepAlive: true)
CustomKeywordRepository customKeywordRepository(CustomKeywordRepositoryRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return CustomKeywordRepository(db);
}

@riverpod
class CustomKeywordsNotifier extends _$CustomKeywordsNotifier {
  late final CustomKeywordRepository _repository;

  @override
  FutureOr<List<CustomKeyword>> build() async {
    _repository = ref.watch(customKeywordRepositoryProvider);
    return _repository.getAllKeywords();
  }

  Future<void> addKeyword(String keyword) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.addKeyword(keyword);
      return _repository.getAllKeywords();
    });
  }

  Future<void> removeKeyword(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.deleteKeyword(id);
      return _repository.getAllKeywords();
    });
  }
}
