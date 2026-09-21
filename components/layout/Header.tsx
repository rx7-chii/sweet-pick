"use client";

import Link from "next/link";
import type { ReactNode } from "react";
import { ChannelToggle } from "@/components/channel/ChannelToggle";
import { BackToTopLink } from "@/components/layout/BackToTopLink";

type HeaderProps = {
  showBack?: boolean;
  backHref?: string;
  backLabel?: string;
  title?: string;
  /** 指定時はヘッダー右端の ♡ を差し替え（商品詳細など） */
  trailing?: ReactNode;
};

export function Header({
  showBack = false,
  backHref = "/",
  backLabel = "TOP",
  title,
  trailing,
}: HeaderProps) {
  return (
    <header className="sticky top-0 z-10 border-b border-theme bg-theme/95 backdrop-blur-sm">
      <div className="mx-auto flex max-w-lg items-center justify-between gap-3 px-4 py-3">
        <div className="flex min-w-0 flex-1 items-center gap-2">
          {showBack ? (
            <BackToTopLink href={backHref} label={backLabel} />
          ) : (
            <Link href="/" className="font-heading shrink-0 text-lg font-semibold">
              SWEET PICK
            </Link>
          )}
          {title && (
            <h1 className="font-heading truncate text-base font-semibold">
              {title}
            </h1>
          )}
        </div>
        <div className="flex shrink-0 items-center gap-2">
          <ChannelToggle />
          {trailing ?? (
            <Link
              href="/favorites"
              aria-label="お気に入り一覧"
              title="お気に入り一覧を見る"
              className="text-theme-sub hover:text-theme flex min-h-11 flex-col items-center justify-center gap-0.5 rounded-full px-2 hover:bg-theme-sub"
            >
              <span className="text-xl leading-none" aria-hidden>
                ♡
              </span>
              <span className="text-[10px] font-medium leading-none">
                お気に入り
              </span>
            </Link>
          )}
        </div>
      </div>
    </header>
  );
}
