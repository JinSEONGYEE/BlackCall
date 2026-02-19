// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6';

/// Provides the AppDatabase instance
///
/// Copied from [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = AutoDisposeProvider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDatabaseRef = AutoDisposeProviderRef<AppDatabase>;
String _$callLogLocalDataSourceHash() => r'b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7';

/// Provides the CallLogLocalDataSource instance
///
/// Copied from [callLogLocalDataSource].
@ProviderFor(callLogLocalDataSource)
final callLogLocalDataSourceProvider =
    AutoDisposeProvider<CallLogLocalDataSource>.internal(
  callLogLocalDataSource,
  name: r'callLogLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$callLogLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CallLogLocalDataSourceRef
    = AutoDisposeProviderRef<CallLogLocalDataSource>;
String _$callLogRepositoryHash() => r'c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8';

/// Provides the CallLogRepository instance
///
/// Copied from [callLogRepository].
@ProviderFor(callLogRepository)
final callLogRepositoryProvider =
    AutoDisposeProvider<CallLogRepository>.internal(
  callLogRepository,
  name: r'callLogRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$callLogRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CallLogRepositoryRef = AutoDisposeProviderRef<CallLogRepository>;
String _$callLogListHash() => r'd4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9';

/// Provides the list of call logs based on current filter
///
/// Copied from [callLogList].
@ProviderFor(callLogList)
final callLogListProvider = AutoDisposeFutureProvider<List<CallLog>>.internal(
  callLogList,
  name: r'callLogListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$callLogListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CallLogListRef = AutoDisposeFutureProviderRef<List<CallLog>>;
String _$callLogFilterNotifierHash() => r'e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0';

/// Provides the current call log filter state
///
/// Copied from [CallLogFilterNotifier].
@ProviderFor(CallLogFilterNotifier)
final callLogFilterNotifierProvider = AutoDisposeNotifierProvider<
    CallLogFilterNotifier, CallLogFilter>.internal(
  CallLogFilterNotifier.new,
  name: r'callLogFilterNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$callLogFilterNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CallLogFilterNotifier = AutoDisposeNotifier<CallLogFilter>;
String _$formatCallerIdUseCaseHash() => r'f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1';

/// Provides the FormatCallerIdUseCase instance
///
/// Copied from [formatCallerIdUseCase].
@ProviderFor(formatCallerIdUseCase)
final formatCallerIdUseCaseProvider =
    AutoDisposeProvider<FormatCallerIdUseCase>.internal(
  formatCallerIdUseCase,
  name: r'formatCallerIdUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formatCallerIdUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormatCallerIdUseCaseRef = AutoDisposeProviderRef<FormatCallerIdUseCase>;
String _$checkWhitelistUseCaseHash() => r'a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2';

/// Provides the CheckWhitelistUseCase instance
///
/// Copied from [checkWhitelistUseCase].
@ProviderFor(checkWhitelistUseCase)
final checkWhitelistUseCaseProvider =
    AutoDisposeProvider<CheckWhitelistUseCase>.internal(
  checkWhitelistUseCase,
  name: r'checkWhitelistUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkWhitelistUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CheckWhitelistUseCaseRef = AutoDisposeProviderRef<CheckWhitelistUseCase>;
String _$logCallUseCaseHash() => r'b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3';

/// Provides the LogCallUseCase instance
///
/// Copied from [logCallUseCase].
@ProviderFor(logCallUseCase)
final logCallUseCaseProvider = AutoDisposeProvider<LogCallUseCase>.internal(
  logCallUseCase,
  name: r'logCallUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logCallUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LogCallUseCaseRef = AutoDisposeProviderRef<LogCallUseCase>;
String _$updateCallStateUseCaseHash() => r'c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4';

/// Provides the UpdateCallStateUseCase instance
///
/// Copied from [updateCallStateUseCase].
@ProviderFor(updateCallStateUseCase)
final updateCallStateUseCaseProvider =
    AutoDisposeProvider<UpdateCallStateUseCase>.internal(
  updateCallStateUseCase,
  name: r'updateCallStateUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateCallStateUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpdateCallStateUseCaseRef
    = AutoDisposeProviderRef<UpdateCallStateUseCase>;
String _$whitelistRepositoryHash() => r'd0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5';

/// Provides the WhitelistRepository instance
///
/// Copied from [whitelistRepository].
@ProviderFor(whitelistRepository)
final whitelistRepositoryProvider =
    AutoDisposeProvider<WhitelistRepository>.internal(
  whitelistRepository,
  name: r'whitelistRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$whitelistRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WhitelistRepositoryRef = AutoDisposeProviderRef<WhitelistRepository>;
String _$callLogServiceHash() => r'e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6';

/// Provides the CallLogService instance
///
/// Copied from [callLogService].
@ProviderFor(callLogService)
final callLogServiceProvider = AutoDisposeProvider<CallLogService>.internal(
  callLogService,
  name: r'callLogServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$callLogServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CallLogServiceRef = AutoDisposeProviderRef<CallLogService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
