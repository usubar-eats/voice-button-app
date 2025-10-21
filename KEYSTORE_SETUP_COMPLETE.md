# 🔐 Keystore設定完了ガイド

## ✅ 完了したこと

1. ✅ **Keystoreファイル作成完了**
   - ファイル: `/android/app/keystore/kotoba-button-key.jks`
   - サイズ: 2.7KB
   - 有効期限: 約27年（10,000日）

2. ✅ **Gradle署名設定完了**
   - `build.gradle.kts` に署名設定を追加
   - releaseビルド時に自動的にKeystoreで署名

3. ✅ **セキュリティ設定完了**
   - `.gitignore` にKeystore除外設定を追加
   - パスワードファイルもGit管理外に設定

---

## 🔑 重要：パスワード設定（今すぐ実行）

### ステップ1: key.propertiesファイルを開く

以下のファイルをテキストエディタで開いてください：

```
/Users/usuba.yusuke/usuba_pj/voice_assistant_app/android/key.properties
```

### ステップ2: パスワードを入力

ファイル内の以下の箇所を、あなたが設定したパスワードに置き換えてください：

```properties
storePassword=YOUR_KEYSTORE_PASSWORD  ← ここを実際のパスワードに変更
keyPassword=YOUR_KEY_PASSWORD        ← ここを実際のパスワードに変更
keyAlias=kotoba-button
storeFile=keystore/kotoba-button-key.jks
```

**例**（パスワードが `MyPass123` の場合）:
```properties
storePassword=MyPass123
keyPassword=MyPass123
keyAlias=kotoba-button
storeFile=keystore/kotoba-button-key.jks
```

### ステップ3: ファイルを保存

- Mac: `Cmd + S`
- Windows: `Ctrl + S`

---

## ⚠️ 超重要：バックアップ

以下のファイルを**今すぐ**バックアップしてください：

### バックアップが必要なファイル

1. **Keystoreファイル**（最重要）
   ```
   /Users/usuba.yusuke/usuba_pj/voice_assistant_app/android/app/keystore/kotoba-button-key.jks
   ```

2. **パスワード情報**（紙に書いて保管）
   ```
   アプリ名: ことばボタン
   Keystoreファイル名: kotoba-button-key.jks
   Keystoreパスワード: （あなたのパスワード）
   Keyエイリアス: kotoba-button
   Keyパスワード: （あなたのパスワード）
   作成日: 2025-10-21
   ```

### 推奨バックアップ先

- ✅ USBメモリ（暗号化推奨）
- ✅ Google Drive / Dropbox（プライベートフォルダ）
- ✅ 外付けHDD
- ✅ 紙にパスワードを記録（金庫保管）

### バックアップコマンド例

```bash
# デスクトップにコピー
cp /Users/usuba.yusuke/usuba_pj/voice_assistant_app/android/app/keystore/kotoba-button-key.jks ~/Desktop/kotoba-button-key-BACKUP.jks

# Google Driveにコピー（パスは環境に応じて変更）
# cp /Users/usuba.yusuke/usuba_pj/voice_assistant_app/android/app/keystore/kotoba-button-key.jks ~/Google\ Drive/Backups/
```

---

## 🚫 絶対にやってはいけないこと

- ❌ Keystoreファイルを削除する
- ❌ パスワードを忘れる
- ❌ Keystoreファイルを他人と共有する
- ❌ GitHubにKeystoreをプッシュする
- ❌ パスワードをSlack/Discord等に投稿する

**これらをしてしまうと、アプリの更新が二度とできなくなります**

---

## ✅ 設定確認

パスワード設定が完了したら、私に「パスワード設定完了」と教えてください。

次は、このKeystoreを使って**AAB（Android App Bundle）**をビルドします！

---

## 🎯 次のステップ

1. ✅ key.propertiesにパスワードを設定
2. ✅ Keystoreをバックアップ
3. ⏭️ AAB（Android App Bundle）をビルド
4. ⏭️ Google Play Consoleにアップロード

---

作成日: 2025-10-21  
重要度: ⭐⭐⭐⭐⭐（最重要）

