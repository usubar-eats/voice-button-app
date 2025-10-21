# 🖼️ アイコン変換ガイド

SVGファイルをPNGに変換する方法をいくつか紹介します。

---

## 方法1: オンラインツールで変換（最も簡単）⭐️

### SVG to PNG Converter

1. https://svgtopng.com/ にアクセス
2. `assets/icons/kotoba_button_icon.svg` をアップロード
3. サイズを **512x512** に設定
4. 「Convert」をクリック
5. `kotoba_button_icon.png` をダウンロード
6. `assets/icons/app_icon.png` としてリネーム

---

## 方法2: macOSのプレビューで変換

1. `assets/icons/kotoba_button_icon.svg` をダブルクリック（プレビューで開く）
2. 「ファイル」>「書き出す」
3. フォーマット: PNG
4. 解像度: 512x512（必要に応じてサイズ変更）
5. 保存先: `assets/icons/app_icon.png`

---

## 方法3: Figmaで開いて変換

1. Figma で新しいファイルを作成
2. `kotoba_button_icon.svg` をドラッグ&ドロップ
3. サイズを 512x512 に調整
4. 右パネルの「Export」
5. フォーマット: PNG、サイズ: 1x (512x512)
6. エクスポート → `app_icon.png` としてリネーム
7. `assets/icons/` に配置

---

## 方法4: Homebrewでツールをインストール（技術者向け）

```bash
# librsvg（rsvg-convert）をインストール
brew install librsvg

# SVGをPNGに変換
rsvg-convert -w 512 -h 512 \
  assets/icons/kotoba_button_icon.svg \
  -o assets/icons/app_icon.png
```

---

## ✅ 変換後の確認

変換が完了したら、以下を確認してください：

```bash
# ファイルサイズ確認
ls -lh assets/icons/app_icon.png

# 画像サイズ確認（sipsコマンド、macOS）
sips -g pixelWidth -g pixelHeight assets/icons/app_icon.png
```

出力例:
```
pixelWidth: 512
pixelHeight: 512
```

---

## 🚀 次のステップ

PNGファイルが準備できたら、以下のコマンドでアイコンを適用：

```bash
# Flutter アイコン生成
cd /Users/usuba.yusuke/usuba_pj/voice_assistant_app
flutter pub run flutter_launcher_icons

# ビルド
flutter build apk --release
```

---

**推奨**: 方法1のオンラインツールが最も簡単で確実です！

