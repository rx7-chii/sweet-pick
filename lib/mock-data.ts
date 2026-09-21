import { FALLBACK_PRODUCT_IMAGES } from "./image-config";
import type { Channel, ProductDetail } from "./types";

/** mock 用のお菓子画像。本番は Supabase 等の URL（失敗時は FALLBACK に切替） */
const IMG = FALLBACK_PRODUCT_IMAGES;

export const mockProducts: ProductDetail[] = [
  {
    id: "c1",
    name: "うすしおポテトチップス",
    description: "今SNSで話題の定番薄味。さっぱりした後味が人気。",
    imageUrl: IMG.chips,
    channel: "convenience",
    category: "スナック",
    purchaseHint: "コンビニ全店",
    score: 98,
    trendScore: 98,
    isNew: false,
    tags: ["ポテチ", "スナック", "100円以下", "さっぱり"],
  },
  {
    id: "c2",
    name: "スパイシーポテトスティック",
    description: "ピリ辛がクセになる新定番。",
    imageUrl: IMG.chips,
    channel: "convenience",
    category: "スナック",
    purchaseHint: "セブン-イレブン",
    score: 92,
    trendScore: 92,
    isStoreLimited: true,
    tags: ["ポテチ", "スナック", "スパイシー"],
  },
  {
    id: "c3",
    name: "のりしおポテト",
    description: "ごはんのお供にもなるコクうま味。",
    imageUrl: IMG.chips,
    channel: "convenience",
    category: "スナック",
    purchaseHint: "ファミリーマート",
    score: 88,
    trendScore: 88,
    isStoreLimited: true,
    tags: ["ポテチ", "スナック"],
  },
  {
    id: "c4",
    name: "季節限定 さくらポテチ",
    description: "春限定のほのかな桜風味。",
    imageUrl: IMG.chips,
    channel: "convenience",
    category: "スナック",
    purchaseHint: "ローソン",
    score: 91,
    trendScore: 91,
    isNew: true,
    isLimitedPeriod: true,
    isStoreLimited: true,
    tags: ["ポテチ", "スナック", "期間限定"],
  },
  {
    id: "c5",
    name: "ミルクチョコレートバー",
    description: "なめらかな口どけの定番チョコ。",
    imageUrl: IMG.chocolate,
    channel: "convenience",
    category: "チョコレート",
    purchaseHint: "コンビニ全店",
    score: 90,
    trendScore: 90,
    tags: ["チョコ", "100円以下"],
  },
  {
    id: "c6",
    name: "塩バターサブレ",
    description: "バターの風味が広がるサクサク食感。",
    imageUrl: IMG.cookie,
    channel: "convenience",
    category: "クッキー",
    purchaseHint: "コンビニ全店",
    score: 87,
    trendScore: 87,
    isNew: true,
    tags: ["クッキー", "さっぱり"],
  },
  {
    id: "c7",
    name: "プレミアムポテチ トリュフ風味",
    description: "コンビニ限定の贅沢ポテチ。",
    imageUrl: IMG.chips,
    channel: "convenience",
    category: "スナック",
    purchaseHint: "セブン-イレブン",
    score: 80,
    trendScore: 80,
    isStoreLimited: true,
    isSponsor: true,
    label: "PR",
    tags: ["ポテチ", "スナック"],
  },
  {
    id: "d1",
    name: "銀座の苺タルト",
    description: "デパ地下で行列の人気スイーツ。",
    imageUrl: IMG.gift,
    channel: "department",
    category: "洋菓子",
    purchaseHint: "百貨店デパ地下",
    score: 96,
    trendScore: 96,
    tags: ["ギフト", "チョコ", "3000円以下"],
  },
  {
    id: "d2",
    name: "季節の和菓子詰合せ",
    description: "贈答に最適な上品な詰め合わせ。",
    imageUrl: IMG.wagashi,
    channel: "department",
    category: "和菓子",
    purchaseHint: "高島屋デパ地下",
    score: 94,
    trendScore: 94,
    isStoreLimited: true,
    tags: ["ギフト", "和菓子"],
  },
  {
    id: "d3",
    name: "ベルギー産チョコレート詰合せ",
    description: "高級感あるチョコの定番ギフト。",
    imageUrl: IMG.chocolate,
    channel: "department",
    category: "チョコレート",
    purchaseHint: "三越デパ地下",
    score: 91,
    trendScore: 91,
    isStoreLimited: true,
    tags: ["ギフト", "チョコ", "3000円以下"],
  },
  {
    id: "d4",
    name: "マカロンアソート",
    description: "インスタで話題のカラフルマカロン。",
    imageUrl: IMG.candy,
    channel: "department",
    category: "洋菓子",
    purchaseHint: "伊勢丹デパ地下",
    score: 89,
    trendScore: 89,
    isNew: true,
    isLimitedPeriod: true,
    isStoreLimited: true,
    tags: ["ギフト", "期間限定"],
  },
  {
    id: "d5",
    name: "老舗の最中セット",
    description: "伝統と話題性を兼ね備えた贈答品。",
    imageUrl: IMG.wagashi,
    channel: "department",
    category: "和菓子",
    purchaseHint: "日本橋三越",
    score: 86,
    trendScore: 86,
    isStoreLimited: true,
    tags: ["ギフト", "和菓子"],
  },
  {
    id: "d6",
    name: "限定コラボ チョコレート",
    description: "デパ地下限定のコラボ商品。",
    imageUrl: IMG.chocolate,
    channel: "department",
    category: "チョコレート",
    purchaseHint: "阪急うめだ本店",
    score: 83,
    trendScore: 83,
    isLimitedPeriod: true,
    isStoreLimited: true,
    isSponsor: true,
    label: "PR",
    tags: ["ギフト", "チョコ"],
  },
];

export function getProductsByChannel(channel: Channel): ProductDetail[] {
  return mockProducts.filter((p) => p.channel === channel && !p.isSponsor);
}

export function getProductById(id: string): ProductDetail | undefined {
  return mockProducts.find((p) => p.id === id);
}

export function searchProducts(
  query: string,
  channel: Channel
): {
  trends: ProductDetail[];
  newReleases: ProductDetail[];
  sponsor: ProductDetail | null;
} {
  const q = query.trim().toLowerCase();
  const channelProducts = mockProducts.filter((p) => p.channel === channel);

  const matched = channelProducts.filter(
    (p) =>
      !p.isSponsor &&
      (p.name.toLowerCase().includes(q) ||
        p.tags?.some((t) => t.toLowerCase().includes(q)) ||
        p.category?.toLowerCase().includes(q))
  );

  const sorted = [...matched].sort(
    (a, b) => (b.trendScore ?? 0) - (a.trendScore ?? 0)
  );

  const trends = sorted.slice(0, 3);
  const newReleases = matched
    .filter((p) => p.isNew && !p.isSponsor)
    .slice(0, 2);
  const sponsor =
    channelProducts.find((p) => p.isSponsor && p.label === "PR") ?? null;

  return { trends, newReleases, sponsor };
}

export function getTrends(channel: Channel, limit = 5): ProductDetail[] {
  return getProductsByChannel(channel)
    .sort((a, b) => (b.trendScore ?? 0) - (a.trendScore ?? 0))
    .slice(0, limit);
}

export function getSponsor(channel: Channel): ProductDetail | null {
  return (
    mockProducts.find((p) => p.channel === channel && p.isSponsor) ?? null
  );
}

export { isValidChannel } from "./channel";
