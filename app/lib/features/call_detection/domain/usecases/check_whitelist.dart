import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failure.dart';
import 'package:voice_phishing_app/core/util/phone_number_hasher.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/whitelist_repository.dart';

/// Use case for checking if a phone number is whitelisted
///
/// Takes a raw phone number, hashes it, and checks if it exists in the whitelist.
class CheckWhitelistUseCase {
  final WhitelistRepository _repository;

  CheckWhitelistUseCase(this._repository);

  /// Executes the use case
  ///
  /// [phoneNumber] - Raw phone number to check (will be normalized and hashed)
  ///
  /// Returns `Right(true)` if whitelisted, `Right(false)` if not.
  /// Returns `Left(Failure)` if an error occurs.
  Future<Either<Failure, bool>> execute(String phoneNumber) async {
    // Hash the phone number
    final hash = PhoneNumberHasher.hash(phoneNumber);

    // Check if hash exists in whitelist
    return await _repository.isWhitelisted(hash);
  }
}
