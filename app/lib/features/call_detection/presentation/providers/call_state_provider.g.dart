// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the call detection platform channel

@ProviderFor(callDetectionPlatformChannel)
final callDetectionPlatformChannelProvider =
    CallDetectionPlatformChannelProvider._();

/// Provider for the call detection platform channel

final class CallDetectionPlatformChannelProvider
    extends
        $FunctionalProvider<
          CallDetectionPlatformChannel,
          CallDetectionPlatformChannel,
          CallDetectionPlatformChannel
        >
    with $Provider<CallDetectionPlatformChannel> {
  /// Provider for the call detection platform channel
  CallDetectionPlatformChannelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'callDetectionPlatformChannelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$callDetectionPlatformChannelHash();

  @$internal
  @override
  $ProviderElement<CallDetectionPlatformChannel> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CallDetectionPlatformChannel create(Ref ref) {
    return callDetectionPlatformChannel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CallDetectionPlatformChannel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CallDetectionPlatformChannel>(value),
    );
  }
}

String _$callDetectionPlatformChannelHash() =>
    r'd53983b78cf87a3983b4655a0f7322e30f4dbf14';

/// Provider for the call detection repository

@ProviderFor(callDetectionRepository)
final callDetectionRepositoryProvider = CallDetectionRepositoryProvider._();

/// Provider for the call detection repository

final class CallDetectionRepositoryProvider
    extends
        $FunctionalProvider<
          CallDetectionRepository,
          CallDetectionRepository,
          CallDetectionRepository
        >
    with $Provider<CallDetectionRepository> {
  /// Provider for the call detection repository
  CallDetectionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'callDetectionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$callDetectionRepositoryHash();

  @$internal
  @override
  $ProviderElement<CallDetectionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CallDetectionRepository create(Ref ref) {
    return callDetectionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CallDetectionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CallDetectionRepository>(value),
    );
  }
}

String _$callDetectionRepositoryHash() =>
    r'dc7c8635551ed0514d241d832f34705a08ace712';

/// Stream provider for call events
///
/// Emits `Either<Failure, CallEvent>` for each call state change.
/// Consumers should handle both success and failure cases.

@ProviderFor(callEvents)
final callEventsProvider = CallEventsProvider._();

/// Stream provider for call events
///
/// Emits `Either<Failure, CallEvent>` for each call state change.
/// Consumers should handle both success and failure cases.

final class CallEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Either<Failure, CallEvent>>,
          Either<Failure, CallEvent>,
          Stream<Either<Failure, CallEvent>>
        >
    with
        $FutureModifier<Either<Failure, CallEvent>>,
        $StreamProvider<Either<Failure, CallEvent>> {
  /// Stream provider for call events
  ///
  /// Emits `Either<Failure, CallEvent>` for each call state change.
  /// Consumers should handle both success and failure cases.
  CallEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'callEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$callEventsHash();

  @$internal
  @override
  $StreamProviderElement<Either<Failure, CallEvent>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Either<Failure, CallEvent>> create(Ref ref) {
    return callEvents(ref);
  }
}

String _$callEventsHash() => r'91204e0fc806ab2912214e2af0d6104fc61bc551';

/// Provider for checking phone permissions

@ProviderFor(hasPhonePermissions)
final hasPhonePermissionsProvider = HasPhonePermissionsProvider._();

/// Provider for checking phone permissions

final class HasPhonePermissionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Either<Failure, bool>>,
          Either<Failure, bool>,
          FutureOr<Either<Failure, bool>>
        >
    with
        $FutureModifier<Either<Failure, bool>>,
        $FutureProvider<Either<Failure, bool>> {
  /// Provider for checking phone permissions
  HasPhonePermissionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasPhonePermissionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasPhonePermissionsHash();

  @$internal
  @override
  $FutureProviderElement<Either<Failure, bool>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Either<Failure, bool>> create(Ref ref) {
    return hasPhonePermissions(ref);
  }
}

String _$hasPhonePermissionsHash() =>
    r'37ddf00eeb0762457d2c7c2afeee2f89f22344b2';

/// Provider for requesting phone permissions

@ProviderFor(requestPhonePermissions)
final requestPhonePermissionsProvider = RequestPhonePermissionsProvider._();

/// Provider for requesting phone permissions

final class RequestPhonePermissionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Either<Failure, bool>>,
          Either<Failure, bool>,
          FutureOr<Either<Failure, bool>>
        >
    with
        $FutureModifier<Either<Failure, bool>>,
        $FutureProvider<Either<Failure, bool>> {
  /// Provider for requesting phone permissions
  RequestPhonePermissionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestPhonePermissionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$requestPhonePermissionsHash();

  @$internal
  @override
  $FutureProviderElement<Either<Failure, bool>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Either<Failure, bool>> create(Ref ref) {
    return requestPhonePermissions(ref);
  }
}

String _$requestPhonePermissionsHash() =>
    r'9f9965167a7533fef86979f0945b29de8df432f6';
