import Link from "next/link";

type BackToTopLinkProps = {
  href?: string;
  label?: string;
};

export function BackToTopLink({
  href = "/",
  label = "TOP",
}: BackToTopLinkProps) {
  return (
    <Link
      href={href}
      aria-label={`${label}に戻る`}
      className="text-theme-sub hover:text-theme flex min-h-11 shrink-0 items-center gap-1 rounded-full px-2 text-sm font-medium hover:bg-theme-sub"
    >
      <span aria-hidden>←</span>
      <span>{label}</span>
    </Link>
  );
}
