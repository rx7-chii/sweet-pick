import type { Metadata, Viewport } from "next";
import { BottomNav } from "@/components/layout/BottomNav";
import { ChannelProvider } from "@/context/ChannelContext";
import "./globals.css";

export const metadata: Metadata = {
  title: "SWEET PICK",
  description: "今のトレンドお菓子をサッと検索",
  manifest: "/manifest.json",
  appleWebApp: {
    capable: true,
    title: "SWEET PICK",
  },
};

export const viewport: Viewport = {
  width: "device-width",
  initialScale: 1,
  themeColor: "#ffffff",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ja" data-channel="convenience" suppressHydrationWarning>
      <body className="min-h-dvh antialiased">
        <ChannelProvider>
          <div className="mx-auto min-h-dvh max-w-lg bg-theme pb-16">
            {children}
            <BottomNav />
          </div>
        </ChannelProvider>
      </body>
    </html>
  );
}
