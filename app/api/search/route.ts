import { NextRequest, NextResponse } from "next/server";
import { isValidChannel } from "@/lib/channel";
import { searchProducts } from "@/lib/data/products";
import { toProductSummary } from "@/lib/search";

export async function GET(request: NextRequest) {
  const q = request.nextUrl.searchParams.get("q");
  const channel = request.nextUrl.searchParams.get("channel");

  if (!q?.trim()) {
    return NextResponse.json(
      {
        error: {
          code: "VALIDATION_ERROR",
          message: "q パラメータは必須です",
        },
      },
      { status: 400 }
    );
  }

  if (!channel || !isValidChannel(channel)) {
    return NextResponse.json(
      {
        error: {
          code: "VALIDATION_ERROR",
          message: "channel は convenience または department を指定してください",
        },
      },
      { status: 400 }
    );
  }

  const { trends, newReleases, sponsor } = await searchProducts(q, channel);

  if (trends.length === 0) {
    return NextResponse.json({
      query: q,
      channel,
      trends: [],
      newReleases: [],
      sponsor: sponsor ? toProductSummary(sponsor) : null,
      message: "該当するお菓子が見つかりませんでした",
    });
  }

  return NextResponse.json({
    query: q,
    channel,
    trends: trends.map(toProductSummary),
    newReleases: newReleases.map(toProductSummary),
    sponsor: sponsor ? toProductSummary(sponsor) : null,
  });
}
