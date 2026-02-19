import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audio_data.freezed.dart';
part 'audio_data.g.dart';

/// Domain entity representing captured audio data
///
/// Contains raw PCM audio bytes and metadata (sample rate, timestamp).
/// Audio data is captured from microphone during active calls.
@freezed
class AudioData with _$AudioData {
  const factory AudioData({
    /// Raw audio bytes (PCM 16-bit, mono)
    required Uint8List data,
    
    /// Length of valid data in bytes
    required int length,
    
    /// Sample rate in Hz (e.g., 16000 for 16kHz)
    required int sampleRate,
    
    /// Timestamp when audio was captured
    required DateTime timestamp,
  }) = _AudioData;
  
  factory AudioData.fromJson(Map<String, dynamic> json) =>
      _$AudioDataFromJson(json);
}
