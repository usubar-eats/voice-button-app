# 🚀 Google Play Store 公開準備完了！

## 🎉 おめでとうございます！

「ことばボタン」のPlay Store公開に必要なすべての準備が整いました！

---

## ✅ 完了した準備

### 1. アプリ本体
- ✅ **AAB（Android App Bundle）**: 41MB
- ✅ **Keystoreで署名済み**
- ✅ **ファイル場所**: `build/app/outputs/bundle/release/app-release.aab`

### 2. ストアアセット
- ✅ **プライバシーポリシー**: GitHub Pagesで公開準備完了
- ✅ **フィーチャーグラフィック**: 1024x500px（404KB）
- ✅ **スクリーンショット**: 7枚撮影済み

### 3. 開発環境
- ✅ **Keystore作成**: バックアップ推奨
- ✅ **署名設定**: 完了
- ✅ **Gitリポジトリ**: GitHub管理中

---

## 📋 Play Store公開の手順

### ステップ1: Google Play Console アカウント作成

#### 必要なもの
- **Googleアカウント**
- **登録料**: $25（一度のみ、生涯有効）
- **クレジットカード**（登録料支払い用）

#### 手順
1. https://play.google.com/console にアクセス
2. 「Get Started」をクリック
3. $25の登録料を支払い
4. 開発者情報を入力

---

### ステップ2: GitHub Pages でプライバシーポリシーを公開

#### 手順
1. https://github.com/usubar-eats/voice-button-app にアクセス
2. 「**Settings**」タブをクリック
3. 左サイドバーの「**Pages**」をクリック
4. **Source** セクションで：
   - Branch: `main` を選択
   - Folder: `/docs` を選択
5. 「**Save**」をクリック

#### 公開URL（数分後に有効）
```
https://usubar-eats.github.io/voice-button-app/privacy_policy.html
```

このURLをPlay Storeの「プライバシーポリシー」欄に記入します。

---

### ステップ3: 新しいアプリを作成

#### Google Play Console で

1. **「すべてのアプリ」** → **「アプリを作成」**をクリック

2. **基本情報を入力**:
   ```
   アプリ名: ことばボタン
   デフォルトの言語: 日本語
   アプリまたはゲーム: アプリ
   無料または有料: 無料
   ```

3. **宣言事項**にチェック:
   - ✅ Play の開発者プログラム ポリシーを遵守することを確認します
   - ✅ 米国の輸出法を遵守することを確認します

4. **「アプリを作成」**をクリック

---

### ステップ4: アプリ情報を入力

#### ストアの設定

##### 1. アプリ詳細

```
アプリ名: ことばボタン

簡単な説明（80文字以内）:
声が出ない時に話す読み上げアプリ。登録した言葉をワンタップで音声化。

詳しい説明（4000文字以内）:
声が出ないとき、話したい言葉をワンタップで再生。
**ことばボタン**は、風邪・喉の不調・声帯の病気など「物理的に声が出せない場面」で、あなたの代わりに話してくれる読み上げアプリです。

よく使う言葉を登録しておけば、画面を見せることなく音声で伝えられます。
例えば――
・「ありがとうございます」
・「温めなくて大丈夫です」
・「少々お待ちください」
など、あなたの日常の"ひとこと"をすぐ声に。

🌿 **主な特徴**

* 登録した言葉をワンタップで読み上げ
* 音声スピードや声質をカンタン調整
* よく使うフレーズを最大50個まで登録
* オフラインで完全動作（通信不要）
* 個人情報の収集なし

🎯 **こんな時に便利**

* 🤧 風邪で声が出ない時の意思疎通
* 🏥 喉の手術後のリハビリ期間
* 🩺 声帯の病気で声が出せない時
* 🏪 コンビニ・お店での注文（声が出せない時）
* 🏢 職場での簡単な連絡（声が出せない時）
* 👥 介護・支援の現場（発声困難な方の支援）

⚠️ **重要**: このアプリは物理的に声が出せない時の代替手段です。会議中や電車内など、声を出してはいけない場面では使用できません。

🔒 **プライバシー**

* 完全オフライン動作（インターネット不要）
* すべてのデータは端末内にのみ保存
* 個人情報・使用データの外部送信なし
```

##### 2. グラフィック

- **アプリアイコン**: 512x512px（既存のアイコンから作成）
- **フィーチャーグラフィック**: `assets/store/feature_graphic.png`（1024x500px）
- **スクリーンショット**: 撮影済みの7枚をアップロード

##### 3. 分類

```
アプリのカテゴリ: 健康&フィットネス
または: 医療
```

