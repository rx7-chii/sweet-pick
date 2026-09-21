import type { NextConfig } from "next";

function supabaseStoragePatterns(): NonNullable<
  NextConfig["images"]
>["remotePatterns"] {
  const patterns: NonNullable<NextConfig["images"]>["remotePatterns"] = [
    {
      protocol: "https",
      hostname: "**.supabase.co",
      pathname: "/storage/v1/object/public/**",
    },
  ];

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  if (supabaseUrl) {
    try {
      const { hostname } = new URL(supabaseUrl);
      patterns.unshift({
        protocol: "https",
        hostname,
        pathname: "/storage/v1/object/public/**",
      });
    } catch {
      // ignore invalid env at build time
    }
  }

  return patterns;
}

const nextConfig: NextConfig = {
  output: "standalone",
  images: {
    remotePatterns: supabaseStoragePatterns(),
  },
};

export default nextConfig;
