import Link from "next/link";

export const metadata = {
  title: "プライバシーポリシー | SWEET PICK",
};

export default function PrivacyPage() {
  return (
    <main className="mx-auto max-w-lg px-4 py-8">
      <h1 className="font-heading mb-6 text-xl font-semibold">
        プライバシーポリシー
      </h1>
      <div className="text-theme-sub space-y-4 text-sm leading-relaxed">
        <p>
          SWEET PICK（以下「本サービス」）は、ユーザーの個人情報を収集しない設計です。
        </p>
        <section>
          <h2 className="text-theme mb-2 font-semibold">1. 収集する情報</h2>
          <p>
            本サービスはアカウント登録を必要としません。お気に入り・検索履歴・表示モードは、お使いの端末内（ブラウザの
            LocalStorage）にのみ保存され、当方のサーバーには送信されません。
          </p>
        </section>
        <section>
          <h2 className="text-theme mb-2 font-semibold">2. クッキー等</h2>
          <p>
            本サービスの基本機能に必須の第三者トラッキングクッキーは使用しません。ホスティング事業者（Vercel
            等）のアクセスログが記録される場合があります。
          </p>
        </section>
        <section>
          <h2 className="text-theme mb-2 font-semibold">3. お問い合わせ</h2>
          <p>本ポリシーに関するお問い合わせは、サービス運営者までご連絡ください。</p>
        </section>
        <p className="text-xs">最終更新: 2026年9月</p>
      </div>
      <Link
        href="/"
        className="text-accent mt-8 inline-block text-sm font-medium hover:underline"
      >
        ← TOP に戻る
      </Link>
    </main>
  );
}