##### 4. 連絡先の詳細

```
メールアドレス: （あなたのメール）
ウェブサイト: https://github.com/usubar-eats/voice-button-app（任意）
```

##### 5. プライバシーポリシー

```
https://usubar-eats.github.io/voice-button-app/privacy_policy.html
```

---

### ステップ5: アプリのコンテンツ

#### 1. プライバシーとセキュリティ

**アプリのアクセス権限**
- 説明: 音声合成（TTS）のみ使用

**データの安全性**
- ユーザーデータの収集: いいえ
- データの共有: いいえ
- セキュリティ対策: すべてローカル保存

**広告**
- 広告を表示: いいえ

#### 2. ターゲット層とコンテンツ

**ターゲット層**
- すべての年齢層（ESRB: Everyone）

**コンテンツレーティング**
- 質問票に回答（すべて「いいえ」でOK）

#### 3. ニュース

- ニュースアプリ: いいえ

---

### ステップ6: AABをアップロード

#### 本番環境トラックに公開

1. **「本番環境」** → **「新しいリリースを作成」**をクリック

2. **AABファイルをアップロード**:
   ```
   build/app/outputs/bundle/release/app-release.aab
   ```

3. **リリース名とリリースノート**を入力:
   ```
   リリース名: 1.0.0
   
   リリースノート（日本語）:
   初回リリース
   
   ・ワンタップ読み上げ機能
   ・スニペット管理（追加・編集・削除）
   ・読み上げ速度調整
   ・4種類の日本語音声
   ・オフライン完全対応
   ```

4. **「次へ」**をクリック

5. **審査に送信**

---

### ステップ7: 審査と公開

#### 審査期間
- **通常**: 数日〜1週間
- **初回審査**: やや長め

#### 審査結果
- ✅ **承認**: 自動的にPlay Storeで公開
- ❌ **却下**: 理由が通知され、修正後に再送信可能

---

## 📁 必要ファイルのまとめ

### ローカルファイル

```
/Users/usuba.yusuke/usuba_pj/voice_assistant_app/

├── build/app/outputs/bundle/release/
│   └── app-release.aab                    ← Play Storeにアップロード
│
├── assets/store/
│   └── feature_graphic.png                ← ストアに使用
│
├── android/app/keystore/
│   └── kotoba-button-key.jks              ← 絶対にバックアップ！
│
└── android/
    └── key.properties                     ← パスワード（安全に保管）
```

### オンラインリソース

- **プライバシーポリシー**: https://usubar-eats.github.io/voice-button-app/privacy_policy.html
- **GitHubリポジトリ**: https://github.com/usubar-eats/voice-button-app
- **スクリーンショット**: 撮影済み（アップロード用）

---

## ⚠️ 重要な注意事項

### Keystoreのバックアップ（必須）

**絶対に忘れないでください！**

```bash
# デスクトップにバックアップ
cp /Users/usuba.yusuke/usuba_pj/voice_assistant_app/android/app/keystore/kotoba-button-key.jks ~/Desktop/kotoba-button-key-BACKUP-$(date +%Y%m%d).jks

# パスワード情報を紙に記録
# アプリ名: ことばボタン
# Keystoreファイル名: kotoba-button-key.jks
# Keystoreパスワード: （あなたのパスワード）
# Keyエイリアス: kotoba-button
# 作成日: 2025-10-21
```

---

## 💡 Tips

### アプリアイコン作成（512x512px）

現在のアイコンをリサイズ：

```bash
sips -z 512 512 /Users/usuba.yusuke/usuba_pj/voice_assistant_app/assets/icons/app_icon.png --out ~/Desktop/app_icon_512.png
```

### Google Play Console の言語設定

- 日本語のみでOK
- 後から他の言語を追加可能

---

## 🎯 次のアクション

1. **今すぐ**: Keystoreをバックアップ
2. **次に**: Google Play Console アカウントを作成
3. **その後**: GitHub Pages でプライバシーポリシーを公開
4. **最後に**: Play Console でアプリを登録＆審査申請

---

## 📞 サポート

- **Google Play Console ヘルプ**: https://support.google.com/googleplay/android-developer
- **このプロジェクトのIssues**: https://github.com/usubar-eats/voice-button-app/issues

---

## 🎉 完了！

すべての準備が整いました！

あとは Google Play Console でアカウントを作成し、アプリ情報を登録するだけです。

頑張ってください！✨

---

作成日: 2025-10-21  
バージョン: 1.0  
ステータス: 公開準備完了 ✅

