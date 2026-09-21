import { searchProducts } from "./mock-data";
import type { Channel, ProductDetail } from "./types";

export type RecommendationsResult = {
  items: ProductDetail[];
  basedOnQueries: string[];
};

/** 過去の検索キーワードからおすすめ商品を集約（サーバー非依存・mock 用） */
export function getRecommendationsFromHistory(
  queries: string[],
  channel: Channel,
  limit = 5
): RecommendationsResult {
  const seen = new Set<string>();
  const merged: ProductDetail[] = [];
  const basedOnQueries: string[] = [];

  for (const query of queries) {
    const trimmed = query.trim();
    if (!trimmed) continue;

    const { trends } = searchProducts(trimmed, channel);
    if (trends.length === 0) continue;

    basedOnQueries.push(trimmed);

    for (const product of trends) {
      if (seen.has(product.id)) continue;
      seen.add(product.id);
      merged.push(product);
    }
  }

  merged.sort((a, b) => (b.trendScore ?? 0) - (a.trendScore ?? 0));

  return {
    items: merged.slice(0, limit),
    basedOnQueries,
  };
}
