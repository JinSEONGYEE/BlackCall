import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_phishing_app/features/voice_analysis/presentation/providers/custom_keyword_provider.dart';

/// Keyword settings screen — Figma node 9-28653
class KeywordSettingsScreen extends ConsumerStatefulWidget {
  const KeywordSettingsScreen({super.key});

  @override
  ConsumerState<KeywordSettingsScreen> createState() =>
      _KeywordSettingsScreenState();
}

class _KeywordSettingsScreenState
    extends ConsumerState<KeywordSettingsScreen> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  // Staged keywords (typed but not yet saved)
  final List<String> _staged = [];

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }



  void _removeStaged(String word) {
    setState(() => _staged.remove(word));
  }

  // Save all staged keywords + current input text to the provider
  void _save(List<dynamic> existing) {
    final notifier = ref.read(customKeywordsProvider.notifier);
    // Stage current input text if non-empty
    final current = _textController.text.trim();
    if (current.isNotEmpty && !_staged.contains(current)) {
      _staged.add(current);
    }
    if (_staged.isEmpty) return;
    for (final word in _staged) {
      notifier.addKeyword(word);
    }
    setState(() {
      _staged.clear();
      _textController.clear();
    });
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final keywordsAsync = ref.watch(customKeywordsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF18181B), // Zinc-900
      // ── AppBar: 56px, chevron-left, no title ─────────────────────────
      appBar: AppBar(
        backgroundColor: const Color(0xFF18181B),
        elevation: 0,
        toolbarHeight: 56,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Center(
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        title: const Text(
          '수상한 단어 등록하기',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 24 / 18,
          ),
        ),
        titleSpacing: 0,
      ),
      body: keywordsAsync.when(
        data: (existing) => _Body(
          existing: existing,
          staged: _staged,
          textController: _textController,
          focusNode: _focusNode,
          onRemoveStaged: _removeStaged,
          onSave: () => _save(existing),
          onRemoveExisting: (id) =>
              ref.read(customKeywordsProvider.notifier).removeKeyword(id),
        ),
        loading: () =>
            const Center(child: CircularProgressIndicator(color: Color(0xFFF97316))),
        error: (err, _) => Center(
          child: Text(
            '오류 발생: $err',
            style: const TextStyle(color: Colors.white, fontFamily: 'Pretendard'),
          ),
        ),
      ),
    );
  }
}

// ── Main Body ────────────────────────────────────────────────────────────────
class _Body extends StatelessWidget {
  const _Body({
    required this.existing,
    required this.staged,
    required this.textController,
    required this.focusNode,
    required this.onRemoveStaged,
    required this.onSave,
    required this.onRemoveExisting,
  });

  final List<dynamic> existing;
  final List<String> staged;
  final TextEditingController textController;
  final FocusNode focusNode;
  final void Function(String) onRemoveStaged;
  final VoidCallback onSave;
  final void Function(dynamic id) onRemoveExisting;

  bool get _hasContent => staged.isNotEmpty || existing.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Content area ──────────────────────────────────────────────
        Expanded(
          child: _hasContent
              ? _KeywordList(
                  existing: existing,
                  staged: staged,
                  onRemoveStaged: onRemoveStaged,
                  onRemoveExisting: onRemoveExisting,
                )
              : const _EmptyState(),
        ),

        // ── Bottom: Input + Button ────────────────────────────────────
        _BottomSection(
          textController: textController,
          focusNode: focusNode,
          hasStagedKeywords: staged.isNotEmpty,
          onSave: onSave,
        ),
      ],
    );
  }
}

// ── Empty State ──────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          '통화 중에 등록한 단어가\n나오면 바로 알려드려요',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 28 / 18,
          ),
        ),
      ),
    );
  }
}

// ── Keyword List (existing DB + staged chips) ────────────────────────────────
class _KeywordList extends StatelessWidget {
  const _KeywordList({
    required this.existing,
    required this.staged,
    required this.onRemoveStaged,
    required this.onRemoveExisting,
  });

  final List<dynamic> existing;
  final List<String> staged;
  final void Function(String) onRemoveStaged;
  final void Function(dynamic) onRemoveExisting;

  @override
  Widget build(BuildContext context) {
    // Combine staged + saved into one list for display
    final stagedItems = staged
        .map((w) => _ChipData(label: w, isSaved: false, onDelete: () => onRemoveStaged(w)))
        .toList();
    final savedItems = existing
        .map((item) => _ChipData(label: item.keyword, isSaved: true, onDelete: () => onRemoveExisting(item.id)))
        .toList();
    final all = [...stagedItems, ...savedItems];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemCount: all.length,
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (_, i) => _KeywordRow(data: all[i]),
    );
  }
}

class _ChipData {
  const _ChipData({
    required this.label,
    required this.isSaved,
    required this.onDelete,
  });
  final String label;
  final bool isSaved;
  final VoidCallback onDelete;
}

// ── Keyword Row: full-width row with pill tag + X icon ────────────────────────
class _KeywordRow extends StatelessWidget {
  const _KeywordRow({required this.data});
  final _ChipData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Row vertical padding: 4px top + 4px bottom = 8px total gap feeling
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Pill tag ──────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: data.isSaved
                  ? null
                  : Border.all(color: const Color(0xFFF97316), width: 1),
            ),
            child: Text(
              data.label,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 24 / 18,
              ),
            ),
          ),

          // ── X delete icon ─────────────────────────────────────────────
          GestureDetector(
            onTap: data.onDelete,
            child: const SizedBox(
              width: 32,
              height: 32,
              child: Center(
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// ── Bottom Section: Input + Save Button ──────────────────────────────────────
class _BottomSection extends StatelessWidget {
  const _BottomSection({
    required this.textController,
    required this.focusNode,
    required this.hasStagedKeywords,
    required this.onSave,
  });

  final TextEditingController textController;
  final FocusNode focusNode;
  final bool hasStagedKeywords;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      // Bottom sheet: Zinc-800, top corners rounded 20px
      decoration: const BoxDecoration(
        color: Color(0xFF27272A), // Zinc-800
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, 16, 20, 28 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Underline input field ──────────────────────────────────
          TextField(
            controller: textController,
            focusNode: focusNode,
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              hintText: '여기를 눌러 단어를 추가하세요',
              hintStyle: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 16,
                color: Color(0xFFA1A1AA), // Zinc-400
              ),
              // Underline only — Zinc-700
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF3F3F46), width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF97316), width: 1),
              ),
              contentPadding: EdgeInsets.only(bottom: 8),
            ),
          ),

          const SizedBox(height: 28),

          // ── Save button: active when text input OR staged chips ────
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: textController,
            builder: (context, value, _) {
              final isActive = hasStagedKeywords || value.text.trim().isNotEmpty;
              return GestureDetector(
                onTap: isActive ? onSave : null,
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFFF97316) // Orange-500: active
                        : const Color(0xFF3F3F46), // Zinc-700: disabled
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '저장하기',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isActive
                            ? Colors.white
                            : const Color(0xFF52525B), // Zinc-600
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
