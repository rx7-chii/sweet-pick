"use client";

import { useChannel } from "@/context/ChannelContext";
import type { Channel } from "@/lib/types";

const OPTIONS: { value: Channel; label: string }[] = [
  { value: "convenience", label: "コンビニ" },
  { value: "department", label: "デパ地下" },
];

export function ChannelToggle() {
  const { channel, setChannel } = useChannel();

  return (
    <div
      role="tablist"
      aria-label="表示モード"
      className="inline-flex rounded-full border border-theme bg-theme-sub p-1"
    >
      {OPTIONS.map((opt) => {
        const selected = channel === opt.value;
        return (
          <button
            key={opt.value}
            type="button"
            role="tab"
            aria-selected={selected}
            onClick={() => setChannel(opt.value)}
            className={`min-h-11 min-w-[88px] rounded-full px-4 text-sm font-medium transition-colors ${
              selected
                ? "bg-accent text-white"
                : "text-theme-sub hover:text-[var(--color-text)]"
            }`}
            style={selected ? { backgroundColor: "var(--color-accent)" } : {}}
          >
            {opt.label}
          </button>
        );
      })}
    </div>
  );
}
