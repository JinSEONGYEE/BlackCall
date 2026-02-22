import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/providers/call_log_provider.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/widgets/call_log_filter_chips.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/widgets/call_log_list_tile.dart';

/// Main screen for displaying call history
///
/// Shows a list of call logs with filtering capabilities.
class CallHistoryScreen extends ConsumerWidget {
  const CallHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final callLogsAsync = ref.watch(callLogListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call History'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Filter Chips
          const CallLogFilterChips(),
          const Divider(height: 1),
          
          // Call Log List
          Expanded(
            child: callLogsAsync.when(
              data: (callLogs) {
                if (callLogs.isEmpty) {
                  return _buildEmptyState(context);
                }
                
                return RefreshIndicator(
                  onRefresh: () async {
                    // Refresh the call log list
                    ref.invalidate(callLogListProvider);
                  },
                  child: ListView.builder(
                    itemCount: callLogs.length,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (context, index) {
                      final callLog = callLogs[index];
                      return CallLogListTile(
                        callLog: callLog,
                        onTap: () {
                          // TODO: Navigate to call detail screen (future enhancement)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Call from ${callLog.formattedNumber}'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
              loading: () => _buildLoadingState(),
              error: (error, stack) => _buildErrorState(context, error),
            ),
          ),
        ],
      ),
    );
  }

  /// Build empty state when no calls logged
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No call history yet',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Incoming calls will be logged here',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
          ),
        ],
      ),
    );
  }

  /// Build loading state
  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading call history...'),
        ],
      ),
    );
  }

  /// Build error state
  Widget _buildErrorState(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to load call history',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.red[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
