import { resolveStrapiMediaUrl } from "./media-url";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const STRAPI_TOKEN = process.env.STRAPI_API_TOKEN;

export type SiteSettings = {
  gtmContainerId: string;
  yandexMetrikaId: string;
  customHeadScript: string;
  customBodyScript: string;
  cookieBannerText: string;
  cookiePolicyUrl: string;
  cookieAcceptButtonLabel: string;
  faviconUrl: string;
};

const fallback: SiteSettings = {
  gtmContainerId: "",
  yandexMetrikaId: "",
  customHeadScript: "",
  customBodyScript: "",
  cookieBannerText:
    "Мы используем cookie, чтобы сайт работал корректно и для аналитики. Продолжая использовать сайт, вы соглашаетесь с",
  cookiePolicyUrl: "/privacy",
  cookieAcceptButtonLabel: "Понятно",
  faviconUrl: "/favicon.ico",
};

function normalizeString(value: unknown): string {
  return typeof value === "string" ? value.trim() : "";
}

function extractSingleTypeData(json: unknown): Record<string, unknown> | null {
  if (!json || typeof json !== "object") return null;

  const data = (json as { data?: unknown }).data;
  if (!data || typeof data !== "object") return null;

  const attributes = (data as { attributes?: unknown }).attributes;
  if (attributes && typeof attributes === "object") {
    return attributes as Record<string, unknown>;
  }

  return data as Record<string, unknown>;
}

export function toInlineScriptCode(value: string): string {
  const source = value.trim();
  if (!source) return "";

  const fullScriptMatch = source.match(/^<script\b[^>]*>([\s\S]*?)<\/script>$/i);
  if (fullScriptMatch) {
    return fullScriptMatch[1]?.trim() ?? "";
  }

  return source;
}

function normalizeGtmContainerId(value: string): string {
  const id = value.toUpperCase();
  return /^GTM-[A-Z0-9]+$/.test(id) ? id : "";
}

function normalizeYandexMetrikaId(value: string): string {
  const digits = value.replace(/\D/g, "");
  return digits.length > 0 ? digits : "";
}

function normalizeCookiePolicyUrl(value: string): string {
  const trimmed = value.trim();
  return trimmed || fallback.cookiePolicyUrl;
}

function extractMediaUrl(value: unknown): string | null {
  if (!value || typeof value !== "object") return null;

  const media = value as {
    url?: unknown;
    data?: unknown;
  };

  if (typeof media.url === "string" && media.url.trim()) {
    return media.url;
  }

  if (!media.data || typeof media.data !== "object") return null;

  const data = media.data as {
    url?: unknown;
    attributes?: { url?: unknown } | unknown;
  };

  if (typeof data.url === "string" && data.url.trim()) {
    return data.url;
  }

  if (!data.attributes || typeof data.attributes !== "object") return null;

  const attrs = data.attributes as { url?: unknown };
  return typeof attrs.url === "string" && attrs.url.trim() ? attrs.url : null;
}

export async function getSiteSettings(): Promise<SiteSettings> {
  const headers: Record<string, string> = STRAPI_TOKEN
    ? { Authorization: `Bearer ${STRAPI_TOKEN}` }
    : {};

  try {
    const query = new URLSearchParams();
    query.set("populate", "favicon");

    const response = await fetch(`${STRAPI_URL}/api/site-setting?${query.toString()}`, {
      headers,
      cache: "no-store",
    });

    if (!response.ok) return fallback;

    const json = await response.json();
    const data = extractSingleTypeData(json);
    if (!data) return fallback;

    return {
      gtmContainerId: normalizeGtmContainerId(normalizeString(data.gtmContainerId)),
      yandexMetrikaId: normalizeYandexMetrikaId(normalizeString(data.yandexMetrikaId)),
      customHeadScript: normalizeString(data.customHeadScript),
      customBodyScript: normalizeString(data.customBodyScript),
      cookieBannerText: normalizeString(data.cookieBannerText) || fallback.cookieBannerText,
      cookiePolicyUrl: normalizeCookiePolicyUrl(normalizeString(data.cookiePolicyUrl)),
      cookieAcceptButtonLabel:
        normalizeString(data.cookieAcceptButtonLabel) || fallback.cookieAcceptButtonLabel,
      faviconUrl: resolveStrapiMediaUrl(extractMediaUrl(data.favicon)) || fallback.faviconUrl,
    };
  } catch {
    return fallback;
  }
}
