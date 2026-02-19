import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:voice_phishing_app/features/auth/presentation/screens/kakao_login_screen.dart';
import 'package:voice_phishing_app/main.dart';
import 'package:voice_phishing_app/core/providers/connectivity_provider.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/providers/call_log_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/tflite_provider.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/warning_overlay_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Start initialization in parallel
    final initTasks = [
      // Initialize call log service
      Future.microtask(() {
        ref.read(callLogServiceProvider);
      }),
      // Initialize warning overlay service
      Future.microtask(() {
        ref.read(warningOverlayServiceProvider).initialize();
      }),
      // Initialize connectivity observer
      Future.microtask(() {
        ref.read(connectivityObserverProvider);
      }),
      // Warm up TFLite model
      Future.microtask(() async {
        await ref.read(tFLiteModelLoaderProvider.future);
      }),
      // Minimum display time for branding
      Future.delayed(const Duration(seconds: 2)),
    ];

    try {
      await Future.wait(initTasks).timeout(
        const Duration(seconds: 15),
        onTimeout: () => [],
      );
    } catch (e) {
      debugPrint('❌ Initialization error: $e');
    }

    if (!mounted) return;

    // 자동 로그인 시도: 저장된 토큰이 있으면 홈으로, 없으면 로그인 화면으로
    final isLoggedIn = await ref.read(authProvider.notifier).tryAutoLogin();

    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const KakaoLoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181B), // Zinc/900
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AppIcon: orange phone with built-in dark oval shadow (from Figma)
            Image.asset(
              'assets/images/app_icon.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 0),
            // Blackcall wordmark (white vector logo from Figma)
            Image.asset(
              'assets/images/blackcall_logo.png',
              width: 164,
              height: 44,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
