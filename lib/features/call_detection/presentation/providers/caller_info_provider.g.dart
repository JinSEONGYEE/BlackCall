// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caller_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formatCallerIdUseCaseHash() =>
    r'5f8e9a7b6c4d3e2f1a0b9c8d7e6f5a4b3c2d1e0f';

/// Provider for FormatCallerIdUseCase
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
String _$formatCallEventHash() => r'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0';

/// Provider to transform CallEvent to CallerInfo
///
/// Takes a CallEvent and returns CallerInfo with formatted phone number.
///
/// Copied from [formatCallEvent].
@ProviderFor(formatCallEvent)
final formatCallEventProvider = AutoDisposeProvider<CallerInfo>.internal(
  formatCallEvent,
  name: r'formatCallEventProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$formatCallEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormatCallEventRef = AutoDisposeProviderRef<CallerInfo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
