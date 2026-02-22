import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voice_phishing_app/core/util/phone_number_hasher.dart';
import '../../data/providers/whitelist_provider.dart';

part 'whitelist_sync_provider.g.dart';

@riverpod
class WhitelistSync extends _$WhitelistSync {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> sync() async {
    state = const AsyncLoading();
    
    try {
      // 1. Request Permission
      if (!await FlutterContacts.requestPermission()) {
        state = AsyncError('Contacts permission denied', StackTrace.current);
        return;
      }

      // 2. Fetch Contacts
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      
      // 3. Process & Hash
      final List<Map<String, String>> hashedContacts = [];
      for (final contact in contacts) {
        for (final phone in contact.phones) {
          final hash = PhoneNumberHasher.hash(phone.number);
          hashedContacts.add({
            'phoneHash': hash,
            'contactName': contact.displayName,
          });
        }
      }

      // 4. Send to Server
      final repository = ref.read(whitelistRepositoryProvider);
      final result = await repository.syncWhitelist(hashedContacts);

      result.fold(
        (failure) => state = AsyncError(failure.message, StackTrace.current),
        (_) => state = const AsyncData(null),
      );
    } catch (e, stack) {
      state = AsyncError(e.toString(), stack);
    }
  }
}
