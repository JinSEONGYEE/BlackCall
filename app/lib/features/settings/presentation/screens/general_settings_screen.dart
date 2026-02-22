import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../call_detection/presentation/providers/whitelist_sync_provider.dart';
import '../providers/settings_provider.dart';

class GeneralSettingsScreen extends ConsumerWidget {
  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final whitelistSyncState = ref.watch(whitelistSyncProvider);
    final settingsAsync = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF18181B),
      appBar: AppBar(
        title: const Text('환경 설정', style: TextStyle(fontFamily: 'Pretendard')),
        backgroundColor: const Color(0xFF18181B),
        elevation: 0,
      ),
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('설정을 불러오지 못했습니다: $err')),
        data: (settings) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _SectionHeader(title: '기능 설정'),
            SwitchListTile(
              title: const Text('실시간 탐지 활성화', style: TextStyle(color: Colors.white)),
              subtitle: const Text('통화 중 실시간으로 피싱을 탐지합니다.', style: TextStyle(color: Colors.grey)),
              value: settings.isDetectionEnabled,
              onChanged: (value) => ref.read(settingsProvider.notifier).toggleDetection(value),
              activeColor: const Color(0xFFEA580C),
            ),
            const Divider(color: Color(0xFF27272A)),
            
            _SectionHeader(title: '데이터 동기화'),
          ListTile(
            title: const Text('연락처 동기화', style: TextStyle(color: Colors.white)),
            subtitle: const Text('안전한 번호 목록을 서버에 백업합니다.', style: TextStyle(color: Colors.grey)),
            trailing: whitelistSyncState.when(
              data: (_) => const Icon(Icons.sync, color: Colors.grey),
              loading: () => const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
              error: (err, _) => const Icon(Icons.error, color: Colors.red),
            ),
            onTap: () => ref.read(whitelistSyncProvider.notifier).sync(),
          ),
          const Divider(color: Color(0xFF27272A)),

          _SectionHeader(title: '계정'),
          ListTile(
            title: const Text('로그아웃', style: TextStyle(color: Color(0xFFEF4444))),
            onTap: () async {
              await ref.read(authProvider.notifier).logout();
              if (context.mounted) {
                Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
              }
            },
          ),
        ],
      ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFEA580C),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
