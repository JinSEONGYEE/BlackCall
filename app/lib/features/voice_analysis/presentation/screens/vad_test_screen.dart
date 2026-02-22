import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/audio_data.dart';
import 'package:voice_phishing_app/features/voice_analysis/domain/entities/vad_result.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/audio_capture_provider.dart';

/// Test screen for Voice Activity Detection (VAD)
///
/// Allows manual testing of audio capture and VAD functionality.
class VadTestScreen extends ConsumerStatefulWidget {
  const VadTestScreen({super.key});

  @override
  ConsumerState<VadTestScreen> createState() => _VadTestScreenState();
}

class _VadTestScreenState extends ConsumerState<VadTestScreen> {
  bool _isCapturing = false;
  VadResult? _latestVadResult;
  int _totalFrames = 0;
  int _speechFrames = 0;
  final List<VadResult> _recentResults = [];
  
  @override
  void initState() {
    super.initState();
    
    // Set up callbacks
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final service = ref.read(audioCaptureServiceProvider);
      
      // Audio data callback (speech only)
      service.onAudioDataReceived = _onAudioData;
      
      // VAD result callback (all frames)
      service.onVadResult = _onVadResult;
    });
  }
  
  void _onAudioData(AudioData audioData) {
    // Audio data received (speech detected)
    // This is where you would send to TFLite for inference
    print('🎤 Audio data received: ${audioData.length} bytes');
  }
  
  void _onVadResult(VadResult vadResult) {
    setState(() {
      _latestVadResult = vadResult;
      _totalFrames++;
      if (vadResult.isSpeech) {
        _speechFrames++;
      }
      
      // Keep last 50 results
      _recentResults.add(vadResult);
      if (_recentResults.length > 50) {
        _recentResults.removeAt(0);
      }
    });
  }
  
  Future<void> _toggleCapture() async {
    final service = ref.read(audioCaptureServiceProvider);
    
    if (_isCapturing) {
      // Stop capture
      await service.stopCapture();
      setState(() {
        _isCapturing = false;
      });
    } else {
      // Reset statistics
      setState(() {
        _totalFrames = 0;
        _speechFrames = 0;
        _recentResults.clear();
        _latestVadResult = null;
      });
      
      // Start capture
      try {
        final success = await service.startCapture();
        setState(() {
          _isCapturing = success;
        });
        
        if (!success) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to start audio capture')),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final speechRatio = _totalFrames > 0 ? _speechFrames / _totalFrames : 0.0;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('VAD Test'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          _isCapturing ? Icons.mic : Icons.mic_off,
                          color: _isCapturing ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isCapturing ? 'Capturing' : 'Stopped',
                          style: TextStyle(
                            color: _isCapturing ? Colors.green : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Statistics Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Statistics',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    _buildStatRow('Total Frames', _totalFrames.toString()),
                    _buildStatRow('Speech Frames', _speechFrames.toString()),
                    _buildStatRow(
                      'Speech Ratio',
                      '${(speechRatio * 100).toStringAsFixed(1)}%',
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Latest VAD Result Card
            if (_latestVadResult != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Latest VAD Result',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      _buildStatRow(
                        'Speech Detected',
                        _latestVadResult!.isSpeech ? 'YES' : 'NO',
                        valueColor: _latestVadResult!.isSpeech
                            ? Colors.green
                            : Colors.grey,
                      ),
                      _buildStatRow(
                        'Energy',
                        _latestVadResult!.energy.toStringAsFixed(4),
                      ),
                      _buildStatRow(
                        'Threshold',
                        _latestVadResult!.threshold.toStringAsFixed(4),
                      ),
                    ],
                  ),
                ),
              ),
            
            const SizedBox(height: 16),
            
            // Energy Visualization
            if (_recentResults.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Energy History (Last 50 frames)',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 100,
                        child: CustomPaint(
                          painter: EnergyChartPainter(_recentResults),
                          size: const Size(double.infinity, 100),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 4),
                              const Text('Energy'),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 4),
                              const Text('Threshold'),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: Colors.green.withOpacity(0.3),
                              ),
                              const SizedBox(width: 4),
                              const Text('Speech'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            
            const Spacer(),
            
            // Control Button
            ElevatedButton.icon(
              onPressed: _toggleCapture,
              icon: Icon(_isCapturing ? Icons.stop : Icons.play_arrow),
              label: Text(_isCapturing ? 'Stop Capture' : 'Start Capture'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isCapturing ? Colors.red : Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStatRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter for energy chart
class EnergyChartPainter extends CustomPainter {
  final List<VadResult> results;
  
  EnergyChartPainter(this.results);
  
  @override
  void paint(Canvas canvas, Size size) {
    if (results.isEmpty) return;
    
    final energyPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    final thresholdPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    
    final speechPaint = Paint()
      ..color = Colors.green.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    
    final width = size.width;
    final height = size.height;
    final step = width / (results.length - 1);
    
    // Find max energy for scaling
    final maxEnergy = results.map((r) => r.energy).reduce((a, b) => a > b ? a : b);
    final scale = maxEnergy > 0 ? height / maxEnergy : 1.0;
    
    // Draw speech regions
    for (int i = 0; i < results.length; i++) {
      if (results[i].isSpeech) {
        final x = i * step;
        canvas.drawRect(
          Rect.fromLTWH(x, 0, step, height),
          speechPaint,
        );
      }
    }
    
    // Draw energy line
    final energyPath = Path();
    for (int i = 0; i < results.length; i++) {
      final x = i * step;
      final y = height - (results[i].energy * scale);
      
      if (i == 0) {
        energyPath.moveTo(x, y);
      } else {
        energyPath.lineTo(x, y);
      }
    }
    canvas.drawPath(energyPath, energyPaint);
    
    // Draw threshold line
    final thresholdPath = Path();
    for (int i = 0; i < results.length; i++) {
      final x = i * step;
      final y = height - (results[i].threshold * scale);
      
      if (i == 0) {
        thresholdPath.moveTo(x, y);
      } else {
        thresholdPath.lineTo(x, y);
      }
    }
    canvas.drawPath(thresholdPath, thresholdPaint);
  }
  
  @override
  bool shouldRepaint(EnergyChartPainter oldDelegate) => true;
}
