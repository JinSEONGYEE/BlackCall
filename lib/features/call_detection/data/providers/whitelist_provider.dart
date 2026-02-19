import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/core/database/database_provider.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/whitelist_local_datasource.dart';
import 'package:voice_phishing_app/features/call_detection/data/repositories/whitelist_repository_impl.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/whitelist_repository.dart';

part 'whitelist_provider.g.dart';

/// Provider for WhitelistLocalDataSource
@Riverpod(keepAlive: true)
WhitelistLocalDataSource whitelistLocalDataSource(
    WhitelistLocalDataSourceRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return WhitelistLocalDataSource(database);
}

/// Provider for WhitelistRepository
@Riverpod(keepAlive: true)
WhitelistRepository whitelistRepository(WhitelistRepositoryRef ref) {
  final dataSource = ref.watch(whitelistLocalDataSourceProvider);
  return WhitelistRepositoryImpl(dataSource);
}
