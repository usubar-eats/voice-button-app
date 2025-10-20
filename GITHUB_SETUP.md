# GitHubリポジトリセットアップ手順

## 🚀 GitHubリポジトリの作成

### Step 1: GitHubでリポジトリを作成

1. [GitHub](https://github.com/usubar-eats)にアクセス
2. 右上の「+」→「New repository」をクリック
3. 以下の設定で作成：

```
Repository name: voice-button-app
Description: 声ボタン - 文字を打つだけで話してくれるアプリ / Voice Button - Text-to-Speech App for Japanese
Public または Private: Public（オープンソースとして公開する場合）
Initialize this repository with:
  ☐ Add a README file (既にあるので不要)
  ☐ Add .gitignore (既にあるので不要)
  ☑ Choose a license: MIT (既に追加済み)
```

4. 「Create repository」をクリック

### Step 2: リモートリポジトリを追加

ターミナルで以下のコマンドを実行：

```bash
# voice_assistant_appディレクトリに移動
cd /Users/usuba.yusuke/usuba_pj/voice_assistant_app

# GitHubリポジトリをリモートとして追加
git remote add origin https://github.com/usubar-eats/voice-button-app.git

# mainブランチにプッシュ
git push -u origin main
```

### Step 3: GitHubの認証

プッシュ時に認証が求められた場合：

#### 方法1: Personal Access Token（推奨）
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. "Generate new token (classic)" をクリック
3. Note: "voice-button-app"
4. Expiration: 90 days（または好みの期間）
5. Select scopes:
   - ☑ repo（すべてのrepoスコープ）
6. "Generate token" をクリック
7. トークンをコピー（再表示できないので注意）
8. プッシュ時にパスワードの代わりにトークンを入力

#### 方法2: GitHub CLI（gh）
```bash
# GitHub CLIをインストール（Homebrewの場合）
brew install gh

# 認証
gh auth login

# プッシュ
git push -u origin main
```

## 📝 推奨：リポジトリ設定

### About セクション
1. リポジトリページの右上の⚙️（Settings）
2. "About"セクションで以下を設定：
   - Website: APKのダウンロードリンクなど
   - Topics: `flutter`, `android`, `text-to-speech`, `tts`, `accessibility`, `japanese`, `voice-assistant`

### README badges（オプション）
README.mdの先頭に追加：

```markdown
# 声ボタン / Voice Button

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev/)
[![Platform](https://img.shields.io/badge/Platform-Android-green.svg)](https://www.android.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-orange.svg)](https://github.com/usubar-eats/voice-button-app/releases)
```

### GitHub Releases
初回リリースを作成：

1. リポジトリページの "Releases" → "Create a new release"
2. Tag version: `v1.0.0`
3. Release title: `v1.0.0 - 初回リリース`
4. Description: プロジェクト完了報告書の内容を要約
5. Attach APK file: `app-release.apk` をアップロード
6. "Publish release" をクリック

## 🔗 リポジトリURL

作成後のリポジトリURL：
```
https://github.com/usubar-eats/voice-button-app
```

## ✅ 完了チェックリスト

- [ ] GitHubでリポジトリを作成
- [ ] リモートリポジトリを追加
- [ ] `git push -u origin main` を実行
- [ ] About セクションを設定
- [ ] Topics を追加
- [ ] Releases を作成してAPKをアップロード
- [ ] （オプション）README badges を追加

## 🎉 完了！

リポジトリが公開されたら、以下のURLで確認できます：
- リポジトリ: https://github.com/usubar-eats/voice-button-app
- Releases: https://github.com/usubar-eats/voice-button-app/releases

---

**作成日**: 2025-10-20  
**作成者**: usuba.yusuke

