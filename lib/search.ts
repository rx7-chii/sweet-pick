import { getFallbackImageUrl, resolveProductImageUrl } from "./image-config";
import type { ProductSummary } from "./types";
import type { ProductDetail } from "./types";

function hasLimitedPeriodFlag(product: ProductDetail): boolean {
  return (
    product.isLimitedPeriod === true ||
    product.tags?.includes("期間限定") === true ||
    product.name.includes("季節限定")
  );
}

function hasStoreLimitedFlag(product: ProductDetail): boolean {
  if (product.isStoreLimited === true) return true;
  const hint = product.purchaseHint ?? "";
  return hint.length > 0 && !hint.includes("全店");
}

export function toProductSummary(product: ProductDetail): ProductSummary {
  return {
    id: product.id,
    name: product.name,
    description: product.description,
    imageUrl: resolveProductImageUrl(product.imageUrl),
    fallbackImageUrl: getFallbackImageUrl(product.category),
    category: product.category,
    purchaseHint: product.purchaseHint,
    score: product.trendScore ?? product.score,
    isNew: product.isNew,
    isLimitedPeriod: hasLimitedPeriodFlag(product),
    isStoreLimited: hasStoreLimitedFlag(product),
    isSponsor: product.isSponsor,
    label: product.label,
  };
}
