import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import '../entities/detection_history.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<DetectionHistory>>> fetchHistory();
  Future<Either<Failure, DetectionHistory>> addHistory(DetectionHistory entry);
}
