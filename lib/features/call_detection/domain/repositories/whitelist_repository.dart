import 'package:fpdart/fpdart.dart';
import 'package:voice_phishing_app/core/error/failures.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/whitelist_entry.dart';

/// Repository interface for whitelist operations
///
/// Defines the contract for managing whitelisted contacts in the database.
abstract class WhitelistRepository {
  /// Checks if a phone number hash exists in the whitelist
  ///
  /// Returns `Right(true)` if the hash is whitelisted, `Right(false)` otherwise.
  /// Returns `Left(Failure)` if an error occurs.
  Future<Either<Failure, bool>> isWhitelisted(String phoneNumberHash);

  /// Adds a phone number hash to the whitelist
  ///
  /// [phoneNumberHash] - SHA-256 hash of the normalized phone number
  /// [contactName] - Optional contact name from address book
  ///
  /// Returns `Right(WhitelistEntry)` on success, `Left(Failure)` on error.
  Future<Either<Failure, WhitelistEntry>> addToWhitelist({
    required String phoneNumberHash,
    String? contactName,
  });

  /// Removes a phone number hash from the whitelist
  ///
  /// Returns `Right(unit)` on success, `Left(Failure)` on error.
  Future<Either<Failure, Unit>> removeFromWhitelist(String phoneNumberHash);

  /// Gets all whitelist entries
  ///
  /// Returns `Right(List<WhitelistEntry>)` on success, `Left(Failure)` on error.
  Future<Either<Failure, List<WhitelistEntry>>> getAllWhitelistEntries();

  /// Clears all whitelist entries
  ///
  /// Useful for re-syncing contacts from scratch.
  /// Returns `Right(unit)` on success, `Left(Failure)` on error.
  Future<Either<Failure, Unit>> clearWhitelist();

  /// Syncs contacts from address book to whitelist
  ///
  /// Fetches all contacts with phone numbers, hashes them, and adds to whitelist.
  /// Returns `Right(int)` with count of synced contacts, `Left(Failure)` on error.
  Future<Either<Failure, int>> syncContactsToWhitelist();
}
