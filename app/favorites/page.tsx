"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { Header } from "@/components/layout/Header";
import { PageFooterNav } from "@/components/layout/PageFooterNav";
import { ProductCard } from "@/components/product/ProductCard";
import { useFavorites } from "@/hooks/useFavorites";
import type { ProductSummary } from "@/lib/types";

export default function FavoritesPage() {
  const { favorites, hydrated, removeFavorite } = useFavorites();
  const [products, setProducts] = useState<ProductSummary[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!hydrated) return;

    if (favorites.length === 0) {
      setProducts([]);
      setLoading(false);
      return;
    }

    let cancelled = false;
    setLoading(true);

    Promise.all(
      favorites.map((id) =>
        fetch(`/api/products/${id}`)
          .then((res) => (res.ok ? res.json() : null))
          .catch(() => null)
      )
    ).then((results) => {
      if (cancelled) return;
      const valid = results.filter(Boolean) as ProductSummary[];
      setProducts(valid);
      setLoading(false);
    });

    return () => {
      cancelled = true;
    };
  }, [favorites, hydrated]);

  return (
    <>
      <Header showBack title="お気に入り" />
      <main className="px-4 py-4">
        {!hydrated || loading ? (
          <div className="space-y-3">
            {[1, 2].map((i) => (
              <div
                key={i}
                className="h-20 animate-pulse rounded-card bg-theme-sub"
              />
            ))}
          </div>
        ) : products.length === 0 ? (
          <div className="py-16 text-center">
            <p className="font-heading text-base font-medium">
              お気に入りはまだありません
            </p>
            <Link
              href="/"
              className="mt-4 inline-block min-h-11 rounded-card px-6 py-3 text-sm text-white"
              style={{ backgroundColor: "var(--color-accent)" }}
            >
              お菓子を探しに行く →
            </Link>
          </div>
        ) : (
          <>
            <ul className="flex flex-col gap-3">
              {products.map((product) => (
                <li key={product.id}>
                  <ProductCard
                    product={product}
                    onRemove={() => removeFavorite(product.id)}
                  />
                </li>
              ))}
            </ul>
            <PageFooterNav />
          </>
        )}
      </main>
    </>
  );
}
