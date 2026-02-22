import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/call_log.dart';

/// Widget to display a single call log entry
///
/// Shows phone number, timestamp, duration, and status icons.
class CallLogListTile extends StatelessWidget {
  const CallLogListTile({
    required this.callLog,
    this.onTap,
    super.key,
  });

  final CallLog callLog;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: _getBorderColor(),
          width: 3,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Status Icon
              _buildStatusIcon(),
              const SizedBox(width: 16),
              
              // Call Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Phone Number
                    Text(
                      callLog.formattedNumber,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    
                    // Timestamp
                    Text(
                      _formatTimestamp(callLog.receivedAt),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: 4),
                    
                    // Duration or Missed Call
                    Text(
                      _getDurationText(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: callLog.answeredAt == null
                                ? Colors.red
                                : Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              
              // Additional Status Badges
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (callLog.isSpoofingRisk)
                    const Icon(Icons.warning, color: Colors.amber, size: 24),
                  if (callLog.isWhitelisted)
                    const Icon(Icons.check_circle, color: Colors.green, size: 20),
                  if (callLog.isPrivate)
                    const Icon(Icons.block, color: Colors.grey, size: 20),
                  if (callLog.isInternational)
                    const Icon(Icons.public, color: Colors.blue, size: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Get border color based on call status
  Color _getBorderColor() {
    if (callLog.isSpoofingRisk) {
      return Colors.red.shade300;
    } else if (callLog.isWhitelisted) {
      return Colors.green.shade300;
    } else {
      return Colors.grey.shade300;
    }
  }

  /// Build status icon based on call state
  Widget _buildStatusIcon() {
    IconData iconData;
    Color iconColor;

    if (callLog.isPrivate) {
      iconData = Icons.block;
      iconColor = Colors.grey;
    } else if (callLog.answeredAt == null) {
      iconData = Icons.phone_missed;
      iconColor = Colors.red;
    } else {
      iconData = Icons.phone;
      iconColor = Colors.green;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: 28,
      ),
    );
  }

  /// Format timestamp for display
  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays == 0) {
      // Today - show time
      return 'Today ${DateFormat('HH:mm').format(timestamp)}';
    } else if (difference.inDays == 1) {
      // Yesterday
      return 'Yesterday ${DateFormat('HH:mm').format(timestamp)}';
    } else if (difference.inDays < 7) {
      // This week - show day of week
      return DateFormat('EEEE HH:mm').format(timestamp);
    } else {
      // Older - show date
      return DateFormat('yyyy-MM-dd HH:mm').format(timestamp);
    }
  }

  /// Get duration text or "Missed Call"
  String _getDurationText() {
    if (callLog.answeredAt == null) {
      return 'Missed Call';
    }

    final duration = callLog.durationSeconds ?? 0;
    if (duration == 0) {
      return 'No duration';
    }

    final minutes = duration ~/ 60;
    final seconds = duration % 60;

    if (minutes > 0) {
      return 'Duration: ${minutes}m ${seconds}s';
    } else {
      return 'Duration: ${seconds}s';
    }
  }
}
