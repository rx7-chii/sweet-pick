import { NextRequest, NextResponse } from "next/server";
import { isValidChannel } from "@/lib/channel";
import { getRecommendationsFromHistory } from "@/lib/recommendations";
import { toProductSummary } from "@/lib/search";

export async function GET(request: NextRequest) {
  const channel = request.nextUrl.searchParams.get("channel");
  const queries = request.nextUrl.searchParams
    .getAll("q")
    .map((q) => q.trim())
    .filter(Boolean);

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

  if (queries.length === 0) {
    return NextResponse.json(
      {
        error: {
          code: "VALIDATION_ERROR",
          message: "q パラメータ（検索履歴）が必要です",
        },
      },
      { status: 400 }
    );
  }

  const { items, basedOnQueries } = await getRecommendationsFromHistory(
    queries,
    channel,
    5
  );

  return NextResponse.json({
    channel,
    basedOnQueries,
    items: items.map(toProductSummary),
  });
}
