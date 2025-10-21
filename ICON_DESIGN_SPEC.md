# 🎨 ことばボタン アイコンデザイン仕様書

## 📐 デザインコンセプト

**推奨デザイン**: 吹き出し＋ボタン

温かみがあり、親しみやすく、機能が一目で分かるデザイン。

---

## 🎨 カラーパレット

```
Primary Color (メインブルー):
  Hex: #6FA8DC
  RGB: (111, 168, 220)
  用途: 吹き出しの背景

Secondary Color (アクセントコーラル):
  Hex: #F4A896
  RGB: (244, 168, 150)
  用途: ボタンの色

Gradient:
  Start: #6FA8DC (優しいスカイブルー)
  End: #4A90E2 (深いブルー)
  用途: 吹き出しに深みを持たせる

Background:
  Hex: #FFFFFF
  RGB: (255, 255, 255)
  用途: アイコン背景

Shadow:
  Color: rgba(74, 144, 226, 0.3)
  Blur: 8px
  Offset: (0, 4px)
```

---

## 📏 アイコンサイズ仕様

### Android用
- **512x512 PNG** (Play Store用、必須)
- **背景透過なし**、フルカラー
- **Safe Area**: 中央 424x424 (端から44px内側)
- **ファイル形式**: PNG、32bit color

### 将来的なiOS用
- **1024x1024 PNG** (App Store用)

---

## 🎨 デザイン詳細

### レイアウト

```
┌─────────────────────────────────┐
│        512 x 512 px             │
│                                 │
│   ┌───────────────────────┐   │
│   │   Safe Area (424x424)  │   │
│   │                         │   │
│   │    ┏━━━━━━━━━┓         │   │
│   │    ┃  💬     ┃         │   │  ← 吹き出し
│   │    ┃    ●    ┃         │   │  ← 丸いボタン
│   │    ┗━━━━━━━━━┛         │   │
│   │                         │   │
│   └───────────────────────┘   │
│                                 │
└─────────────────────────────────┘
```

### 要素の配置

1. **吹き出し（Speech Bubble）**
   - サイズ: 300x240px
   - 位置: 中央（256, 256を中心に配置）
   - 角丸: 40px
   - 三角形（尻尾）: 左下に配置
     - 幅: 40px、高さ: 30px
   - グラデーション: #6FA8DC → #4A90E2（上から下へ）
   - ボーダー: なし
   - 影: rgba(74, 144, 226, 0.3)、8px blur、offset (0, 4px)

2. **ボタン（Circle Button）**
   - サイズ: 120x120px
   - 位置: 吹き出しの中央
   - 色: #F4A896（アクセントコーラル）
   - ボーダー: 8px、#FFFFFF（白）
   - 影: rgba(244, 168, 150, 0.5)、6px blur、offset (0, 3px)

3. **ハイライト（Optional）**
   - 吹き出し左上に白い楕円形のハイライト
   - サイズ: 80x50px
   - 色: rgba(255, 255, 255, 0.4)
   - ぼかし: 20px

---

## 🛠️ 作成方法

### 方法1: Figma で作成（推奨）⭐️

#### Step 1: プロジェクト作成
1. Figma を開く: https://www.figma.com/
2. 新しいデザインファイルを作成
3. フレームを追加: 512x512px

#### Step 2: 吹き出しの作成
1. 四角形ツール (R) で長方形を描画
   - サイズ: 260x200px
   - 位置: X=126, Y=106
   - 角丸: 40px全て
2. Fill（塗り）:
   - タイプ: Linear（線形グラデーション）
   - 開始色: #6FA8DC（上）
   - 終了色: #4A90E2（下）
3. Effect（エフェクト）:
   - Drop Shadow を追加
   - X=0, Y=4, Blur=8
   - Color: #4A90E2, Opacity=30%

#### Step 3: 吹き出しの尻尾（三角形）
1. 三角形ツール で三角形を描画
   - サイズ: 40x30px
   - 位置: 吹き出しの左下に接続
   - 回転: 適宜調整して左下を向かせる
2. Fill: #6FA8DC（グラデーションの開始色と同じ）

#### Step 4: ボタンの作成
1. 楕円形ツール (O) で正円を描画
   - サイズ: 120x120px
   - 位置: 吹き出しの中央
2. Fill: #F4A896
3. Stroke（線）:
   - 太さ: 8px
   - 色: #FFFFFF
   - 位置: Center
4. Effect:
   - Drop Shadow を追加
   - X=0, Y=3, Blur=6
   - Color: #F4A896, Opacity=50%

#### Step 5: ハイライト追加（Optional）
1. 楕円形ツールで楕円を描画
   - サイズ: 80x50px
   - 位置: 吹き出しの左上隅の内側
2. Fill: #FFFFFF
3. Opacity: 40%
4. Effect: Blur=20px

#### Step 6: エクスポート
1. すべての要素を選択してグループ化 (Cmd+G / Ctrl+G)
2. 右パネルの「Export」セクション
3. フォーマット: PNG
4. サイズ: 512x512 (1x)、必要に応じて 1024x1024 (2x) も
5. 「Export」をクリック

---

### 方法2: Canva で作成（簡単）

#### Step 1: プロジェクト作成
1. Canva を開く: https://www.canva.com/
2. 「カスタムサイズ」で 512x512px を作成
3. 背景を白に設定

#### Step 2: 吹き出しの作成
1. 左メニューから「図形」を選択
2. 「吹き出し」の図形を選択
3. サイズを調整: 中央に配置、約 260x200px
4. 色:
   - グラデーション塗りつぶし
   - 上: #6FA8DC
   - 下: #4A90E2
