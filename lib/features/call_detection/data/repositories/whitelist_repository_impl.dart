import 'package:fpdart/fpdart.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:drift/drift.dart';
import 'package:voice_phishing_app/core/database/app_database.dart';
import 'package:voice_phishing_app/core/error/failures.dart';
import 'package:voice_phishing_app/core/util/phone_number_hasher.dart';
import 'package:voice_phishing_app/features/call_detection/data/datasources/whitelist_local_datasource.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/whitelist_entry.dart';
import 'package:voice_phishing_app/features/call_detection/domain/repositories/whitelist_repository.dart';

/// Implementation of WhitelistRepository
///
/// Handles whitelist operations with Either error handling.
class WhitelistRepositoryImpl implements WhitelistRepository {
  final WhitelistLocalDataSource _localDataSource;

  WhitelistRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, bool>> isWhitelisted(String phoneNumberHash) async {
    try {
      final result = await _localDataSource.isWhitelisted(phoneNumberHash);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure('Failed to check whitelist: $e'));
    }
  }

  @override
  Future<Either<Failure, WhitelistEntry>> addToWhitelist({
    required String phoneNumberHash,
    String? contactName,
  }) async {
    try {
      final data = await _localDataSource.addToWhitelist(
        phoneNumberHash: phoneNumberHash,
        contactName: contactName,
      );

      final entry = WhitelistEntry(
        id: data.id,
        phoneNumberHash: data.phoneNumberHash,
        addedAt: data.addedAt,
        contactName: data.contactName,
      );

      return Right(entry);
    } catch (e) {
      return Left(DatabaseFailure('Failed to add to whitelist: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromWhitelist(
      String phoneNumberHash) async {
    try {
      await _localDataSource.removeFromWhitelist(phoneNumberHash);
      return const Right(unit);
    } catch (e) {
      return Left(
          DatabaseFailure('Failed to remove from whitelist: $e'));
    }
  }

  @override
  Future<Either<Failure, List<WhitelistEntry>>> getAllWhitelistEntries() async {
    try {
      final dataList = await _localDataSource.getAllWhitelistEntries();

      final entries = dataList
          .map((data) => WhitelistEntry(
                id: data.id,
                phoneNumberHash: data.phoneNumberHash,
                addedAt: data.addedAt,
                contactName: data.contactName,
              ))
          .toList();

      return Right(entries);
    } catch (e) {
      return Left(
          DatabaseFailure('Failed to get whitelist entries: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearWhitelist() async {
    try {
      await _localDataSource.clearWhitelist();
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure('Failed to clear whitelist: $e'));
    }
  }

  @override
  Future<Either<Failure, int>> syncContactsToWhitelist() async {
    try {
      // Request contacts permission
      if (!await FlutterContacts.requestPermission()) {
        return const Left(PermissionFailure(
            'Contacts permission denied by user'));
      }

      // Fetch all contacts with phone numbers
      final contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: false,
      );

      // Extract phone numbers and create whitelist entries
      final List<WhitelistTableCompanion> entries = [];

      for (final contact in contacts) {
        if (contact.phones.isEmpty) continue;

        final contactName = contact.displayName;

        for (final phone in contact.phones) {
          final phoneNumber = phone.number;
          if (phoneNumber.isEmpty) continue;

          // Hash the phone number
          final hash = PhoneNumberHasher.hash(phoneNumber);

          entries.add(WhitelistTableCompanion.insert(
            phoneNumberHash: hash,
            addedAt: DateTime.now(),
            contactName: Value(contactName),
          ));
        }
      }

      // Batch insert into database
      final count = await _localDataSource.batchInsert(entries);

      return Right(count);
    } on PermissionFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
          DatabaseFailure('Failed to sync contacts: $e'));
    }
  }
}
