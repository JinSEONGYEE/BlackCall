import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voice_phishing_app/features/auth/presentation/providers/auth_provider.dart';

/// 카카오 로그인 화면 — Figma node 12-3400
///
/// 화면 구성
/// - 배경: Zinc-900 (#18181B)
/// - 상단 190px 여백 → Blackcall 로고 (app_icon + blackcall_logo, 200px)
/// - 로고~버튼 간격: ~130px (Spacer)
/// - 카카오 로그인 버튼: #FEE500, 312×56px, radius 12px
///   └ 카카오 아이콘(left) + "카카오 로그인"(20px/600/#000), gap 16px
/// - 버튼 하단 여백: 200px (SafeArea 포함)
class KakaoLoginScreen extends ConsumerWidget {
  const KakaoLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.status == AuthStatus.loading;

    return Scaffold(
      backgroundColor: const Color(0xFF18181B), // Zinc-900
      body: SafeArea(
        child: Column(
          children: [
            // ── 상단 여백 (190px) ──────────────────────────────────────────
            const SizedBox(height: 190),

            // ── Blackcall 로고 영역 (200×200) ─────────────────────────────
            const _BlackcallLogo(),

            // ── 탄력적 공간 (로고~버튼 사이, ~130px) ──────────────────────
            const Spacer(),

            // ── 카카오 로그인 버튼 ─────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _KakaoLoginButton(
                isLoading: isLoading,
                onTap: () => unawaited(_handleLogin(context, ref)),
              ),
            ),

            // ── 에러 메시지 ────────────────────────────────────────────────
            if (authState.errorMessage != null) ...[
              const SizedBox(height: 12),
              Text(
                authState.errorMessage!,
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 14,
                  color: Color(0xFFEF4444), // Red-500
                ),
                textAlign: TextAlign.center,
              ),
            ],

            // ── 하단 여백 (200px, but SafeArea already covers some) ────────
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context, WidgetRef ref) async {
    final success = await ref.read(authProvider.notifier).login();
    if (success && context.mounted) {
      // 로그인 성공 → 홈으로 이동 (뒤로 가기 불가)
      unawaited(
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const _HomeNavigator(),
          ),
        ),
      );
    }
  }
}

// ── Blackcall 로고 ─────────────────────────────────────────────────────────────
class _BlackcallLogo extends StatelessWidget {
  const _BlackcallLogo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App icon (orange phone)
          Image.asset(
            'assets/images/app_icon.png',
            width: 140,
            height: 140,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          // Blackcall wordmark
          Image.asset(
            'assets/images/blackcall_logo.png',
            width: 140,
            height: 40,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

// ── 카카오 로그인 버튼 ─────────────────────────────────────────────────────────
class _KakaoLoginButton extends StatelessWidget {
  const _KakaoLoginButton({
    required this.isLoading,
    required this.onTap,
  });

  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: double.infinity, // 화면 너비 꽉 채움 (좌우 20px 패딩은 부모가 처리)
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFFEE500), // 카카오 옐로우
          borderRadius: BorderRadius.circular(12),
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 2.5,
                  ),
                ),
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 공식 카카오 말풍선 아이콘 재현
                  _KakaoIcon(),
                  SizedBox(width: 16), // gap: 16px
                  Text(
                    '카카오 로그인',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: 1.5, // line-height: 30px / font-size: 20px
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// ── 카카오 로고 아이콘 ──────────────────────────────────────────────────────────
class _KakaoIcon extends StatelessWidget {
  const _KakaoIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/kakao_logo.svg',
      width: 24,
      height: 24,
    );
  }
}

// ── 홈 화면으로 이동 ──────────────────────────────────────────────────────────
class _HomeNavigator extends StatelessWidget {
  const _HomeNavigator();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false);
    });
    return const Scaffold(backgroundColor: Color(0xFF18181B));
  }
}
