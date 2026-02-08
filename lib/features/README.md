# Features Module

This directory contains feature-specific code organized using Clean Architecture principles.

## Feature-First Organization

Each feature is self-contained in its own directory with three layers:
- **data/** - Data sources, repositories, models
- **domain/** - Business logic, entities, use cases
- **presentation/** - UI widgets, state management, view models

## Structure

```
features/
└── {feature_name}/
    ├── data/
    │   ├── datasources/    # API clients, local DB access
    │   ├── models/         # Data transfer objects (DTOs)
    │   └── repositories/   # Repository implementations
    ├── domain/
    │   ├── entities/       # Business objects
    │   ├── repositories/   # Repository interfaces
    │   └── usecases/       # Business logic
    └── presentation/
        ├── providers/      # Riverpod state providers
        ├── widgets/        # UI components
        └── pages/          # Full screen pages
```

## Upcoming Features

Features will be added in future stories:
- **call_detection** (Epic 2) - Call state monitoring, caller ID
- **voice_analysis** (Epic 3) - Real-time audio analysis, AI inference
- **warning_system** (Epic 4) - Alert UI, emergency response
- **user_settings** (Epic 5) - Configuration, history management
- **ios_caller_id** (Epic 6) - iOS Call Directory Extension

## Example Feature

```dart
// lib/features/call_detection/domain/entities/call_info.dart
class CallInfo {
  final String phoneNumber;
  final DateTime timestamp;
  final CallState state;
  
  const CallInfo({
    required this.phoneNumber,
    required this.timestamp,
    required this.state,
  });
}

// lib/features/call_detection/domain/usecases/detect_incoming_call.dart
class DetectIncomingCall {
  final CallRepository repository;
  
  Future<Either<Failure, CallInfo>> call(String phoneNumber) async {
    return repository.getCallInfo(phoneNumber);
  }
}

// lib/features/call_detection/presentation/providers/call_state_provider.dart
final callStateProvider = StateNotifierProvider<CallStateNotifier, CallState>(
  (ref) => CallStateNotifier(ref.read(detectIncomingCallProvider)),
);
```

## Principles

1. **Self-Contained**: Each feature should minimize dependencies on other features
2. **Clean Architecture**: Follow data → domain → presentation flow
3. **Testable**: Each layer should be independently testable
4. **Immutable**: Use Freezed for immutable state objects
5. **Functional**: Use fpdart Either for error handling (no throws)
