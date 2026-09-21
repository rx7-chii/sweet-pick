import Link from "next/link";

type PageFooterNavProps = {
  backHref?: string;
  backLabel?: string;
};

/** ページ末尾の補助ナビ（TOP へ戻る） */
export function PageFooterNav({
  backHref = "/",
  backLabel = "TOPに戻る",
}: PageFooterNavProps) {
  return (
    <div className="border-t border-theme px-4 py-6 text-center">
      <Link
        href={backHref}
        className="text-theme-sub hover:text-accent inline-flex min-h-11 items-center justify-center gap-1 text-sm font-medium"
      >
        <span aria-hidden>←</span>
        {backLabel}
      </Link>
    </div>
  );
}
