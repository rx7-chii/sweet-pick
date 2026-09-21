"use client";

import Link from "next/link";
import { ProductBadges } from "@/components/product/ProductBadges";
import { ProductImage } from "@/components/product/ProductImage";
import type { ProductSummary } from "@/lib/types";

type ProductCardProps = {
  product: ProductSummary;
  showScore?: boolean;
  onRemove?: () => void;
};

function ProductCardBody({
  product,
  showScore,
}: {
  product: ProductSummary;
  showScore: boolean;
}) {
  return (
    <>
      <div className="product-list-image relative overflow-hidden rounded-card bg-theme-sub">
        <ProductImage
          src={product.imageUrl}
          fallbackSrc={product.fallbackImageUrl}
          category={product.category}
          alt={product.name}
          fill
          className="p-0.5"
          sizes="(max-width: 640px) 100vw, 480px"
        />
      </div>
      <div className="mt-2 min-w-0">
        <p className="font-heading line-clamp-2 text-sm font-semibold leading-snug">
          {product.name}
        </p>
        <div className="mt-1.5 flex flex-wrap items-center gap-1.5">
          <ProductBadges product={product} />
        </div>
        {product.description && (
          <p className="text-theme-sub mt-1 line-clamp-1 text-xs">
            {product.description}
          </p>
        )}
        <div className="text-theme-sub mt-1 flex flex-wrap gap-2 text-xs">
          {showScore && product.score != null && (
            <span className="text-accent">★{product.score}</span>
          )}
          {product.purchaseHint && <span>{product.purchaseHint}</span>}
        </div>
      </div>
    </>
  );
}

export function ProductCard({
  product,
  showScore = true,
  onRemove,
}: ProductCardProps) {
  if (onRemove) {
    return (
      <div className="relative rounded-card border border-theme bg-theme-sub p-2 sm:p-3">
        <Link
          href={`/products/${product.id}`}
          className="block transition-opacity hover:opacity-90"
        >
          <ProductCardBody product={product} showScore={showScore} />
        </Link>
        <button
          type="button"
          onClick={onRemove}
          aria-label="お気に入りから削除"
          className="absolute right-1 top-1 flex min-h-11 min-w-11 items-center justify-center rounded-full bg-theme/90 text-theme-sub hover:text-red-500"
        >
          ×
        </button>
      </div>
    );
  }

  return (
    <Link
      href={`/products/${product.id}`}
      className="block rounded-card border border-theme bg-theme-sub p-2 transition-opacity hover:opacity-90 sm:p-3"
    >
      <ProductCardBody product={product} showScore={showScore} />
    </Link>
  );
}
