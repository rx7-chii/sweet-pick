"use client";

import Image, { type ImageProps } from "next/image";
import { useEffect, useState } from "react";
import {
  DEFAULT_FALLBACK_IMAGE,
  getFallbackImageUrl,
  shouldUseDirectImageFetch,
} from "@/lib/image-config";

type ProductImageProps = Omit<ImageProps, "unoptimized" | "onError"> & {
  src: string;
  /** 省略時は category から自動判定 */
  fallbackSrc?: string;
  category?: string | null;
};

export function ProductImage({
  src,
  fallbackSrc,
  category,
  alt,
  className,
  ...props
}: ProductImageProps) {
  const fallback = fallbackSrc ?? getFallbackImageUrl(category);
  const [displaySrc, setDisplaySrc] = useState(src);

  useEffect(() => {
    setDisplaySrc(src);
  }, [src]);

  return (
    <Image
      src={displaySrc}
      alt={alt}
      unoptimized={shouldUseDirectImageFetch(displaySrc)}
      className={`object-contain ${className ?? ""}`}
      onError={() => {
        setDisplaySrc((current) =>
          current === fallback ? current : fallback
        );
      }}
      {...props}
    />
  );
}

export { DEFAULT_FALLBACK_IMAGE };
