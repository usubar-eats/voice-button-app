import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// アプリ情報画面（Play Store審査対応・最小構成版）
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  /// プライバシーポリシーのURL
  static const String privacyPolicyUrl =
      'https://usubar-eats.github.io/voice-button-app/privacy_policy.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アプリ情報'),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A90E2),
              Color(0xFF357ABD),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  
                  // アプリアイコン
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/icons/app_icon.png',
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.record_voice_over,
                            size: 60,
                            color: Color(0xFF4A90E2),
                          );
                        },
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // アプリ名
                  const Text(
                    'ことばボタン',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // サブタイトル
                  const Text(
                    '声が出ない時に、ワンタップで伝える',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // バージョン
                  const Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // プライバシーポリシー
                  _buildInfoCard(
                    context,
                    icon: Icons.privacy_tip_outlined,
                    title: 'プライバシーポリシー',
                    subtitle: '個人情報の取り扱いについて',
                    onTap: () => _launchUrl(privacyPolicyUrl),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // データ削除
                  _buildInfoCard(
                    context,
                    icon: Icons.delete_outline,
                    title: 'データの削除',
                    subtitle: 'アンインストールで全データが削除されます',
                    onTap: () => _showDataDeletionInfo(context),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // フッター（開発者名のみ）
                  const Text(
                    '© 2025 usubar-eats',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 情報カードウィジェット
  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A90E2).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF4A90E2),
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C5F8D),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// URLを開く
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  /// データ削除情報を表示
  void _showDataDeletionInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Row(
          children: [
            Icon(Icons.delete_outline, color: Color(0xFF4A90E2)),
            SizedBox(width: 12),
            Text('データの削除について'),
          ],
        ),
        content: const Text(
          'このアプリはすべてのデータを端末内にのみ保存しています。\n\n'
          'アプリをアンインストールすると、保存されたすべてのデータ（スニペット、設定等）が完全に削除されます。\n\n'
          '個人情報や使用データは外部に送信されません。',
          style: TextStyle(height: 1.6),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }
}

