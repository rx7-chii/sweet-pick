"use client";

import { useEffect, useMemo, useState } from "react";
import { useChannel } from "@/context/ChannelContext";
import { SearchHistoryChips } from "@/components/home/SearchHistoryChips";
import { SearchBar } from "@/components/search/SearchBar";
import { TrendList } from "@/components/trend/TrendList";
import { useSearchHistory } from "@/hooks/useSearchHistory";
import type { ProductSummary } from "@/lib/types";

function buildRecommendationsUrl(channel: string, queries: string[]) {
  const params = new URLSearchParams({ channel });
  for (const query of queries) {
    params.append("q", query);
  }
  return `/api/recommendations?${params.toString()}`;
}

export function HomeContent() {
  const { channel } = useChannel();
  const { history, hydrated, hasHistory } = useSearchHistory();
  const [items, setItems] = useState<ProductSummary[]>([]);
  const [basedOnQueries, setBasedOnQueries] = useState<string[]>([]);
  const [loading, setLoading] = useState(true);

  const listTitle = useMemo(() => {
    if (!hasHistory) return "今のトレンド TOP3";
    if (basedOnQueries.length === 0) return "あなたへのおすすめ";
    return `あなたへのおすすめ（${basedOnQueries.slice(0, 3).join("・")}）`;
  }, [hasHistory, basedOnQueries]);

  useEffect(() => {
    if (!hydrated) return;

    let cancelled = false;
    setLoading(true);

    const url = hasHistory
      ? buildRecommendationsUrl(channel, history)
      : `/api/trends?channel=${channel}&limit=3`;

    async function loadHomeItems() {
      try {
        const res = await fetch(url);
        const data = await res.json();
        if (cancelled) return;

        let nextItems = data.items ?? [];
        let nextBasedOn = data.basedOnQueries ?? [];

        if (hasHistory && nextItems.length === 0) {
          const trendsRes = await fetch(
            `/api/trends?channel=${channel}&limit=3`
          );
          const trendsData = await trendsRes.json();
          if (cancelled) return;
          nextItems = trendsData.items ?? [];
          nextBasedOn = [];
        }

        setItems(nextItems.slice(0, 3));
        setBasedOnQueries(nextBasedOn);
      } catch {
        if (cancelled) return;
        setItems([]);
        setBasedOnQueries([]);
      } finally {
        if (!cancelled) setLoading(false);
      }
    }

    loadHomeItems();

    return () => {
      cancelled = true;
    };
  }, [channel, history, hydrated, hasHistory]);

  return (
    <main className="space-y-4 px-4 py-3 sm:space-y-6 sm:py-4">
      <SearchBar />
      {hydrated && hasHistory && <SearchHistoryChips queries={history} />}
      {loading ? (
        <div className="space-y-3">
          {[1, 2, 3].map((i) => (
            <div
              key={i}
              className="h-16 animate-pulse rounded-card bg-theme-sub sm:h-20"
            />
          ))}
        </div>
      ) : (
        <TrendList items={items} title={listTitle} />
      )}
      {hasHistory && (
        <p className="text-theme-sub text-center text-xs">
          過去の検索キーワードをもとにおすすめを表示しています
        </p>
      )}
    </main>
  );
}
