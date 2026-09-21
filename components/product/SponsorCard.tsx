import { ProductCard } from "./ProductCard";
import type { ProductSummary } from "@/lib/types";

type SponsorCardProps = {
  product: ProductSummary;
};

export function SponsorCard({ product }: SponsorCardProps) {
  return (
    <div>
      <h2 className="font-heading mb-3 text-sm font-semibold">📢 スポンサー</h2>
      <div className="rounded-card border-2 border-amber-400/60 bg-theme-sub p-1">
        <ProductCard product={{ ...product, isSponsor: true, label: "PR" }} />
      </div>
    </div>
  );
}
