import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/detection_history_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/detection_history_item.dart';

/// Screen to display history of detected fraud patterns
/// Figma: node 9-28653
class DetectionHistoryScreen extends ConsumerWidget {
  const DetectionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(detectionHistoryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF18181B), // Zinc-900
      // ── AppBar: 56px toolbar, 12px v / 20px h padding ───────────────
      appBar: AppBar(
        backgroundColor: const Color(0xFF18181B), // Zinc-900
        elevation: 0,
        toolbarHeight: 56,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Center(
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        title: const Text(
          '수상한 통화 기록 보기',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 24 / 18,
          ),
        ),
        titleSpacing: 0,
      ),
      body: historyAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return _EmptyState();
          }
          return _HistoryList(items: items);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFFEA580C)),
        ),
        error: (err, stack) => Center(
          child: Text(
            '오류 발생: $err',
            style: const TextStyle(color: Colors.white, fontFamily: 'Pretendard'),
          ),
        ),
      ),
    );
  }
}

// ── Empty State ──────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '아직 수상한 통화를 받지 않았어요',
        style: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 24 / 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// ── History List ─────────────────────────────────────────────────────────────
class _HistoryList extends StatelessWidget {
  const _HistoryList({required this.items});

  final List<DetectionHistoryItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = items[index];
        return _HistoryItem(item: item);
      },
    );
  }
}

// ── Single History Item Row ──────────────────────────────────────────────────
class _HistoryItem extends StatelessWidget {
  const _HistoryItem({required this.item});

  final DetectionHistoryItem item;

  String _formatDate(DateTime dt) {
    return '${dt.year}.${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Left: title + date ─────────────────────────────────────
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title: 18px / SemiBold / white
                Text(
                  item.patternType,
                  style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 24 / 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Subtitle: 14px / Regular / white
                Text(
                  _formatDate(item.timestamp),
                  style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 24 / 14,
                  ),
                ),
              ],
            ),
          ),

          // ── Right: Share button ────────────────────────────────────
          GestureDetector(
            onTap: () {
              // TODO: implement share
            },
            child: Container(
              width: 68,
              height: 31,
              decoration: BoxDecoration(
                color: const Color(0xFFF97316), // Orange-500
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  '공유하기',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
