import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import '../entities/app_settings.dart';

abstract class SettingsRepository {
  Future<Either<Failure, AppSettings>> fetchSettings();
  Future<Either<Failure, AppSettings>> updateSettings(AppSettings settings);
}
