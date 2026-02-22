class ApiConfig {
  static const String baseUrl = 'http://localhost:3000/v1'; // Change to actual server IP for real device testing
  
  // Auth
  static const String loginKakao = '/auth/kakao/login';
  
  // Fraud Detection
  static const String fraudPatterns = '/fraud-patterns';
  static const String tfliteModelLatest = '/models/tflite/latest';
  
  // Whitelist
  static const String whitelistSync = '/whitelist/sync';
  
  // History & Settings
  static const String detectionHistory = '/detection-history';
  static const String settings = '/settings';
}
