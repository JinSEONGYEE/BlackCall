import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

/// 로그인 상태
enum AuthStatus { initial, loading, loggedIn, loggedOut, error }

/// 로그인 State
class AuthState {
  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
  });

  final AuthStatus status;
  final User? user;
  final String? errorMessage;

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() => const AuthState();

  /// 기존 토큰으로 자동 로그인 시도
  Future<bool> tryAutoLogin() async {
    if (await AuthApi.instance.hasToken()) {
      try {
        await UserApi.instance.accessTokenInfo();
        final user = await UserApi.instance.me();
        state = AuthState(status: AuthStatus.loggedIn, user: user);
        return true;
      } catch (e) {
        debugPrint('❌ Auto login failed: $e');
        state = const AuthState(status: AuthStatus.loggedOut);
        return false;
      }
    }
    state = const AuthState(status: AuthStatus.loggedOut);
    return false;
  }

  /// 카카오 로그인
  Future<bool> login() async {
    debugPrint('➡️ Auth.login() called');
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);
    try {
      final isInstalled = await isKakaoTalkInstalled();
      debugPrint('🔍 isKakaoTalkInstalled: $isInstalled');

      // Set a 3-minute timeout for the entire OAuth process
      await Future.microtask(() async {
        if (isInstalled) {
          debugPrint('📲 Attempting loginWithKakaoTalk()...');
          await UserApi.instance.loginWithKakaoTalk();
        } else {
          debugPrint('🌐 Attempting loginWithKakaoAccount()...');
          await UserApi.instance.loginWithKakaoAccount();
        }
      }).timeout(const Duration(minutes: 3));
      
      debugPrint('✅ Kakao OAuth successful, fetching user info...');
      final user = await UserApi.instance.me();
      debugPrint('👤 User fetched: ${user.kakaoAccount?.profile?.nickname}');
      
      state = AuthState(status: AuthStatus.loggedIn, user: user);
      return true;
    } catch (e, stack) {
      debugPrint('❌ Kakao login failed: $e');
      debugPrint('详细 Stack: $stack');
      
      String errorMessage = '로그인에 실패했습니다. 다시 시도해 주세요.';
      
      if (e is TimeoutException) {
        errorMessage = '로그인 시간이 초과되었습니다. 다시 시도해 주세요.';
      } else if (e.toString().contains('canceled')) {
        errorMessage = '로그인이 취소되었습니다.';
      } else if (e.toString().contains('Misconfigured')) {
        errorMessage = '카카오 설정 오류가 발생했습니다. (키Hash 확인 필요)';
      }

      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: errorMessage,
      );
      return false;
    }
  }

  /// 로그아웃
  Future<void> logout() async {
    try {
      await UserApi.instance.logout();
    } catch (e) {
      debugPrint('❌ Logout failed: $e');
    } finally {
      state = const AuthState(status: AuthStatus.loggedOut);
    }
  }
}
