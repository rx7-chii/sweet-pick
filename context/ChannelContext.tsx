"use client";

import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useState,
  type ReactNode,
} from "react";
import type { Channel } from "@/lib/types";

const STORAGE_KEY = "sweetpick_channel";

type ChannelContextValue = {
  channel: Channel;
  setChannel: (channel: Channel) => void;
};

const ChannelContext = createContext<ChannelContextValue | null>(null);

function applyChannelToDocument(channel: Channel) {
  if (typeof document !== "undefined") {
    document.documentElement.dataset.channel = channel;
  }
}

export function ChannelProvider({ children }: { children: ReactNode }) {
  const [channel, setChannelState] = useState<Channel>("convenience");
  const [hydrated, setHydrated] = useState(false);

  useEffect(() => {
    const stored = localStorage.getItem(STORAGE_KEY);
    const initial: Channel =
      stored === "department" ? "department" : "convenience";
    setChannelState(initial);
    applyChannelToDocument(initial);
    setHydrated(true);
  }, []);

  const setChannel = useCallback((next: Channel) => {
    setChannelState(next);
    applyChannelToDocument(next);
    try {
      localStorage.setItem(STORAGE_KEY, next);
    } catch {
      // private browsing
    }
  }, []);

  if (!hydrated) {
    applyChannelToDocument("convenience");
  }

  return (
    <ChannelContext.Provider value={{ channel, setChannel }}>
      {children}
    </ChannelContext.Provider>
  );
}

export function useChannel() {
  const ctx = useContext(ChannelContext);
  if (!ctx) {
    throw new Error("useChannel must be used within ChannelProvider");
  }
  return ctx;
}
