import { ProductImage } from "@/components/product/ProductImage";
import { notFound } from "next/navigation";
import { FavoriteButton } from "@/components/product/FavoriteButton";
import { ProductBadges } from "@/components/product/ProductBadges";
import { Header } from "@/components/layout/Header";
import { PageFooterNav } from "@/components/layout/PageFooterNav";
import { getFallbackImageUrl } from "@/lib/image-config";
import { getProductById } from "@/lib/data/products";

type ProductPageProps = {
  params: Promise<{ id: string }>;
};

export default async function ProductPage({ params }: ProductPageProps) {
  const { id } = await params;
  const product = await getProductById(id);

  if (!product) {
    notFound();
  }

  const channelLabel =
    product.channel === "convenience" ? "コンビニ" : "デパ地下";

  return (
    <>
      <Header
        showBack
        title="商品詳細"
        trailing={<FavoriteButton productId={product.id} />}
      />

      <main className="px-4 py-3 sm:py-4">
        <div className="product-hero-image relative mb-3 overflow-hidden rounded-card bg-theme-sub">
          <ProductImage
            src={product.imageUrl}
            fallbackSrc={getFallbackImageUrl(product.category)}
            category={product.category}
            alt={product.name}
            fill
            className="p-1"
            sizes="(max-width: 640px) 100vw, 480px"
            priority
          />
        </div>

        <h1 className="font-heading mt-2 text-base font-semibold leading-snug sm:text-lg">
          {product.name}
        </h1>

        <div className="mt-2 flex flex-wrap gap-1.5 sm:gap-2">
          <span
            className="rounded-full border border-theme px-3 py-1 text-xs"
            style={{ color: "var(--color-accent)" }}
          >
            {channelLabel}
          </span>
          {product.category && (
            <span className="text-theme-sub rounded-full border border-theme px-3 py-1 text-xs">
              {product.category}
            </span>
          )}
          <ProductBadges product={product} variant="detail" />
          {product.trendScore != null && (
            <span className="text-accent text-xs">★ トレンド {product.trendScore}</span>
          )}
        </div>

        <hr className="my-3 border-theme" />

        <p className="line-clamp-3 text-sm leading-relaxed sm:line-clamp-none">
          {product.description}
        </p>

        {product.purchaseHint && (
          <div className="mt-4 rounded-card border border-theme bg-theme-sub p-3 sm:p-4">
            <p className="text-theme-sub text-xs">📍 購入場所（目安）</p>
            <p className="mt-1 font-medium">{product.purchaseHint}</p>
          </div>
        )}
      </main>
      <PageFooterNav />
    </>
  );
}
