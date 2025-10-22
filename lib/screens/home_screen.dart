import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/snippet_provider.dart';
import '../providers/tts_provider.dart';
import '../widgets/snippet_button.dart';
import 'edit_snippet_screen.dart';
import 'about_screen.dart';

/// メイン画面
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  String? _activeSnippetId;
  bool _isControlPanelExpanded = true;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  /// スニペットボタンがタップされた時の処理
  Future<void> _onSnippetTap(String snippetId, String text) async {
    final ttsProvider = context.read<TtsProvider>();

    // 読み上げ中で同じスニペットをタップした場合は停止
    if (_activeSnippetId == snippetId && ttsProvider.isSpeaking) {
      await ttsProvider.stop();
      if (mounted) {
        setState(() {
          _activeSnippetId = null;
        });
      }
      return;
    }

    // 読み上げ開始
    setState(() {
      _activeSnippetId = snippetId;
    });

    await ttsProvider.speak(text);

    // 読み上げ完了後にアクティブ状態を解除
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        _activeSnippetId = null;
      });
    }
  }

  /// テキスト入力からの読み上げ
  Future<void> _speakFromInput() async {
    final ttsProvider = context.read<TtsProvider>();

    // 読み上げ中の場合は停止
    if (ttsProvider.isSpeaking) {
      await ttsProvider.stop();
      return;
    }

    // テキストが空の場合は何もしない
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    // 読み上げ開始
    await ttsProvider.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF4A90E2),
                Color(0xFF357ABD),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x404A90E2),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 100,
            title: LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.of(context).size.width;
                final titleFontSize = screenWidth < 350 ? 18.0 : 22.0;
                final subtitleFontSize = screenWidth < 350 ? 9.0 : 11.0;
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ことばボタン',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenWidth < 350 ? 1 : 2),
                    Text(
                      '声が出ない時に、ワンタップで伝える',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                );
              },
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.info_outline, size: 24),
                  color: Colors.white,
                  tooltip: 'アプリ情報',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutScreen(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.edit_note, size: 26),
                  color: Colors.white,
                  tooltip: 'スニペット編集',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditSnippetScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer2<SnippetProvider, TtsProvider>(
        builder: (context, snippetProvider, ttsProvider, child) {
          if (snippetProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final snippets = snippetProvider.snippets;

          return Column(
            children: [
              // スニペットボタンのグリッド
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: snippets.length,
                    itemBuilder: (context, index) {
                      final snippet = snippets[index];
                      return SnippetButton(
                        snippet: snippet,
                        isActive: _activeSnippetId == snippet.id,
                        onTap: () => _onSnippetTap(snippet.id, snippet.text),
                      );
                    },
                  ),
                ),
              ),

              // 下部コントロールパネル
              SafeArea(
                top: false,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    // 展開/折りたたみボタン（矢印アイコン中心）
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isControlPanelExpanded = !_isControlPanelExpanded;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width < 350 ? 8 : 12,
                          horizontal: 20,
                        ),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width < 350 ? 16 : 24,
                              vertical: MediaQuery.of(context).size.width < 350 ? 6 : 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4A90E2).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              _isControlPanelExpanded
                                  ? Icons.keyboard_arrow_down_rounded
                                  : Icons.keyboard_arrow_up_rounded,
                              size: MediaQuery.of(context).size.width < 350 ? 28 : 32,
                              color: const Color(0xFF4A90E2),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // 展開可能なコンテンツ
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      crossFadeState: _isControlPanelExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: const SizedBox.shrink(),
                      secondChild: Padding(
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width < 350 ? 12 : 16,
                          0,
                          MediaQuery.of(context).size.width < 350 ? 12 : 16,
                          MediaQuery.of(context).size.width < 350 ? 12 : 16,
                        ),
                        child: Column(
                          children: [
                            // 速度調整セクション
                            Container(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width < 350 ? 12 : 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4A90E2).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.speed,
                                          color: Color(0xFF4A90E2),
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          '読み上げ速度',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width < 350 ? 13 : 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context).size.width < 350 ? 8 : 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF4A90E2),
                                              Color(0xFF357ABD),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          '${ttsProvider.displaySpeedPercentage}%',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width < 350 ? 12 : 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  SliderTheme(
                                    data: SliderThemeData(
                                      activeTrackColor: const Color(0xFF4A90E2),
                                      inactiveTrackColor: Colors.grey.shade200,
                                      thumbColor: const Color(0xFF4A90E2),
                                      overlayColor: const Color(0xFF4A90E2).withOpacity(0.2),
                                      trackHeight: 4,
                                      thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 10,
                                      ),
                                      overlayShape: const RoundSliderOverlayShape(
                                        overlayRadius: 20,
                                      ),
                                    ),
                                    child: Slider(
                                      value: ttsProvider.speechRate,
                                      min: 0.35,
                                      max: 1.75,
                                      divisions: 28,
                                      label: '${ttsProvider.displaySpeedPercentage}%',
                                      onChanged: (value) {
                                        ttsProvider.setSpeechRate(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 12),

                            // テキスト入力セクション
                            Container(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width < 350 ? 12 : 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4A90E2).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.keyboard,
                                          color: Color(0xFF4A90E2),
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'テキストから読み上げ',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width < 350 ? 13 : 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _textController,
                                          decoration: InputDecoration(
                                            hintText: 'テキストを入力...',
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontSize: MediaQuery.of(context).size.width < 350 ? 12 : 14,
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context).size.width < 350 ? 12 : 16,
                                              vertical: 12,
                                            ),
                                            counterStyle: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width < 350 ? 10 : 12,
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width < 350 ? 13 : 14,
                                          ),
                                          maxLines: 2,
                                          maxLength: 50,
                                          onSubmitted: (_) => _speakFromInput(),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFF4A90E2),
                                              Color(0xFF357ABD),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFF4A90E2).withOpacity(0.4),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: _speakFromInput,
                                            borderRadius: BorderRadius.circular(12),
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                MediaQuery.of(context).size.width < 350 ? 14 : 16,
                                              ),
                                              child: Icon(
                                                ttsProvider.isSpeaking
                                                    ? Icons.stop
                                                    : Icons.volume_up,
                                                size: MediaQuery.of(context).size.width < 350 ? 24 : 28,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
