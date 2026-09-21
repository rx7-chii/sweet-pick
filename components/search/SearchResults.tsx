"use client";

import { useEffect, useState } from "react";
import { PageFooterNav } from "@/components/layout/PageFooterNav";
import { ProductCard } from "@/components/product/ProductCard";
import { SponsorCard } from "@/components/product/SponsorCard";
import { useChannel } from "@/context/ChannelContext";
import { useSearchHistory } from "@/hooks/useSearchHistory";
import type { SearchResponse } from "@/lib/types";

type SearchResultsProps = {
  query: string;
};

export function SearchResults({ query }: SearchResultsProps) {
  const { channel } = useChannel();
  const { addQuery } = useSearchHistory();
  const [data, setData] = useState<SearchResponse | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    addQuery(query);
  }, [query, addQuery]);

  useEffect(() => {
    let cancelled = false;
    setLoading(true);
    setError("");

    fetch(
      `/api/search?q=${encodeURIComponent(query)}&channel=${channel}`
    )
      .then(async (res) => {
        const json = await res.json();
        if (!res.ok) {
          throw new Error(json.error?.message ?? "検索に失敗しました");
        }
        return json as SearchResponse;
      })
      .then((json) => {
        if (!cancelled) setData(json);
      })
      .catch((err: Error) => {
        if (!cancelled) setError(err.message || "接続を確認してください");
      })
      .finally(() => {
        if (!cancelled) setLoading(false);
      });

    return () => {
      cancelled = true;
    };
  }, [query, channel]);

  if (loading) {
    return (
      <div className="space-y-3 px-4 py-4">
        {[1, 2, 3].map((i) => (
          <div
            key={i}
            className="h-20 animate-pulse rounded-card bg-theme-sub"
          />
        ))}
      </div>
    );
  }

  if (error) {
    return (
      <div className="px-4 py-8 text-center">
        <p className="text-red-500">{error}</p>
        <button
          type="button"
          onClick={() => window.location.reload()}
          className="mt-4 min-h-11 rounded-card px-4 text-sm text-white"
          style={{ backgroundColor: "var(--color-accent)" }}
        >
          再試行
        </button>
      </div>
    );
  }

  if (!data || data.trends.length === 0) {
    return (
      <div className="px-4 py-12 text-center">
        <p className="font-heading text-base font-medium">
          {data?.message ?? "該当するお菓子が見つかりませんでした"}
        </p>
        <p className="text-theme-sub mt-2 text-sm">
          別のキーワードで試してみてください
        </p>
      </div>
    );
  }

  return (
    <div className="space-y-6 px-4 py-4">
      <h2 className="font-heading text-base font-semibold">
        「{data.query}」の検索結果
      </h2>

      <section>
        <h3 className="font-heading mb-3 text-sm font-semibold">
          📈 トレンド TOP3
        </h3>
        <ul className="flex flex-col gap-3">
          {data.trends.map((item) => (
            <li key={item.id}>
              <ProductCard product={item} />
            </li>
          ))}
        </ul>
      </section>

      {data.newReleases.length > 0 && (
        <section>
          <h3 className="font-heading mb-3 text-sm font-semibold">🆕 新作</h3>
          <ul className="flex flex-col gap-3">
            {data.newReleases.map((item) => (
              <li key={item.id}>
                <ProductCard product={item} />
              </li>
            ))}
          </ul>
        </section>
      )}

      {data.sponsor && <SponsorCard product={data.sponsor} />}
      <PageFooterNav />
    </div>
  );
}
