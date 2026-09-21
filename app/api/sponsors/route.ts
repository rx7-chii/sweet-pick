import { NextRequest, NextResponse } from "next/server";
import { isValidChannel } from "@/lib/channel";
import { getSponsor } from "@/lib/data/products";
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

  const sponsor = await getSponsor(channel);

  return NextResponse.json({
    channel,
    sponsor: sponsor ? toProductSummary(sponsor) : null,
  });
}
