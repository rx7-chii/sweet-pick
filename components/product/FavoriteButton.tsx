"use client";

import { useState } from "react";
import { useFavorites } from "@/hooks/useFavorites";

type FavoriteButtonProps = {
  productId: string;
  size?: "sm" | "md";
  showLabel?: boolean;
};

export function FavoriteButton({
  productId,
  size = "md",
  showLabel = true,
}: FavoriteButtonProps) {
  const { isFavorite, toggleFavorite, hydrated } = useFavorites();
  const [toast, setToast] = useState(false);
  const active = hydrated && isFavorite(productId);
  const iconSize = size === "sm" ? "text-lg" : "text-xl";
  const label = active ? "お気に入り済み" : "お気に入りに追加";

  function handleClick() {
    const wasFavorite = isFavorite(productId);
    toggleFavorite(productId);
    if (!wasFavorite) {
      setToast(true);
      setTimeout(() => setToast(false), 2000);
    }
  }

  return (
    <div className="relative">
      <button
        type="button"
        onClick={handleClick}
        aria-label={active ? "お気に入り解除" : "お気に入りに追加"}
        title={label}
        className={`flex min-h-11 items-center justify-center gap-1.5 rounded-full px-2 hover:bg-theme-sub active:scale-95 ${iconSize}`}
      >
        <span aria-hidden>{active ? "♥" : "♡"}</span>
        {showLabel && (
          <span className="max-w-[5.5rem] truncate text-xs font-medium leading-tight">
            {label}
          </span>
        )}
      </button>
      {toast && (
        <span
          role="status"
          className="absolute right-0 top-full z-20 mt-1 whitespace-nowrap rounded bg-[var(--color-text)] px-2 py-1 text-xs text-[var(--color-bg)]"
        >
          お気に入りに追加しました
        </span>
      )}
    </div>
  );
}
