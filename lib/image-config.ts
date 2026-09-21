/**
 * 画像読み込み方針
 *
 * - mock（ローカル）: /images/... をそのまま配信
 * - 本番デプロイ: Supabase Storage 等の HTTPS URL をブラウザが CDN から直接取得
 *   （Next.js のサーバー経由最適化は使わない = SSL / プロキシ問題を避ける）
 */

export function isExternalImageUrl(src: string): boolean {
  return src.startsWith("http://") || src.startsWith("https://");
}

export function isLocalImageUrl(src: string): boolean {
  return src.startsWith("/");
}

/** Supabase Storage 公開 URL かどうか */
export function isSupabaseStorageUrl(src: string): boolean {
  try {
    const { hostname, pathname } = new URL(src);
    return (
      hostname.endsWith(".supabase.co") &&
      pathname.startsWith("/storage/v1/object/public/")
    );
  } catch {
    return false;
  }
}

/**
 * true = ブラウザが src を直接取得（<img src="https://..."> 相当）
 * 本番ではデフォルトで外部 URL は直読み。開発でも NEXT_PUBLIC_IMAGE_DIRECT_FETCH !== "false" なら直読み。
 */
export function shouldUseDirectImageFetch(src: string): boolean {
  if (isLocalImageUrl(src)) return true;

  if (!isExternalImageUrl(src)) return false;

  if (process.env.NODE_ENV === "production") {
    return process.env.NEXT_PUBLIC_IMAGE_DIRECT_FETCH !== "false";
  }

  return process.env.NEXT_PUBLIC_IMAGE_DIRECT_FETCH !== "false";
}

/** 取得失敗時に使う mock 代替画像（public/images/sweets） */
export const FALLBACK_PRODUCT_IMAGES = {
  chips: "/images/sweets/chips.jpg",
  chocolate: "/images/sweets/chocolate.jpg",
  cookie: "/images/sweets/cookie.jpg",
  wagashi: "/images/sweets/wagashi.jpg",
  gift: "/images/sweets/gift.jpg",
  candy: "/images/sweets/candy.jpg",
} as const;

export const DEFAULT_FALLBACK_IMAGE = FALLBACK_PRODUCT_IMAGES.chips;

/** カテゴリに応じた代替画像 URL */
export function getFallbackImageUrl(category?: string | null): string {
  if (!category) return DEFAULT_FALLBACK_IMAGE;

  if (category.includes("スナック") || category.includes("ポテチ")) {
    return FALLBACK_PRODUCT_IMAGES.chips;
  }
  if (category.includes("チョコ")) {
    return FALLBACK_PRODUCT_IMAGES.chocolate;
  }
  if (category.includes("クッキー")) {
    return FALLBACK_PRODUCT_IMAGES.cookie;
  }
  if (category.includes("和菓子")) {
    return FALLBACK_PRODUCT_IMAGES.wagashi;
  }
  if (category.includes("洋菓子") || category.includes("ギフト")) {
    return FALLBACK_PRODUCT_IMAGES.gift;
  }

  return DEFAULT_FALLBACK_IMAGE;
}

/** API / DB から渡された imageUrl をそのまま使う（本番想定） */
export function resolveProductImageUrl(imageUrl: string | null | undefined): string {
  if (imageUrl?.trim()) return imageUrl.trim();
  return DEFAULT_FALLBACK_IMAGE;
}
