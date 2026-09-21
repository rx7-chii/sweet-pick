import { createServiceRoleClient } from "@/lib/supabase/service-role";
import {
  getProductById as getMockProductById,
  getProductsByChannel as getMockProductsByChannel,
  getSponsor as getMockSponsor,
  getTrends as getMockTrends,
  searchProducts as searchMockProducts,
} from "@/lib/mock-data";
import type { Channel, ProductDetail } from "@/lib/types";
import { isSupabaseConfigured } from "./config";
import { mapRowToProduct, type ProductCatalogRow } from "./map-row";

async function fetchCatalog(channel: Channel): Promise<ProductDetail[]> {
  const supabase = createServiceRoleClient();
  const { data, error } = await supabase
    .from("product_catalog")
    .select("*")
    .eq("channel", channel);

  if (error) throw new Error(`Supabase catalog fetch failed: ${error.message}`);
  return ((data ?? []) as ProductCatalogRow[]).map(mapRowToProduct);
}

async function fetchProductById(id: string): Promise<ProductDetail | undefined> {
  const supabase = createServiceRoleClient();
  const { data, error } = await supabase
    .from("product_catalog")
    .select("*")
    .or(`code.eq.${id},id.eq.${id}`)
    .maybeSingle();

  if (error) throw new Error(`Supabase product fetch failed: ${error.message}`);
  if (!data) return undefined;
  return mapRowToProduct(data as ProductCatalogRow);
}

function matchesQuery(product: ProductDetail, query: string): boolean {
  const q = query.trim().toLowerCase();
  if (!q) return false;
  return (
    product.name.toLowerCase().includes(q) ||
    product.category?.toLowerCase().includes(q) === true ||
    product.tags?.some((t) => t.toLowerCase().includes(q)) === true
  );
}

export async function getProductsByChannel(
  channel: Channel
): Promise<ProductDetail[]> {
  if (!isSupabaseConfigured()) return getMockProductsByChannel(channel);
  const catalog = await fetchCatalog(channel);
  return catalog.filter((p) => !p.isSponsor);
}

export async function getProductById(
  id: string
): Promise<ProductDetail | undefined> {
  if (!isSupabaseConfigured()) return getMockProductById(id);
  return fetchProductById(id);
}

export async function searchProducts(
  query: string,
  channel: Channel
): Promise<{
  trends: ProductDetail[];
  newReleases: ProductDetail[];
  sponsor: ProductDetail | null;
}> {
  if (!isSupabaseConfigured()) return searchMockProducts(query, channel);

  const catalog = await fetchCatalog(channel);
  const matched = catalog.filter(
    (p) => !p.isSponsor && matchesQuery(p, query)
  );
  const sorted = [...matched].sort(
    (a, b) => (b.trendScore ?? 0) - (a.trendScore ?? 0)
  );
  const trends = sorted.slice(0, 3);
  const newReleases = matched.filter((p) => p.isNew).slice(0, 2);
  const sponsor = catalog.find((p) => p.isSponsor) ?? null;

  return { trends, newReleases, sponsor };
}

export async function getTrends(
  channel: Channel,
  limit = 5
): Promise<ProductDetail[]> {
  if (!isSupabaseConfigured()) return getMockTrends(channel, limit);

  const items = await getProductsByChannel(channel);
  return items
    .sort((a, b) => (b.trendScore ?? 0) - (a.trendScore ?? 0))
    .slice(0, limit);
}

export async function getSponsor(
  channel: Channel
): Promise<ProductDetail | null> {
  if (!isSupabaseConfigured()) return getMockSponsor(channel);

  const catalog = await fetchCatalog(channel);
  return catalog.find((p) => p.isSponsor) ?? null;
}
