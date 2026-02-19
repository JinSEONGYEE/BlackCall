import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failures.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/whitelist_repository.dart';

/// Use case for syncing contacts from address book to whitelist
///
/// Fetches all contacts with phone numbers and adds them to the whitelist.
class SyncContactsToWhitelistUseCase {
  final WhitelistRepository _repository;

  SyncContactsToWhitelistUseCase(this._repository);

  /// Executes the use case
  ///
  /// Returns `Right(int)` with count of synced contacts on success.
  /// Returns `Left(Failure)` if an error occurs.
  Future<Either<Failure, int>> execute() async {
    return await _repository.syncContactsToWhitelist();
  }
}
