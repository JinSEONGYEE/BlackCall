import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:voice_phishing_app/features/auth/presentation/screens/kakao_login_screen.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/warning_overlay_provider.dart';
import 'package:voice_phishing_app/features/settings/presentation/screens/general_settings_screen.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/screens/keyword_settings_screen.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/screens/detection_history_screen.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/screens/splash_screen.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'dart:io';

void main() async {
  // Initialize Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Apply SQLite workaround for Android
  if (Platform.isAndroid) {
    await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
  }

  // 카카오 SDK 초기화 — KAKAO_APP_KEY를 실제 네이티브 앱 키로 교체하세요
  KakaoSdk.init(nativeAppKey: '7dbac9c551681a60859449576a611ee9');

  // Make status bar transparent so background fills the full screen
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    const ProviderScope(
      child: VoicePhishingApp(),
    ),
  );
}

class VoicePhishingApp extends ConsumerWidget {
  const VoicePhishingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = ref.watch(navigatorKeyProvider);
    
    return MaterialApp(
      navigatorKey: key,
      title: 'Blackcall',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: const Color(0xFF18181B), // Zinc-900
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color(0xFFEA580C), // Orange 600
          primary: const Color(0xFFEA580C),
          surface: const Color(0xFF18181B), // Zinc 900
        ),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEA580C),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (_) => const PlaceholderHomePage(),
        '/login': (_) => const KakaoLoginScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderHomePage();
  }
}

class PlaceholderHomePage extends ConsumerWidget {
  const PlaceholderHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181B), // Zinc-900
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── 1. Header: Blackcall Logo (height 56px = 14+28+14) ────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 14.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/blackcall_logo.png',
                  width: 104,
                  height: 28,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // 56px gap: header → status badge
            const SizedBox(height: 56),

            // ── 2. Status Badge ────────────────────────────────────────
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.5,
                  vertical: 11.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF3F3F46), // Zinc-700
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '지금은 수상한 통화가 없어요',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pretendard',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 24 / 18,
                    letterSpacing: -0.072,
                  ),
                ),
              ),
            ),

            // 20px gap: status badge → phishing graphic
            const SizedBox(height: 20),

            // ── 3. Phishing Graphic ────────────────────────────────────
            Center(
              child: Image.asset(
                'assets/images/app_icon.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),

            // 64px gap: phishing graphic → buttons
            const SizedBox(height: 64),

            // ── 4. Action Buttons ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Primary: Solid orange button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const DetectionHistoryScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 240,
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 28,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEA580C), // Orange-600
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          '수상한 통화 기록 보기',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Pretendard',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 30 / 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 20px gap between buttons
                  const SizedBox(height: 20),

                  // Secondary: Settings button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const KeywordSettingsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 240,
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 28,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF), // White
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          '수상한 단어 등록하기',
                          style: TextStyle(
                            color: Color(0xE02E2F33),
                            fontFamily: 'Pretendard',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 30 / 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 32px bottom padding
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
