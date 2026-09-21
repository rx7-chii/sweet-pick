"use client";

import { useRouter } from "next/navigation";
import { FormEvent, useState } from "react";
import { useChannel } from "@/context/ChannelContext";
import { useSearchHistory } from "@/hooks/useSearchHistory";

type SearchBarProps = {
  defaultValue?: string;
  autoFocus?: boolean;
};

export function SearchBar({ defaultValue = "", autoFocus = false }: SearchBarProps) {
  const router = useRouter();
  const { channel } = useChannel();
  const { addQuery } = useSearchHistory();
  const [query, setQuery] = useState(defaultValue);
  const [error, setError] = useState("");

  const placeholder =
    channel === "convenience"
      ? "ポテチ、チョコ、100円以下..."
      : "ギフト、チョコ、3000円以下...";

  function handleSubmit(e: FormEvent) {
    e.preventDefault();
    const trimmed = query.trim();
    if (!trimmed) {
      setError("キーワードを入力してください");
      return;
    }
    setError("");
    addQuery(trimmed);
    router.push(
      `/search?q=${encodeURIComponent(trimmed)}&channel=${channel}`
    );
  }

  return (
    <form onSubmit={handleSubmit} className="w-full">
      <div className="flex gap-2">
        <input
          type="search"
          value={query}
          onChange={(e) => {
            setQuery(e.target.value);
            if (error) setError("");
          }}
          placeholder={placeholder}
          autoFocus={autoFocus}
          aria-label="お菓子を検索"
          className="min-h-11 flex-1 rounded-card border border-theme bg-theme-sub px-4 text-sm outline-none focus:ring-2 focus:ring-[var(--color-accent)]"
        />
        <button
          type="submit"
          className="min-h-11 shrink-0 rounded-card px-4 text-sm font-medium text-white"
          style={{ backgroundColor: "var(--color-accent)" }}
        >
          検索
        </button>
      </div>
      {error && (
        <p className="mt-2 text-sm text-red-500" role="alert">
          {error}
        </p>
      )}
    </form>
  );
}
