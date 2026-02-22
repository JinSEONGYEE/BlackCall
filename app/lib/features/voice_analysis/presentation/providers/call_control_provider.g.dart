// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_control_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for CallControlService

@ProviderFor(callControlService)
final callControlServiceProvider = CallControlServiceProvider._();

/// Provider for CallControlService

final class CallControlServiceProvider
    extends
        $FunctionalProvider<
          CallControlService,
          CallControlService,
          CallControlService
        >
    with $Provider<CallControlService> {
  /// Provider for CallControlService
  CallControlServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'callControlServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$callControlServiceHash();

  @$internal
  @override
  $ProviderElement<CallControlService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CallControlService create(Ref ref) {
    return callControlService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CallControlService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CallControlService>(value),
    );
  }
}

String _$callControlServiceHash() =>
    r'8681e8ef2acc1080e0232e368a0454ee84926b0c';
