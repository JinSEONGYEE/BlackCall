# Core Module

This directory contains shared infrastructure code used across all features.

## Structure

- **config/** - Application configuration, environment variables, constants
- **error/** - Error handling utilities, custom exceptions, fpdart Either types
- **database/** - Drift database setup, migrations, and database providers
- **util/** - Shared utility functions, extensions, helpers

## Usage

Core modules provide foundational services that features depend on. They should:
- Be feature-agnostic
- Have minimal dependencies
- Be highly reusable
- Follow single responsibility principle

## Examples

### Config
```dart
// lib/core/config/app_config.dart
class AppConfig {
  static const String appName = 'Voice Phishing Prevention';
  static const int maxCallDuration = 3600; // seconds
}
```

### Error
```dart
// lib/core/error/failures.dart
import 'package:fpdart/fpdart.dart';

sealed class Failure {
  const Failure(this.message);
  final String message;
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}
```

### Database
```dart
// lib/core/database/app_database.dart
import 'package:drift/drift.dart';

@DriftDatabase(tables: [/* tables will be added in Story 1.4+ */])
class AppDatabase extends _$AppDatabase {
  // Database implementation
}
```

### Util
```dart
// lib/core/util/date_formatter.dart
class DateFormatter {
  static String formatCallTimestamp(DateTime timestamp) {
    // Utility implementation
  }
}
```
