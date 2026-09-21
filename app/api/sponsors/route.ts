import { NextRequest, NextResponse } from "next/server";
import { getSponsor, isValidChannel } from "@/lib/mock-data";
import { toProductSummary } from "@/lib/search";

export async function GET(request: NextRequest) {
  const channel = request.nextUrl.searchParams.get("channel");

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

  const sponsor = getSponsor(channel);

  return NextResponse.json({
    channel,
    sponsor: sponsor ? toProductSummary(sponsor) : null,
  });
}
