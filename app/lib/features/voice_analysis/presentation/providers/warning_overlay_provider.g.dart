// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_overlay_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for GlobalNavigatorKey.

@ProviderFor(navigatorKey)
final navigatorKeyProvider = NavigatorKeyProvider._();

/// Provider for GlobalNavigatorKey.

final class NavigatorKeyProvider
    extends
        $FunctionalProvider<
          GlobalKey<NavigatorState>,
          GlobalKey<NavigatorState>,
          GlobalKey<NavigatorState>
        >
    with $Provider<GlobalKey<NavigatorState>> {
  /// Provider for GlobalNavigatorKey.
  NavigatorKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigatorKeyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigatorKeyHash();

  @$internal
  @override
  $ProviderElement<GlobalKey<NavigatorState>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GlobalKey<NavigatorState> create(Ref ref) {
    return navigatorKey(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalKey<NavigatorState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalKey<NavigatorState>>(value),
    );
  }
}

String _$navigatorKeyHash() => r'6e9d7249fe86101ea2092a8617d10993370d5975';

/// Provider for WarningOverlayService.

@ProviderFor(warningOverlayService)
final warningOverlayServiceProvider = WarningOverlayServiceProvider._();

/// Provider for WarningOverlayService.

final class WarningOverlayServiceProvider
    extends
        $FunctionalProvider<
          WarningOverlayService,
          WarningOverlayService,
          WarningOverlayService
        >
    with $Provider<WarningOverlayService> {
  /// Provider for WarningOverlayService.
  WarningOverlayServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'warningOverlayServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$warningOverlayServiceHash();

  @$internal
  @override
  $ProviderElement<WarningOverlayService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WarningOverlayService create(Ref ref) {
    return warningOverlayService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WarningOverlayService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WarningOverlayService>(value),
    );
  }
}

String _$warningOverlayServiceHash() =>
    r'327f36ad771a812cf05acef24d6b34780dda74ab';
