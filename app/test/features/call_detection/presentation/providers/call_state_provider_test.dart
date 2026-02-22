import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/providers/call_state_provider.dart';

void main() {
  group('Call State Providers', () {
    test('callDetectionPlatformChannelProvider should create instance', () {
      // Arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Act
      final platformChannel = container.read(callDetectionPlatformChannelProvider);

      // Assert
      expect(platformChannel, isNotNull);
    });

    test('callDetectionRepositoryProvider should create instance', () {
      // Arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Act
      final repository = container.read(callDetectionRepositoryProvider);

      // Assert
      expect(repository, isNotNull);
    });

    test('callEventsProvider should provide stream', () {
      // Arrange
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Act
      final streamProvider = container.read(callEventsProvider.future);

      // Assert
      expect(streamProvider, isA<Future>());
    });

    test('providers should be disposed correctly', () {
      // Arrange
      final container = ProviderContainer();

      // Act
      final platformChannel = container.read(callDetectionPlatformChannelProvider);
      final repository = container.read(callDetectionRepositoryProvider);

      expect(platformChannel, isNotNull);
      expect(repository, isNotNull);

      // Dispose container
      container.dispose();

      // Assert - no errors should occur during disposal
      expect(true, isTrue);
    });
  });
}
