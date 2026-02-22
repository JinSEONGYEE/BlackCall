import 'dart:io';

void main() {
  final sdkSnapshotsDir = '/Users/jinseong-yi/Documents/flutter/bin/cache/dart-sdk/bin/snapshots';
  final target = '$sdkSnapshotsDir/frontend_server_aot.dart.snapshot';
  final link = '$sdkSnapshotsDir/frontend_server.dart.snapshot';

  print('🔍 Checking for SDK snapshot...');
  
  if (!File(target).existsSync()) {
    print('❌ Error: Could not find target file at $target');
    return;
  }

  if (File(link).existsSync() || Link(link).existsSync()) {
    print('✅ Link already exists or file exists at $link');
  } else {
    try {
      print('🚀 Creating symbolic link...');
      Link(link).createSync(target);
      print('✅ Successfully created symlink!');
    } catch (e) {
      print('❌ Failed to create link: $e');
      print('💡 Try running this script with sudo or manually execute the ln -s command.');
    }
  }
}
