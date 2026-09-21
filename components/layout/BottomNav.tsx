"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

const NAV_ITEMS = [
  { href: "/", label: "TOP", match: (path: string) => path === "/" },
  {
    href: "/favorites",
    label: "お気に入り",
    match: (path: string) => path.startsWith("/favorites"),
  },
] as const;

export function BottomNav() {
  const pathname = usePathname();

  return (
    <nav
      aria-label="メインナビゲーション"
      className="fixed bottom-0 left-1/2 z-20 w-full max-w-lg -translate-x-1/2 border-t border-theme bg-theme/95 pb-[env(safe-area-inset-bottom)] backdrop-blur-sm"
    >
      <ul className="flex">
        {NAV_ITEMS.map((item) => {
          const active = item.match(pathname);
          return (
            <li key={item.href} className="flex-1">
              <Link
                href={item.href}
                aria-current={active ? "page" : undefined}
                className={`flex min-h-14 flex-col items-center justify-center gap-0.5 text-xs font-medium transition-colors ${
                  active ? "text-accent" : "text-theme-sub hover:text-theme"
                }`}
              >
                <span className="text-base leading-none">
                  {item.href === "/" ? "🏠" : "♡"}
                </span>
                {item.label}
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
