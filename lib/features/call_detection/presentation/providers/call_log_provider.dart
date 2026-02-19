import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/call_log_local_datasource.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/whitelist_local_datasource.dart';
import 'package:voice_phishing_app/features/call_detection/data/repositories/call_log_repository_impl.dart';
import 'package:voice_phishing_app/features/call_detection/data/repositories/whitelist_repository_impl.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_log.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/call_log_repository.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/whitelist_repository.dart';
import 'package:voice_phishing_app/features/call_detection/domain/usecases/check_whitelist.dart';
import 'package:voice_phishing_app/features/call_detection/domain/usecases/format_caller_id.dart';
import 'package:voice_phishing_app/features/call_detection/domain/usecases/log_call.dart';
import 'package:voice_phishing_app/features/call_detection/domain/usecases/update_call_state.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/services/call_log_service.dart';

part 'call_log_provider.g.dart';

/// Filter options for call log list
enum CallLogFilter {
  all,
  spoofingRisk,
}

/// Provides the AppDatabase instance
@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

/// Provides the CallLogLocalDataSource instance
@riverpod
CallLogLocalDataSource callLogLocalDataSource(CallLogLocalDataSourceRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return CallLogLocalDataSource(database);
}

/// Provides the CallLogRepository instance
@riverpod
CallLogRepository callLogRepository(CallLogRepositoryRef ref) {
  final dataSource = ref.watch(callLogLocalDataSourceProvider);
  return CallLogRepositoryImpl(dataSource);
}

/// Provides the current call log filter state
@riverpod
class CallLogFilterNotifier extends _$CallLogFilterNotifier {
  @override
  CallLogFilter build() => CallLogFilter.all;

  void setFilter(CallLogFilter filter) {
    state = filter;
  }
}

/// Provides the list of call logs based on current filter
@riverpod
Future<List<CallLog>> callLogList(CallLogListRef ref) async {
  final repository = ref.watch(callLogRepositoryProvider);
  final filter = ref.watch(callLogFilterNotifierProvider);

  final result = filter == CallLogFilter.spoofingRisk
      ? await repository.getSpoofingRiskCalls()
      : await repository.getAllCallLogs();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (callLogs) => callLogs,
  );
}

// ============================================================================
// Use Case Providers for Call Logging
// ============================================================================

/// Provides the FormatCallerIdUseCase instance
@riverpod
FormatCallerIdUseCase formatCallerIdUseCase(FormatCallerIdUseCaseRef ref) {
  return FormatCallerIdUseCase();
}

/// Provides the CheckWhitelistUseCase instance
@riverpod
CheckWhitelistUseCase checkWhitelistUseCase(CheckWhitelistUseCaseRef ref) {
  final repository = ref.watch(whitelistRepositoryProvider);
  return CheckWhitelistUseCase(repository);
}

/// Provides the LogCallUseCase instance
@riverpod
LogCallUseCase logCallUseCase(LogCallUseCaseRef ref) {
  final repository = ref.watch(callLogRepositoryProvider);
  return LogCallUseCase(repository);
}

/// Provides the UpdateCallStateUseCase instance
@riverpod
UpdateCallStateUseCase updateCallStateUseCase(UpdateCallStateUseCaseRef ref) {
  final repository = ref.watch(callLogRepositoryProvider);
  return UpdateCallStateUseCase(repository);
}

/// Provides the WhitelistRepository instance
@riverpod
WhitelistRepository whitelistRepository(WhitelistRepositoryRef ref) {
  final database = ref.watch(appDatabaseProvider);
  final dataSource = WhitelistLocalDataSource(database);
  return WhitelistRepositoryImpl(dataSource);
}

/// Provides the CallLogService instance
@riverpod
CallLogService callLogService(CallLogServiceRef ref) {
  final service = CallLogService(ref);
  // Start listening when provider is created
  service.startListening();
  
  // Dispose when provider is disposed
  ref.onDispose(() {
    service.dispose();
  });
  
  return service;
}
