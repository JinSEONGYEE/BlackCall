import 'package:freezed_annotation/freezed_annotation.dart';

part 'whitelist_entry.freezed.dart';
part 'whitelist_entry.g.dart';

/// Represents a whitelisted contact entry
///
/// Contains information about a trusted contact whose calls should skip
/// fraud analysis.
@freezed
class WhitelistEntry with _$WhitelistEntry {
  const factory WhitelistEntry({
    /// Unique identifier for this whitelist entry
    required int id,

    /// SHA-256 hash of the normalized phone number
    ///
    /// Phone numbers are hashed for privacy. The hash is 64 characters long.
    required String phoneNumberHash,

    /// Timestamp when this entry was added to the whitelist
    required DateTime addedAt,

    /// Contact name from address book (optional)
    ///
    /// May be null if the contact has no name.
    String? contactName,
  }) = _WhitelistEntry;

  /// Creates a WhitelistEntry from JSON
  factory WhitelistEntry.fromJson(Map<String, dynamic> json) =>
      _$$WhitelistEntryImplFromJson(json);
}
