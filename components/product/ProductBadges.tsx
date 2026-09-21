import type { ProductSummary } from "@/lib/types";

type ProductBadgesProps = {
  product: ProductSummary;
  variant?: "card" | "detail";
};

const badgeBase = {
  card: "rounded px-1.5 py-0.5 text-xs font-medium",
  detail: "rounded-full px-3 py-1 text-xs",
};

const badgeStyles = {
  new: "bg-emerald-500 text-white",
  limitedPeriod: "bg-violet-600 text-white",
  storeLimited: "bg-sky-600 text-white",
  sponsor: "bg-amber-500 text-white",
};

export function ProductBadges({
  product,
  variant = "card",
}: ProductBadgesProps) {
  const base = badgeBase[variant];

  return (
    <>
      {product.isNew && (
        <span className={`${base} ${badgeStyles.new}`}>NEW</span>
      )}
      {product.isLimitedPeriod && (
        <span className={`${base} ${badgeStyles.limitedPeriod}`}>期間限定</span>
      )}
      {product.isStoreLimited && (
        <span className={`${base} ${badgeStyles.storeLimited}`}>店舗限定</span>
      )}
      {product.isSponsor && (
        <span className={`${base} ${badgeStyles.sponsor}`}>
          {product.label ?? "PR"}
        </span>
      )}
    </>
  );
}
