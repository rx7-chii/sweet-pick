import type { Channel, ProductDetail } from "../types";

export type ProductCatalogRow = {
  id: string;
  code: string | null;
  name: string;
  description: string | null;
  image_url: string | null;
  purchase_hint: string | null;
  is_new: boolean;
  is_limited_period: boolean;
  is_store_limited: boolean;
  channel: string;
  category: string | null;
  trend_score: number;
  tags: string[] | null;
  is_sponsor: boolean;
};

export function mapRowToProduct(row: ProductCatalogRow): ProductDetail {
  const channel = row.channel as Channel;
  return {
    id: row.code ?? row.id,
    name: row.name,
    description: row.description ?? undefined,
    imageUrl: row.image_url ?? "/images/sweets/chips.jpg",
    channel,
    category: row.category ?? undefined,
    purchaseHint: row.purchase_hint ?? undefined,
    score: row.trend_score,
    trendScore: row.trend_score,
    isNew: row.is_new,
    isLimitedPeriod: row.is_limited_period,
    isStoreLimited: row.is_store_limited,
    isSponsor: row.is_sponsor,
    label: row.is_sponsor ? "PR" : undefined,
    tags: row.tags ?? [],
  };
}
