import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/database/database_provider.dart';
import '../../data/datasources/call_log_local_datasource.dart';
import '../../data/repositories/call_log_repository_impl.dart';
import '../../domain/entities/call_log.dart';
import '../../domain/repositories/call_log_repository.dart';
import '../../domain/usecases/check_whitelist.dart';
import '../../domain/usecases/format_caller_id.dart';
import '../../domain/usecases/log_call.dart';
import '../../domain/usecases/update_call_state.dart';
import '../../data/providers/whitelist_provider.dart';
import '../services/call_log_service.dart';
import 'call_state_provider.dart';

part 'call_log_provider.g.dart';

/// Filter options for call log list
enum CallLogFilter {
  all,
  spoofingRisk,
}

/// Provides the CallLogLocalDataSource instance
@riverpod
CallLogLocalDataSource callLogLocalDataSource(Ref ref) {
  final database = ref.watch(appDatabaseProvider);
  return CallLogLocalDataSource(database);
}

/// Provides the CallLogRepository instance
@riverpod
CallLogRepository callLogRepository(Ref ref) {
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
Future<List<CallLog>> callLogList(Ref ref) async {
  final repository = ref.watch(callLogRepositoryProvider);
  final filter = ref.watch(callLogFilterProvider);

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
FormatCallerIdUseCase formatCallerIdUseCase(Ref ref) {
  return FormatCallerIdUseCase();
}

/// Provides the CheckWhitelistUseCase instance
@riverpod
CheckWhitelistUseCase checkWhitelistUseCase(Ref ref) {
  final repository = ref.watch(whitelistRepositoryProvider);
  return CheckWhitelistUseCase(repository);
}

/// Provides the LogCallUseCase instance
@riverpod
LogCallUseCase logCallUseCase(Ref ref) {
  final repository = ref.watch(callLogRepositoryProvider);
  return LogCallUseCase(repository);
}

/// Provides the UpdateCallStateUseCase instance
@riverpod
UpdateCallStateUseCase updateCallStateUseCase(Ref ref) {
  final repository = ref.watch(callLogRepositoryProvider);
  return UpdateCallStateUseCase(repository);
}


/// Provides the CallLogService instance
@riverpod
CallLogService callLogService(Ref ref) {
  final service = CallLogService(ref);
  
  // Listen to call events and handle them in the service
  ref.listen(callEventsProvider, (previous, next) {
    next.whenData((either) => service.handleEitherEvent(either));
  });
  
  return service;
}
