"use client";

import { useCallback, useEffect, useState } from "react";

const STORAGE_KEY = "sweetpick_favorites";
const MAX_FAVORITES = 100;

function readFavorites(): string[] {
  if (typeof window === "undefined") return [];
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw) as unknown;
    return Array.isArray(parsed) ? (parsed as string[]) : [];
  } catch {
    return [];
  }
}

function writeFavorites(ids: string[]) {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(ids));
}

export function useFavorites() {
  const [favorites, setFavorites] = useState<string[]>([]);
  const [hydrated, setHydrated] = useState(false);

  useEffect(() => {
    setFavorites(readFavorites());
    setHydrated(true);
  }, []);

  const isFavorite = useCallback(
    (productId: string) => favorites.includes(productId),
    [favorites]
  );

  const toggleFavorite = useCallback((productId: string) => {
    setFavorites((prev) => {
      let next: string[];
      if (prev.includes(productId)) {
        next = prev.filter((id) => id !== productId);
      } else {
        next = [productId, ...prev];
        if (next.length > MAX_FAVORITES) {
          next = next.slice(0, MAX_FAVORITES);
        }
      }
      writeFavorites(next);
      return next;
    });
    return true;
  }, []);

  const removeFavorite = useCallback((productId: string) => {
    setFavorites((prev) => {
      const next = prev.filter((id) => id !== productId);
      writeFavorites(next);
      return next;
    });
  }, []);

  return {
    favorites,
    hydrated,
    isFavorite,
    toggleFavorite,
    removeFavorite,
  };
}
