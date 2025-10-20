# 🚀 クイックセットアップ（5分で完了）

## ステップ1: GitHubでリポジトリを作成（1分）

以下のリンクをクリックして、GitHubで新しいリポジトリを作成してください：

**👉 https://github.com/new**

### 入力内容：

```
Repository name: voice-button-app
Description: 声ボタン - 文字を打つだけで話してくれるアプリ / Voice Button - Text-to-Speech App for Japanese
Public ☑ （チェック）
❌ Initialize this repository with a README （チェックしない）
❌ Add .gitignore （チェックしない）
❌ Choose a license （チェックしない）
```

「**Create repository**」をクリック

---

## ステップ2: ターミナルでプッシュ（1分）

GitHubでリポジトリが作成されたら、以下のコマンドをコピペして実行：

```bash
cd /Users/usuba.yusuke/usuba_pj/voice_assistant_app

# リモートリポジトリを追加
git remote add origin https://github.com/usubar-eats/voice-button-app.git

# プッシュ
git push -u origin main
```

---

## ステップ3: 確認（30秒）

以下のURLで確認：
👉 **https://github.com/usubar-eats/voice-button-app**

---

## 🎉 完了！

リポジトリが公開されました！

### 次のステップ（オプション）

1. **Topicsを追加**（リポジトリページの「About」の⚙️から）
   - `flutter`, `android`, `text-to-speech`, `tts`, `accessibility`, `japanese`, `voice-assistant`

2. **Releaseを作成**（リポジトリページの「Releases」→「Create a new release」から）
   - Tag: `v1.0.0`
   - Title: `v1.0.0 - 初回リリース`
   - APKファイルをアップロード: `build/app/outputs/flutter-apk/app-release.apk`

---

**作成日**: 2025-10-20

