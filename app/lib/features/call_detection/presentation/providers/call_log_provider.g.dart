// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the CallLogLocalDataSource instance

@ProviderFor(callLogLocalDataSource)
final callLogLocalDataSourceProvider = CallLogLocalDataSourceProvider._();

/// Provides the CallLogLocalDataSource instance

final class CallLogLocalDataSourceProvider
    extends
        $FunctionalProvider<
          CallLogLocalDataSource,
          CallLogLocalDataSource,
          CallLogLocalDataSource
        >
    with $Provider<CallLogLocalDataSource> {
  /// Provides the CallLogLocalDataSource instance
  CallLogLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'callLogLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$callLogLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<CallLogLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CallLogLocalDataSource create(Ref ref) {
    return callLogLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CallLogLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CallLogLocalDataSource>(value),
    );
  }
}

String _$callLogLocalDataSourceHash() =>
    r'67a6e4c60bf03582422d0687ca67162425e11817';

/// Provides the CallLogRepository instance

@ProviderFor(callLogRepository)
final callLogRepositoryProvider = CallLogRepositoryProvider._();

/// Provides the CallLogRepository instance

final class CallLogRepositoryProvider
    extends
        $FunctionalProvider<
          CallLogRepository,
          CallLogRepository,
          CallLogRepository
        >
    with $Provider<CallLogRepository> {
  /// Provides the CallLogRepository instance
  CallLogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'callLogRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$callLogRepositoryHash();

  @$internal
  @override
  $ProviderElement<CallLogRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CallLogRepository create(Ref ref) {
    return callLogRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CallLogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CallLogRepository>(value),
    );
  }
}

String _$callLogRepositoryHash() => r'de2594cee812d46a9780b712a31c3038d560c86d';

/// Provides the current call log filter state

@ProviderFor(CallLogFilterNotifier)
final callLogFilterProvider = CallLogFilterNotifierProvider._();

/// Provides the current call log filter state
final class CallLogFilterNotifierProvider
    extends $NotifierProvider<CallLogFilterNotifier, CallLogFilter> {
  /// Provides the current call log filter state
  CallLogFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'callLogFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$callLogFilterNotifierHash();

  @$internal
  @override
  CallLogFilterNotifier create() => CallLogFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CallLogFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CallLogFilter>(value),
    );
  }
}

String _$callLogFilterNotifierHash() =>
    r'a9ba1e727589792b40cb5359f4eebf57a09720e2';

/// Provides the current call log filter state

abstract class _$CallLogFilterNotifier extends $Notifier<CallLogFilter> {
  CallLogFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CallLogFilter, CallLogFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CallLogFilter, CallLogFilter>,
              CallLogFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Provides the list of call logs based on current filter

@ProviderFor(callLogList)
final callLogListProvider = CallLogListProvider._();

/// Provides the list of call logs based on current filter

final class CallLogListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CallLog>>,
          List<CallLog>,
          FutureOr<List<CallLog>>
        >
    with $FutureModifier<List<CallLog>>, $FutureProvider<List<CallLog>> {
  /// Provides the list of call logs based on current filter
  CallLogListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'callLogListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$callLogListHash();

  @$internal
  @override
  $FutureProviderElement<List<CallLog>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CallLog>> create(Ref ref) {
    return callLogList(ref);
  }
}

String _$callLogListHash() => r'37af180fefc6abfb9f0adcc24ea4384eb64e84bd';

/// Provides the FormatCallerIdUseCase instance

@ProviderFor(formatCallerIdUseCase)
final formatCallerIdUseCaseProvider = FormatCallerIdUseCaseProvider._();

/// Provides the FormatCallerIdUseCase instance

final class FormatCallerIdUseCaseProvider
    extends
        $FunctionalProvider<
          FormatCallerIdUseCase,
          FormatCallerIdUseCase,
          FormatCallerIdUseCase
        >
    with $Provider<FormatCallerIdUseCase> {
  /// Provides the FormatCallerIdUseCase instance
  FormatCallerIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'formatCallerIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$formatCallerIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<FormatCallerIdUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FormatCallerIdUseCase create(Ref ref) {
    return formatCallerIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FormatCallerIdUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FormatCallerIdUseCase>(value),
    );
  }
}

String _$formatCallerIdUseCaseHash() =>
    r'6e6008ee4643e098850cbd07e34e98cbd0f9ee7e';

/// Provides the CheckWhitelistUseCase instance

@ProviderFor(checkWhitelistUseCase)
final checkWhitelistUseCaseProvider = CheckWhitelistUseCaseProvider._();

/// Provides the CheckWhitelistUseCase instance

final class CheckWhitelistUseCaseProvider
    extends
        $FunctionalProvider<
          CheckWhitelistUseCase,
          CheckWhitelistUseCase,
          CheckWhitelistUseCase
        >
    with $Provider<CheckWhitelistUseCase> {
  /// Provides the CheckWhitelistUseCase instance
  CheckWhitelistUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkWhitelistUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkWhitelistUseCaseHash();

  @$internal
  @override
  $ProviderElement<CheckWhitelistUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckWhitelistUseCase create(Ref ref) {
    return checkWhitelistUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckWhitelistUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckWhitelistUseCase>(value),
    );
  }
}

String _$checkWhitelistUseCaseHash() =>
    r'79830467562957d134985d872c368eb2341146b0';

/// Provides the LogCallUseCase instance

@ProviderFor(logCallUseCase)
final logCallUseCaseProvider = LogCallUseCaseProvider._();

/// Provides the LogCallUseCase instance

final class LogCallUseCaseProvider
    extends $FunctionalProvider<LogCallUseCase, LogCallUseCase, LogCallUseCase>
    with $Provider<LogCallUseCase> {
  /// Provides the LogCallUseCase instance
  LogCallUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logCallUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logCallUseCaseHash();

  @$internal
  @override
  $ProviderElement<LogCallUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogCallUseCase create(Ref ref) {
    return logCallUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogCallUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogCallUseCase>(value),
    );
  }
}

String _$logCallUseCaseHash() => r'33fe16a20fec1e050dc809d81a1ba630dd194ab9';

/// Provides the UpdateCallStateUseCase instance

@ProviderFor(updateCallStateUseCase)
final updateCallStateUseCaseProvider = UpdateCallStateUseCaseProvider._();

/// Provides the UpdateCallStateUseCase instance

final class UpdateCallStateUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateCallStateUseCase,
          UpdateCallStateUseCase,
          UpdateCallStateUseCase
        >
    with $Provider<UpdateCallStateUseCase> {
  /// Provides the UpdateCallStateUseCase instance
  UpdateCallStateUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateCallStateUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateCallStateUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateCallStateUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateCallStateUseCase create(Ref ref) {
    return updateCallStateUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateCallStateUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateCallStateUseCase>(value),
    );
  }
}

String _$updateCallStateUseCaseHash() =>
    r'a1bd402a11312975db3b4d04df2263e4b6f290cd';

/// Provides the CallLogService instance

@ProviderFor(callLogService)
final callLogServiceProvider = CallLogServiceProvider._();

/// Provides the CallLogService instance

final class CallLogServiceProvider
    extends $FunctionalProvider<CallLogService, CallLogService, CallLogService>
    with $Provider<CallLogService> {
  /// Provides the CallLogService instance
  CallLogServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'callLogServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$callLogServiceHash();

  @$internal
  @override
  $ProviderElement<CallLogService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CallLogService create(Ref ref) {
    return callLogService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CallLogService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CallLogService>(value),
    );
  }
}

String _$callLogServiceHash() => r'99fb559d478d92e07cfabac9fa9b252309445813';
