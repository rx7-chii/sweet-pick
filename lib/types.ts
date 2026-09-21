export type Channel = "convenience" | "department";

export type ProductSummary = {
  id: string;
  name: string;
  description?: string;
  imageUrl: string;
  fallbackImageUrl?: string;
  category?: string;
  purchaseHint?: string;
  score?: number;
  isNew?: boolean;
  isLimitedPeriod?: boolean;
  isStoreLimited?: boolean;
  isSponsor?: boolean;
  label?: string;
};

export type ProductDetail = ProductSummary & {
  channel: Channel;
  category?: string;
  trendScore?: number;
  tags?: string[];
};

export type SearchResponse = {
  query: string;
  channel: Channel;
  trends: ProductSummary[];
  newReleases: ProductSummary[];
  sponsor: ProductSummary | null;
  message?: string;
};

export type TrendsResponse = {
  channel: Channel;
  items: ProductSummary[];
};
