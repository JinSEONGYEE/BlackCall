# Test Directory

This directory contains all test files organized to mirror the source code structure.

## Structure

```
test/
├── core/              # Tests for core modules
│   ├── config/       # Configuration tests
│   ├── error/        # Error handling tests
│   ├── database/     # Database tests
│   └── util/         # Utility tests
├── features/         # Tests for feature modules
│   └── {feature}/    # Feature-specific tests
│       ├── data/     # Data layer tests
│       ├── domain/   # Domain layer tests
│       └── presentation/ # Presentation layer tests
└── widget_test.dart  # Main widget test

```

## Testing Principles

1. **Mirror Source Structure**: Test files should mirror the `lib/` directory structure
2. **Test Coverage**: Aim for high test coverage, especially for business logic
3. **Unit Tests**: Test individual functions and classes in isolation
4. **Widget Tests**: Test UI components and user interactions
5. **Integration Tests**: Test feature workflows end-to-end

## Test Patterns

### Unit Test Example
```dart
// test/core/util/date_formatter_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/core/util/date_formatter.dart';

void main() {
  group('DateFormatter', () {
    test('formatCallTimestamp returns correct format', () {
      final timestamp = DateTime(2024, 1, 1, 12, 30);
      final result = DateFormatter.formatCallTimestamp(timestamp);
      expect(result, '2024-01-01 12:30');
    });
  });
}
```

### Widget Test Example
```dart
// test/features/call_detection/presentation/widgets/call_info_card_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/widgets/call_info_card.dart';

void main() {
  testWidgets('CallInfoCard displays phone number', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CallInfoCard(phoneNumber: '010-1234-5678'),
        ),
      ),
    );
    
    expect(find.text('010-1234-5678'), findsOneWidget);
  });
}
```

### Riverpod Provider Test Example
```dart
// test/features/call_detection/presentation/providers/call_state_provider_test.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('callStateProvider initial state is idle', () {
    final container = ProviderContainer();
    final state = container.read(callStateProvider);
    
    expect(state, CallState.idle);
    container.dispose();
  });
}
```

## Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/core/util/date_formatter_test.dart

# Run tests with coverage
flutter test --coverage

# Run tests in watch mode
flutter test --watch
```

## Test Organization Guidelines

- **One test file per source file**: `lib/core/util/formatter.dart` → `test/core/util/formatter_test.dart`
- **Group related tests**: Use `group()` to organize related test cases
- **Descriptive test names**: Test names should clearly describe what is being tested
- **Arrange-Act-Assert**: Follow AAA pattern for test structure
- **Mock external dependencies**: Use mocks for repositories, APIs, databases

## Future Test Files

As features are added in Epic 2-6, corresponding test files will be created:
- `test/features/call_detection/` - Call detection tests
- `test/features/voice_analysis/` - Voice analysis tests
- `test/features/warning_system/` - Warning system tests
- `test/features/user_settings/` - User settings tests
- `test/features/ios_caller_id/` - iOS caller ID tests
