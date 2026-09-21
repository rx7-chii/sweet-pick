"use client";

import Link from "next/link";
import { useChannel } from "@/context/ChannelContext";

type SearchHistoryChipsProps = {
  queries: string[];
};

export function SearchHistoryChips({ queries }: SearchHistoryChipsProps) {
  const { channel } = useChannel();

  if (queries.length === 0) return null;

  return (
    <div>
      <p className="text-theme-sub mb-2 text-xs">最近の検索</p>
      <div className="flex flex-wrap gap-2">
        {queries.slice(0, 5).map((query) => (
          <Link
            key={query}
            href={`/search?q=${encodeURIComponent(query)}&channel=${channel}`}
            className="rounded-full border border-theme bg-theme-sub px-3 py-1.5 text-xs hover:opacity-80"
          >
            {query}
          </Link>
        ))}
      </div>
    </div>
  );
}
