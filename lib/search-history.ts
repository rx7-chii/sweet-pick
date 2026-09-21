export const SEARCH_HISTORY_KEY = "sweetpick_search_history";
export const MAX_SEARCH_HISTORY = 10;

export function normalizeSearchQuery(query: string): string {
  return query.trim();
}

export function parseSearchHistory(raw: string | null): string[] {
  if (!raw) return [];
  try {
    const parsed = JSON.parse(raw) as unknown;
    if (!Array.isArray(parsed)) return [];
    return parsed
      .filter((item): item is string => typeof item === "string")
      .map(normalizeSearchQuery)
      .filter(Boolean)
      .slice(0, MAX_SEARCH_HISTORY);
  } catch {
    return [];
  }
}

export function appendSearchHistory(current: string[], query: string): string[] {
  const normalized = normalizeSearchQuery(query);
  if (!normalized) return current;

  const next = [
    normalized,
    ...current.filter((item) => item !== normalized),
  ].slice(0, MAX_SEARCH_HISTORY);

  return next;
}
