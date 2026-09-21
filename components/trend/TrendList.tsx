import { ProductCard } from "@/components/product/ProductCard";
import type { ProductSummary } from "@/lib/types";

type TrendListProps = {
  items: ProductSummary[];
  title?: string;
};

export function TrendList({
  items,
  title = "今のトレンド TOP3",
}: TrendListProps) {
  if (items.length === 0) {
    return (
      <p className="text-theme-sub py-8 text-center text-sm">
        トレンド情報がありません
      </p>
    );
  }

  return (
    <section>
      <h2 className="font-heading mb-3 text-base font-semibold">{title}</h2>
      <ul className="flex flex-col gap-2 sm:gap-3">
        {items.map((item) => (
          <li key={item.id}>
            <ProductCard product={item} />
          </li>
        ))}
      </ul>
    </section>
  );
}
