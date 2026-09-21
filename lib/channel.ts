import type { Channel } from "./types";

export function isValidChannel(value: string | null): value is Channel {
  return value === "convenience" || value === "department";
}
