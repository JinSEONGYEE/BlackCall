import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/providers/call_log_provider.dart';

/// Filter chips for switching between "All Calls" and "Spoofing Risk Only"
class CallLogFilterChips extends ConsumerWidget {
  const CallLogFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(callLogFilterNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          FilterChip(
            label: const Text('All Calls'),
            selected: currentFilter == CallLogFilter.all,
            onSelected: (selected) {
              if (selected) {
                ref
                    .read(callLogFilterNotifierProvider.notifier)
                    .setFilter(CallLogFilter.all);
              }
            },
            selectedColor: Colors.blue.shade100,
            checkmarkColor: Colors.blue.shade700,
          ),
          const SizedBox(width: 12),
          FilterChip(
            label: const Text('Spoofing Risk'),
            selected: currentFilter == CallLogFilter.spoofingRisk,
            onSelected: (selected) {
              if (selected) {
                ref
                    .read(callLogFilterNotifierProvider.notifier)
                    .setFilter(CallLogFilter.spoofingRisk);
              }
            },
            selectedColor: Colors.amber.shade100,
            checkmarkColor: Colors.amber.shade700,
            avatar: const Icon(Icons.warning, size: 18),
          ),
        ],
      ),
    );
  }
}
