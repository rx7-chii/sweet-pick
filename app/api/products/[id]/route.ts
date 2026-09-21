import { NextRequest, NextResponse } from "next/server";
import { getFallbackImageUrl, resolveProductImageUrl } from "@/lib/image-config";
import { getProductById } from "@/lib/data/products";

type RouteContext = { params: Promise<{ id: string }> };

export async function GET(_request: NextRequest, context: RouteContext) {
  const { id } = await context.params;
  const product = await getProductById(id);

  if (!product) {
    return NextResponse.json(
      {
        error: {
          code: "NOT_FOUND",
          message: "商品が見つかりませんでした",
        },
      },
      { status: 404 }
    );
  }

  return NextResponse.json({
    id: product.id,
    name: product.name,
    description: product.description,
    imageUrl: resolveProductImageUrl(product.imageUrl),
    fallbackImageUrl: getFallbackImageUrl(product.category),
    channel: product.channel,
    category: product.category,
    purchaseHint: product.purchaseHint,
    isNew: product.isNew ?? false,
    isLimitedPeriod: product.isLimitedPeriod ?? false,
    isStoreLimited: product.isStoreLimited ?? false,
    trendScore: product.trendScore,
  });
}
