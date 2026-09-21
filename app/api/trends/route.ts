import { NextRequest, NextResponse } from "next/server";
import { getTrends, isValidChannel } from "@/lib/mock-data";
import { toProductSummary } from "@/lib/search";

export async function GET(request: NextRequest) {
  const channel = request.nextUrl.searchParams.get("channel");
  const limitParam = request.nextUrl.searchParams.get("limit");
  const limit = limitParam ? Math.min(20, Math.max(1, parseInt(limitParam, 10))) : 5;

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

  const items = getTrends(channel, limit).map(toProductSummary);

  return NextResponse.json({ channel, items });
}
