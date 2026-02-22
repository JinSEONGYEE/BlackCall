import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/call_control_provider.dart';

/// Warning overlay popup — Figma node 12-3399
/// Displayed as a dialog over the current call screen when voice phishing is detected.
class WarningOverlayScreen extends ConsumerWidget {
  final String patternType;
  final List<String> keywords;
  final double confidence;

  // ignore: sort_constructors_first
  const WarningOverlayScreen({
    required this.patternType,
    required this.keywords,
    required this.confidence,
    super.key,
  });

  /// Show this overlay as a dialog (no back-dismiss by default).
  static Future<void> show(
    BuildContext context, {
    required String patternType,
    required List<String> keywords,
    required double confidence,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      builder: (_) => WarningOverlayScreen(
        patternType: patternType,
        keywords: keywords,
        confidence: confidence,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final callControlService = ref.watch(callControlServiceProvider);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: _PopupCard(callControlService: callControlService),
    );
  }
}

// ── Popup Card ────────────────────────────────────────────────────────────────
class _PopupCard extends StatelessWidget {
  const _PopupCard({required this.callControlService});
  final dynamic callControlService;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 298,
      padding: const EdgeInsets.fromLTRB(21, 26, 21, 26),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B), // Zinc-900
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Caution Chip ──────────────────────────────────────────────
          const _CautionChip(),
          const SizedBox(height: 24),

          // ── Phishing Graphic ──────────────────────────────────────────
          const _PhishingGraphic(),
          const SizedBox(height: 24),

          // ── Description text ──────────────────────────────────────────
          const Text(
            '지금 통화를 멈추고\n가족이나 주변 지인에게 알리세요',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 28 / 18,
            ),
          ),
          const SizedBox(height: 24),

          // ── End call button ───────────────────────────────────────────
          _EndCallButton(callControlService: callControlService),
        ],
      ),
    );
  }
}

// ── Caution Chip ──────────────────────────────────────────────────────────────
class _CautionChip extends StatelessWidget {
  const _CautionChip();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF3F3F46), // Zinc-700
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        '보이스피싱이 의심됩니다',
        style: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFFF4F4F5), // Zinc-100
          height: 20 / 14,
          letterSpacing: -0.072,
        ),
      ),
    );
  }
}

// ── Phishing Graphic: phone icon ──────────────────────────────────────────────
class _PhishingGraphic extends StatelessWidget {
  const _PhishingGraphic();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFFCA3500), // dark orange
          Color(0xFFEA5A00), // lighter orange
        ],
      ).createShader(bounds),
      child: const Icon(
        Icons.phone_in_talk_rounded,
        size: 120,
        color: Colors.white, // masked by shader
      ),
    );
  }
}

// ── End Call Button ───────────────────────────────────────────────────────────
class _EndCallButton extends StatefulWidget {
  const _EndCallButton({required this.callControlService});
  final dynamic callControlService;

  @override
  State<_EndCallButton> createState() => _EndCallButtonState();
}

class _EndCallButtonState extends State<_EndCallButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _loading ? null : _onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: _loading
              ? const Color(0xFFEA580C).withValues(alpha: 0.6)
              : const Color(0xFFEA580C), // Orange-600
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: _loading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : const Text(
                  '통화 종료하기',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> _onTap() async {
    setState(() => _loading = true);
    try {
      final status = await Permission.phone.request();
      if (status.isGranted) {
        final success = await widget.callControlService.terminateCall();
        if (success && mounted) {
          Navigator.of(context).pop();
        } else {
          debugPrint('❌ Failed to terminate call');
          if (mounted) setState(() => _loading = false);
        }
      } else {
        debugPrint('❌ Phone permission denied');
        if (mounted) setState(() => _loading = false);
      }
    } catch (e) {
      debugPrint('❌ Error terminating call: $e');
      if (mounted) setState(() => _loading = false);
    }
  }
}
