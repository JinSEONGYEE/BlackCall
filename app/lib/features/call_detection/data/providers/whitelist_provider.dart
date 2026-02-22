import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/database/database_provider.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/whitelist_local_datasource.dart';
import 'package:voice_phishing_app/features/call_detection/data/repositories/whitelist_repository_impl.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/whitelist_repository.dart';

part 'whitelist_provider.g.dart';

/// Provider for WhitelistLocalDataSource
@Riverpod(keepAlive: true)
WhitelistLocalDataSource whitelistLocalDataSource(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return WhitelistLocalDataSource(database);
}

/// Provider for WhitelistRepository
@Riverpod(keepAlive: true)
WhitelistRepository whitelistRepository(Ref ref) {
  final dataSource = ref.watch(whitelistLocalDataSourceProvider);
  final dio = ref.watch(dioProvider);
  return WhitelistRepositoryImpl(dataSource, dio);
}
