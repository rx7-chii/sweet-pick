# Supabase セットアップ（本番 DB 接続）

Vercel 上で **モックではなく DB 版** を動かす手順です。

## 1. Supabase プロジェクト作成

1. https://supabase.com でプロジェクト作成（Region: **Northeast Asia (Tokyo)** 推奨）
2. **Project Settings → API** から以下を控える:
   - Project URL → `NEXT_PUBLIC_SUPABASE_URL`
   - anon public key → `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY`
   - service_role key → `SUPABASE_SERVICE_ROLE_KEY`（**秘密・サーバー専用**）

## 2. スキーマ & シード投入

**SQL Editor** で順に実行:

1. `supabase/migrations/202509210001_sweet_pick_schema.sql`
2. `supabase/seed.sql`（60 商品）

## 3. Vercel 環境変数

Project → **Settings → Environment Variables** に追加（Production / Preview / Development すべて）:

| 変数名 | 値 |
|--------|-----|
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase Project URL |
| `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY` | anon key |
| `SUPABASE_SERVICE_ROLE_KEY` | service_role key |
| `NEXT_PUBLIC_IMAGE_DIRECT_FETCH` | `true` |

追加後 **Redeploy** してください。

## 4. 動作確認

- https://sweet-pick.vercel.app/api/trends?channel=convenience&limit=3
- 13 件以上の商品が返れば DB 接続成功
- 環境変数未設定時は従来どおり **モック 13 件** にフォールバック

## 5. ローカル開発（DB 接続）

`.env.local` を作成:

```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY=eyJ...
SUPABASE_SERVICE_ROLE_KEY=eyJ...
NEXT_PUBLIC_IMAGE_DIRECT_FETCH=true
```

```powershell
npm run dev
```
