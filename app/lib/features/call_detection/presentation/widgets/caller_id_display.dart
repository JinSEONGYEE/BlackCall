import 'package:flutter/material.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/caller_info.dart';

/// Widget to display caller ID information
///
/// Shows the formatted phone number and handles private/blocked numbers.
class CallerIdDisplay extends StatelessWidget {
  const CallerIdDisplay({
    required this.callerInfo,
    super.key,
  });
  
  final CallerInfo callerInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Incoming Call',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 16),
            
            // Phone number or "Private Number"
            Row(
              children: [
                Icon(
                  callerInfo.isPrivate ? Icons.block : Icons.phone,
                  size: 32,
                  color: callerInfo.isPrivate ? Colors.red : Colors.blue,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    callerInfo.formattedNumber,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            
            // Spoofing risk warning
            if (callerInfo.isSpoofingRisk) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade700, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber,
                      color: Colors.amber.shade900,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Spoofing Risk Detected',
                            style: TextStyle(
                              color: Colors.amber.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'This number may be spoofed (070 or international)',
                            style: TextStyle(
                              color: Colors.amber.shade800,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
            // Additional info badges
            if (!callerInfo.isPrivate) ...[
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: [
                  if (callerInfo.isKorean)
                    Chip(
                      label: const Text('Korean Number'),
                      avatar: const Icon(Icons.flag, size: 16),
                      backgroundColor: Colors.blue[50],
                    ),
                  if (callerInfo.isInternational)
                    Chip(
                      label: const Text('International'),
                      avatar: const Icon(Icons.public, size: 16),
                      backgroundColor: Colors.orange[50],
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
