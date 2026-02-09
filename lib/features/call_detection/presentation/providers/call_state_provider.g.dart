// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$callDetectionPlatformChannelHash() =>
    r'8a7b6c5d4e3f2a1b9c8d7e6f5a4b3c2d';

/// Provider for the call detection platform channel
///
/// Copied from [callDetectionPlatformChannel].
@ProviderFor(callDetectionPlatformChannel)
final callDetectionPlatformChannelProvider =
    AutoDisposeProvider<CallDetectionPlatformChannel>.internal(
  callDetectionPlatformChannel,
  name: r'callDetectionPlatformChannelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$callDetectionPlatformChannelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CallDetectionPlatformChannelRef
    = AutoDisposeProviderRef<CallDetectionPlatformChannel>;
String _$callDetectionRepositoryHash() =>
    r'1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d';

/// Provider for the call detection repository
///
/// Copied from [callDetectionRepository].
@ProviderFor(callDetectionRepository)
final callDetectionRepositoryProvider =
    AutoDisposeProvider<CallDetectionRepository>.internal(
  callDetectionRepository,
  name: r'callDetectionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$callDetectionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CallDetectionRepositoryRef
    = AutoDisposeProviderRef<CallDetectionRepository>;
String _$callEventsHash() => r'2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e';

/// Stream provider for call events
///
/// Emits Either<Failure, CallEvent> for each call state change.
/// Consumers should handle both success and failure cases.
///
/// Copied from [callEvents].
@ProviderFor(callEvents)
final callEventsProvider =
    AutoDisposeStreamProvider<Either<Failure, CallEvent>>.internal(
  callEvents,
  name: r'callEventsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$callEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CallEventsRef = AutoDisposeStreamProviderRef<Either<Failure, CallEvent>>;
String _$hasPhonePermissionsHash() => r'3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f';

/// Provider for checking phone permissions
///
/// Copied from [hasPhonePermissions].
@ProviderFor(hasPhonePermissions)
final hasPhonePermissionsProvider =
    AutoDisposeFutureProvider<Either<Failure, bool>>.internal(
  hasPhonePermissions,
  name: r'hasPhonePermissionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasPhonePermissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HasPhonePermissionsRef
    = AutoDisposeFutureProviderRef<Either<Failure, bool>>;
String _$requestPhonePermissionsHash() =>
    r'4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a';

/// Provider for requesting phone permissions
///
/// Copied from [requestPhonePermissions].
@ProviderFor(requestPhonePermissions)
final requestPhonePermissionsProvider =
    AutoDisposeFutureProvider<Either<Failure, bool>>.internal(
  requestPhonePermissions,
  name: r'requestPhonePermissionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requestPhonePermissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RequestPhonePermissionsRef
    = AutoDisposeFutureProviderRef<Either<Failure, bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
