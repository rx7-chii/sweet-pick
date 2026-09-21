# SWEET PICK 実装ログ

> このファイルは実装の進捗を記録します。更新日時: 2026-09-21

---

## 現在のフェーズ

**Phase: MVP フロントエンド実装（モックデータ版）**

プロンプト `4.frontend-implementation-prompt.md` に従い、UI と基本動作を実装中。  
**DB（Supabase）接続・認証（Clerk）は今回は未実装**（講義用プロンプトの指示どおり）。

---

## 完了した作業 ✅

| # | 作業内容 | 状態 |
|---|----------|------|
| 1 | `package.json` 作成（Next.js 15, React 19, Tailwind v4, TypeScript） | ✅ 完了 |
| 2 | 設定ファイル（`tsconfig.json`, `next.config.ts`, `postcss.config.mjs`） | ✅ 完了 |
| 3 | グローバルスタイル（デュアルテーマ CSS 変数）`app/globals.css` | ✅ 完了 |
| 4 | 型定義 `lib/types.ts` | ✅ 完了 |
| 5 | モックデータ（商品13件）`lib/mock-data.ts` | ✅ 完了 |
| 6 | チャネル Context `context/ChannelContext.tsx` | ✅ 完了 |
| 7 | お気に入り Hook `hooks/useFavorites.ts`（LocalStorage） | ✅ 完了 |
| 8 | UI コンポーネント（Header, ChannelToggle, SearchBar, ProductCard 等） | ✅ 完了 |
| 9 | API Routes（モックデータ使用） | ✅ 完了 |
| 10 | ページ4枚（ホーム / 検索 / 詳細 / お気に入り） | ✅ 完了 |
| 11 | PWA manifest `public/manifest.json` | ✅ 完了 |

---

## 進行中の作業 🔄

| # | 作業内容 | 状態 | 備考 |
|---|----------|------|------|
| 12 | `npm install`（依存パッケージのインストール） | ✅ **成功** | `NODE_OPTIONS=--use-system-ca` で324パッケージ |
| 13 | `npm run build`（ビルド確認） | ✅ **成功** | Clerk 旧ファイル削除後 |
| 14 | `npm run dev`（ローカル起動確認） | ✅ **起動中** | http://localhost:3000 |

---

## 未着手 ⏳

| # | 作業内容 |
|---|----------|
| 15 | Supabase DB 接続（Phase 2） |
| 16 | 本番デプロイ（Vercel） |

---

## 作成したファイル一覧

```
demo-implementation/
├── app/
│   ├── layout.tsx          … ルートレイアウト + ChannelProvider
│   ├── page.tsx            … ホーム
│   ├── globals.css         … テーマ CSS
│   ├── search/page.tsx     … 検索結果
│   ├── products/[id]/page.tsx … 商品詳細
│   ├── favorites/page.tsx  … お気に入り
│   └── api/
│       ├── search/route.ts
│       ├── trends/route.ts
│       ├── products/[id]/route.ts
│       └── sponsors/route.ts
├── components/
│   ├── channel/ChannelToggle.tsx
│   ├── home/HomeContent.tsx
│   ├── layout/Header.tsx
│   ├── product/ProductCard.tsx, SponsorCard.tsx, FavoriteButton.tsx
│   ├── search/SearchBar.tsx, SearchResults.tsx
│   └── trend/TrendList.tsx
├── context/ChannelContext.tsx
├── hooks/useFavorites.ts
├── lib/mock-data.ts, types.ts, search.ts
├── public/manifest.json
└── package.json
```

---

## トラブル・注意点 ⚠️

### npm install 失敗（2026-09-21）

**エラー:** `UNABLE_TO_VERIFY_LEAF_SIGNATURE`  
**原因:** npm レジストリ（registry.npmjs.org）への HTTPS 接続で SSL 証明書を検証できない（社内プロキシ・セキュリティソフト等の可能性）

**ログ:** `demo-implementation/logs/npm-install.log`

### 対処方法（ターミナルで手動実行）

**方法 A（推奨）— Node.js v24 のシステム CA を使用:**

```powershell
cd c:\Users\81905\Desktop\cursor\INPUT\sample_project_sweets\sample_project\demo-implementation
$env:NODE_OPTIONS="--use-system-ca"
npm install
npm run dev
```

**方法 B — 証明書問題が続く場合（IT 担当に相談推奨）:**

```powershell
npm config set strict-ssl false
npm install
npm run dev
```

ブラウザで http://localhost:3000 を開く。

---

## 次にやること

1. `npm install` を完了させる
2. `npm run dev` で起動確認
3. 動作確認: 検索「ポテチ」、コンビニ/デパ地下切替、お気に入り

---

## ログ更新履歴

| 日時 | 内容 |
|------|------|
| 2026-09-21 11:39 | 初版作成。コード実装完了、npm install 待ち |
| 2026-09-21 11:41 | npm install はユーザー承認後に実行する方針に変更 |
| 2026-09-21 11:58 | npm install 実行 → SSL 証明書エラーで失敗 |
