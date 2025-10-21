# Keystore（署名鍵）作成ガイド

## ⚠️ 超重要：必ずお読みください

**Keystoreは、アプリの「実印」のようなものです。**

- ❌ **紛失すると、二度とアプリを更新できなくなります**
- ❌ **パスワードを忘れると、同じく更新できなくなります**
- ✅ **作成後は、必ず安全な場所にバックアップしてください**

---

## 📝 Keystore作成手順

### ステップ1: 新しいターミナルウィンドウを開く

現在のターミナルとは**別の新しいターミナル**を開いてください。

### ステップ2: 以下のコマンドをコピー＆実行

```bash
cd /Users/usuba.yusuke/usuba_pj/voice_assistant_app/android/app/keystore

keytool -genkey -v -keystore kotoba-button-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias kotoba-button
```

### ステップ3: 対話的に情報を入力

コマンドを実行すると、以下の質問がされます：

#### 1. **キーストアのパスワードを入力してください:**
- あなたが決めたパスワードを入力（6文字以上）
- **入力しても画面には表示されません**（セキュリティのため）
- Enter キーを押す

#### 2. **新規パスワードを再入力してください:**
- 同じパスワードをもう一度入力
- Enter キーを押す

#### 3. **姓名を入力してください:**
- 例: `Yusuke Usuba`
- Enter キーを押す

#### 4. **組織単位名を入力してください:**
- そのまま Enter キーを押す（省略可）

#### 5. **組織名を入力してください:**
- 例: `usubar-eats` または自分の名前
- Enter キーを押す

#### 6. **都市名または地域名を入力してください:**
- 例: `Tokyo`
- Enter キーを押す

#### 7. **州名または地方名を入力してください:**
- 例: `Tokyo`
- Enter キーを押す

#### 8. **この単位に該当する2文字の国コードを入力してください:**
- `JP` と入力
- Enter キーを押す

#### 9. **[いいえ]: と表示されたら**
- `はい` または `yes` と入力
- Enter キーを押す

#### 10. **<kotoba-button>のキーパスワードを入力してください:**
- そのまま Enter キーを押す（Keystoreと同じパスワードを使用）

---

## ✅ 完了の確認

コマンドが正常に完了すると、以下のファイルが作成されます：

```
/Users/usuba.yusuke/usuba_pj/voice_assistant_app/android/app/keystore/kotoba-button-key.jks
```

---

## 🔐 重要な情報を記録

以下の情報を**紙に書いて**、安全な場所に保管してください：

```
アプリ名: ことばボタン
Keystoreファイル名: kotoba-button-key.jks
Keystoreパスワード: （あなたが決めたもの）
Keyエイリアス: kotoba-button
Keyパスワード: （Keystoreと同じ）
作成日: 2025-10-21
```

---

## 💾 バックアップ方法

### 推奨バックアップ先

1. **USBメモリ**（暗号化推奨）
2. **クラウドストレージ**（Google Drive, Dropbox等）
3. **外付けハードディスク**

### バックアップコマンド

```bash
# デスクトップにコピー
cp /Users/usuba.yusuke/usuba_pj/voice_assistant_app/android/app/keystore/kotoba-button-key.jks ~/Desktop/

# または、Google Driveなどにコピー
```

---

## 🚫 絶対にやってはいけないこと

- ❌ Keystoreファイルを GitHub にプッシュしない
- ❌ パスワードをテキストファイルに保存して共有しない
- ❌ Keystoreファイルを削除しない

---

## 次のステップ

Keystore作成が完了したら、私に「完了しました」と教えてください。

次は、このKeystoreを使ってアプリに署名する設定を行います。

---

作成日: 2025-10-21  
重要度: ⭐⭐⭐⭐⭐（最重要）

