import 'package:drift/native.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';

part 'database_provider.g.dart';

/// Provides the application database instance
///
/// This provider creates a singleton instance of [AppDatabase]
/// that will be disposed when the provider is disposed.
/// 
/// Note: keepAlive is set to true to ensure the database remains
/// open throughout the app lifecycle and is not auto-disposed.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(AppDatabaseRef ref) {
  final database = AppDatabase();
  
  // Ensure database is closed when provider is disposed
  ref.onDispose(() {
    database.close();
  });
  
  return database;
}

/// Provides a test database instance with in-memory storage
///
/// This should only be used in tests.
@riverpod
AppDatabase testDatabase(TestDatabaseRef ref) {
  final database = AppDatabase.forTesting(
    NativeDatabase.memory(),
  );
  
  ref.onDispose(() {
    database.close();
  });
  
  return database;
}
