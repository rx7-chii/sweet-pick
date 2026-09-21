# SWEET PICK

今のトレンドお菓子が、3タップでわかる — モバイルファースト PWA（MVP / モックデータ版）

## 本番デプロイ（Vercel）

GitHub リポジトリ: https://github.com/rx7-chii/sweet-pick

### ワンクリックでインポート

1. 次の URL を開く（Vercel に GitHub リポジトリを読み込む）  
   **https://vercel.com/new/import?s=https://github.com/rx7-chii/sweet-pick**
2. GitHub 連携を許可（初回のみ）
3. 設定はデフォルトのまま **Deploy**
4. 環境変数は **追加不要**（モック版）

デプロイ完了後:

| ページ | URL |
|--------|-----|
| アプリ | `https://<プロジェクト名>.vercel.app/` |
| 宣伝 | `https://<プロジェクト名>.vercel.app/promo/index.html` |

詳細: [docs/本番デプロイ.md](docs/本番デプロイ.md)

## ローカル開発

```powershell
npm install
npm run dev
```

http://localhost:3000

## オフライン配布パッケージ

```powershell
npm run package:demo
```

`dist/sweet-pick-demo-offline.zip` が生成されます。
