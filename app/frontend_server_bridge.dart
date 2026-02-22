import 'dart:io';

void main(List<String> args) async {
  final dartaotruntime = '/Users/jinseong-yi/Documents/flutter/bin/cache/dart-sdk/bin/dartaotruntime';
  final aotSnapshot = '/Users/jinseong-yi/Documents/flutter/bin/cache/dart-sdk/bin/snapshots/frontend_server_aot.dart.snapshot';
  
  final process = await Process.start(
    dartaotruntime,
    [aotSnapshot, ...args],
    mode: ProcessStartMode.inheritStdio,
  );
  
  exit(await process.exitCode);
}
