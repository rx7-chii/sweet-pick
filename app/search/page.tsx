import { Header } from "@/components/layout/Header";
import { SearchResults } from "@/components/search/SearchResults";
import { redirect } from "next/navigation";

type SearchPageProps = {
  searchParams: Promise<{ q?: string }>;
};

export default async function SearchPage({ searchParams }: SearchPageProps) {
  const params = await searchParams;
  const q = params.q?.trim();

  if (!q) {
    redirect("/");
  }

  return (
    <>
      <Header showBack title={`「${q}」`} />
      <SearchResults query={q} />
    </>
  );
}
