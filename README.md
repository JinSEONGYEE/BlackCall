# Voice Phishing Prevention App

Real-time fraud detection during phone calls using AI and behavioral analysis.

## Overview

This Flutter application provides real-time voice phishing detection to protect users from phone scams. The app uses TensorFlow Lite for on-device AI analysis and runs background services to monitor incoming calls.

## Tech Stack

- **Framework:** Flutter 3.10.8+
- **State Management:** Riverpod 2.x with code generation
- **Database:** Drift (SQLite)
- **AI/ML:** TensorFlow Lite
- **Architecture:** Clean Architecture (Feature-first)
- **Error Handling:** fpdart (Functional)

## Development Setup

### Prerequisites

- Flutter SDK 3.10.8 or higher
- Dart SDK 3.10.8 or higher
- Android SDK (for Android development)
- Xcode (for iOS development)

### Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd voice_phishing_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Code Generation

This project uses code generation for Riverpod providers, Freezed models, and JSON serialization.

**Generate code once:**
```bash
dart run build_runner build --delete-conflicting-outputs
```

**Watch for changes and auto-regenerate:**
```bash
dart run build_runner watch --delete-conflicting-outputs
```

**Clean generated files:**
```bash
dart run build_runner clean
```

> **Note:** There is a known compatibility issue with `build_runner` and `analyzer_plugin`. See `CODE_GENERATION.md` for details.

### Code Quality

**Run static analysis:**
```bash
flutter analyze
```

**Run tests:**
```bash
flutter test
```

## Project Structure

```
lib/
├── core/              # Shared infrastructure
│   ├── config/        # App configuration
│   ├── error/         # Error handling
│   ├── database/      # Database setup
│   └── util/          # Utilities
└── features/          # Feature modules (Clean Architecture)
    └── [feature]/
        ├── data/      # Data sources, repositories
        ├── domain/    # Entities, use cases
        └── presentation/ # UI, state management
```

## Documentation

- `CODE_GENERATION.md` - Code generation setup and usage
- `lib/core/README.md` - Core module documentation
- `lib/features/README.md` - Feature architecture guide
- `test/README.md` - Testing guidelines

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Drift Documentation](https://drift.simonbinder.eu/)
