"use client";

import { useCallback, useEffect, useState } from "react";
import {
  appendSearchHistory,
  parseSearchHistory,
  SEARCH_HISTORY_KEY,
} from "@/lib/search-history";

function readSearchHistory(): string[] {
  if (typeof window === "undefined") return [];
  return parseSearchHistory(localStorage.getItem(SEARCH_HISTORY_KEY));
}

function writeSearchHistory(queries: string[]) {
  localStorage.setItem(SEARCH_HISTORY_KEY, JSON.stringify(queries));
}

export function useSearchHistory() {
  const [history, setHistory] = useState<string[]>([]);
  const [hydrated, setHydrated] = useState(false);

  useEffect(() => {
    setHistory(readSearchHistory());
    setHydrated(true);
  }, []);

  const addQuery = useCallback((query: string) => {
    setHistory((prev) => {
      const next = appendSearchHistory(prev, query);
      writeSearchHistory(next);
      return next;
    });
  }, []);

  const clearHistory = useCallback(() => {
    writeSearchHistory([]);
    setHistory([]);
  }, []);

  return {
    history,
    hydrated,
    addQuery,
    clearHistory,
    hasHistory: history.length > 0,
  };
}