5. 影を追加:
   - エフェクト > 影 > ドロップシャドウ
   - 透明度: 30%
   - ぼかし: 20
   - 距離: 10

#### Step 3: ボタンの作成
1. 「図形」から円を選択
2. 吹き出しの中央に配置
3. サイズ: 約 120x120px
4. 色: #F4A896
5. 境界線:
   - 太さ: 8px
   - 色: 白
6. 影を追加:
   - エフェクト > 影 > ドロップシャドウ
   - 透明度: 50%
   - ぼかし: 15
   - 距離: 5

#### Step 4: エクスポート
1. 右上「共有」> 「ダウンロード」
2. ファイルの種類: PNG
3. サイズ: カスタム 512x512px
4. 「ダウンロード」をクリック

---

### 方法3: SVGコード（プログラム的生成）

以下のSVGコードをテキストエディタにコピーして、`kotoba_button_icon.svg` として保存：

\`\`\`svg
<svg width="512" height="512" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <!-- 吹き出しグラデーション -->
    <linearGradient id="bubbleGradient" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#6FA8DC;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#4A90E2;stop-opacity:1" />
    </linearGradient>
    
    <!-- 吹き出しの影 -->
    <filter id="bubbleShadow" x="-50%" y="-50%" width="200%" height="200%">
      <feGaussianBlur in="SourceAlpha" stdDeviation="4"/>
      <feOffset dx="0" dy="4" result="offsetblur"/>
      <feComponentTransfer>
        <feFuncA type="linear" slope="0.3"/>
      </feComponentTransfer>
      <feMerge>
        <feMergeNode/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>
    
    <!-- ボタンの影 -->
    <filter id="buttonShadow" x="-50%" y="-50%" width="200%" height="200%">
      <feGaussianBlur in="SourceAlpha" stdDeviation="3"/>
      <feOffset dx="0" dy="3" result="offsetblur"/>
      <feComponentTransfer>
        <feFuncA type="linear" slope="0.5"/>
      </feComponentTransfer>
      <feMerge>
        <feMergeNode/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>
  </defs>
  
  <!-- 背景 -->
  <rect width="512" height="512" fill="#FFFFFF"/>
  
  <!-- 吹き出し本体 -->
  <g filter="url(#bubbleShadow)">
    <!-- メイン吹き出し（角丸四角形） -->
    <rect x="126" y="106" width="260" height="200" rx="40" ry="40" 
          fill="url(#bubbleGradient)"/>
    
    <!-- 吹き出しの尻尾（三角形） -->
    <path d="M 146 306 L 126 336 L 166 316 Z" 
          fill="#6FA8DC"/>
  </g>
  
  <!-- ボタン -->
  <g filter="url(#buttonShadow)">
    <!-- ボタンの白縁 -->
    <circle cx="256" cy="206" r="64" fill="#FFFFFF"/>
    
    <!-- ボタン本体 -->
    <circle cx="256" cy="206" r="56" fill="#F4A896"/>
  </g>
  
  <!-- ハイライト（Optional） -->
  <ellipse cx="200" cy="140" rx="40" ry="25" 
           fill="#FFFFFF" opacity="0.4" 
           filter="blur(10px)"/>
</svg>
\`\`\`

**SVGをPNGに変換**:
1. https://svgtopng.com/ にアクセス
2. SVGファイルをアップロード
3. サイズを 512x512 に設定
4. 「Convert」をクリック
5. PNGをダウンロード

---

## 📝 代替案: オンラインツールで作成

### App Icon Generator（自動生成）

1. **Canva App Icon Template**
   - URL: https://www.canva.com/templates/app-icons/
   - 「App Icon」テンプレートを検索
   - 上記のデザイン仕様に基づいてカスタマイズ

2. **Hatch**
   - URL: https://hatchful.shopify.com/
   - 業種: Technology
   - スタイル: Friendly & Simple
   - カスタマイズ後にダウンロード

---

## ✅ 完成後のチェックリスト

デザイン完成後、以下を確認してください：

- [ ] サイズが 512x512px (Play Store用)
- [ ] 背景が白（透過なし）
- [ ] 32bit カラー PNG
- [ ] ファイルサイズが 1MB 以下
- [ ] Safe Area (424x424) 内にすべての重要な要素
- [ ] 縮小表示しても視認可能
- [ ] ブランドカラーを使用（#6FA8DC, #F4A896）
- [ ] 影が自然に見える
- [ ] エッジがシャープ（ぼやけていない）

---

## 📂 ファイル配置

完成したアイコンファイルを以下に配置：

```
voice_assistant_app/
└── assets/
    └── icons/
        └── app_icon.png  ← ここに配置
```

---

## 🔄 アイコン適用手順

### ステップ1: ファイル配置
```bash
# 作成したアイコンを assets/icons/ にコピー
cp ~/Downloads/kotoba_button_icon.png assets/icons/app_icon.png
```

### ステップ2: アイコン生成
```bash
# Flutter アイコン生成
flutter pub run flutter_launcher_icons
```

### ステップ3: ビルド
```bash
# リリースビルド
flutter build apk --release
```

---

## 🎨 デザインのバリエーション（将来的に）

### 季節限定アイコン
- **春**: 桜の花びらを追加
- **夏**: 明るい青色を強調
- **秋**: オレンジ系の配色
- **冬**: 雪の結晶を追加

### イベント限定
- **クリスマス**: 赤と緑の配色
- **お正月**: 日の丸モチーフ

---

**作成日**: 2025-10-20  
**対象アプリ**: ことばボタン v1.0.0  
**デザイナー**: usubar-eats

