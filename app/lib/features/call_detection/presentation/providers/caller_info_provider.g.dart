// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caller_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for FormatCallerIdUseCase

@ProviderFor(formatCallerIdUseCase)
final formatCallerIdUseCaseProvider = FormatCallerIdUseCaseProvider._();

/// Provider for FormatCallerIdUseCase

final class FormatCallerIdUseCaseProvider
    extends
        $FunctionalProvider<
          FormatCallerIdUseCase,
          FormatCallerIdUseCase,
          FormatCallerIdUseCase
        >
    with $Provider<FormatCallerIdUseCase> {
  /// Provider for FormatCallerIdUseCase
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

/// Provider to transform CallEvent to CallerInfo
///
/// Takes a CallEvent and returns CallerInfo with formatted phone number.

@ProviderFor(formatCallEvent)
final formatCallEventProvider = FormatCallEventFamily._();

/// Provider to transform CallEvent to CallerInfo
///
/// Takes a CallEvent and returns CallerInfo with formatted phone number.

final class FormatCallEventProvider
    extends $FunctionalProvider<CallerInfo, CallerInfo, CallerInfo>
    with $Provider<CallerInfo> {
  /// Provider to transform CallEvent to CallerInfo
  ///
  /// Takes a CallEvent and returns CallerInfo with formatted phone number.
  FormatCallEventProvider._({
    required FormatCallEventFamily super.from,
    required CallEvent super.argument,
  }) : super(
         retry: null,
         name: r'formatCallEventProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$formatCallEventHash();

  @override
  String toString() {
    return r'formatCallEventProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<CallerInfo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CallerInfo create(Ref ref) {
    final argument = this.argument as CallEvent;
    return formatCallEvent(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CallerInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CallerInfo>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FormatCallEventProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$formatCallEventHash() => r'6f387c9f22db34834662d99a9340359d5b208e07';

/// Provider to transform CallEvent to CallerInfo
///
/// Takes a CallEvent and returns CallerInfo with formatted phone number.

final class FormatCallEventFamily extends $Family
    with $FunctionalFamilyOverride<CallerInfo, CallEvent> {
  FormatCallEventFamily._()
    : super(
        retry: null,
        name: r'formatCallEventProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider to transform CallEvent to CallerInfo
  ///
  /// Takes a CallEvent and returns CallerInfo with formatted phone number.

  FormatCallEventProvider call(CallEvent callEvent) =>
      FormatCallEventProvider._(argument: callEvent, from: this);

  @override
  String toString() => r'formatCallEventProvider';
}
