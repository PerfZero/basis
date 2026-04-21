import type { Metadata } from "next";
import { resolveStrapiMediaUrl } from "./media-url";

const DEFAULT_SITE_URL =
  process.env.NODE_ENV === "production"
    ? "https://basisthree.ru"
    : "http://localhost:3000";

type JsonRecord = Record<string, unknown>;

function asRecord(value: unknown): JsonRecord | null {
  if (typeof value !== "object" || value === null) return null;
  return value as JsonRecord;
}

function asString(value: unknown): string | undefined {
  if (typeof value !== "string") return undefined;
  const trimmed = value.trim();
  return trimmed.length > 0 ? trimmed : undefined;
}

function asBoolean(value: unknown): boolean | undefined {
  return typeof value === "boolean" ? value : undefined;
}

function getSiteUrl(): string {
  const value = process.env.NEXT_PUBLIC_SITE_URL?.trim() || process.env.SITE_URL?.trim();
  return value && value.length > 0 ? value : DEFAULT_SITE_URL;
}

function toAbsoluteUrl(url: string): string | undefined {
  try {
    return new URL(url, getSiteUrl()).toString();
  } catch {
    return undefined;
  }
}

function splitKeywords(keywords?: string): string[] | undefined {
  if (!keywords) return undefined;

  const items = keywords
    .split(",")
    .map((item) => item.trim())
    .filter(Boolean);

  return items.length > 0 ? items : undefined;
}

export type StrapiSeo = {
  metaTitle?: string;
  metaDescription?: string;
  keywords?: string;
  canonicalUrl?: string;
  robotsNoIndex?: boolean;
  ogTitle?: string;
  ogDescription?: string;
  ogImage?: { url?: string };
};

export function mapStrapiSeo(raw: unknown): StrapiSeo | undefined {
  const record = asRecord(raw);
  if (!record) return undefined;

  const ogImageRecord = asRecord(record.ogImage);
  const ogImageUrl = asString(ogImageRecord?.url);

  return {
    metaTitle: asString(record.metaTitle),
    metaDescription: asString(record.metaDescription),
    keywords: asString(record.keywords),
    canonicalUrl: asString(record.canonicalUrl),
    robotsNoIndex: asBoolean(record.robotsNoIndex),
    ogTitle: asString(record.ogTitle),
    ogDescription: asString(record.ogDescription),
    ogImage: ogImageUrl
      ? { url: resolveStrapiMediaUrl(ogImageUrl) ?? undefined }
      : undefined,
  };
}

export function buildMetadataFromSeo({
  seo,
  fallbackTitle,
  fallbackDescription,
  path,
  ogType = "website",
}: {
  seo?: StrapiSeo;
  fallbackTitle?: string;
  fallbackDescription?: string;
  path?: string;
  ogType?: "website" | "article";
}): Metadata {
  const title = seo?.metaTitle ?? fallbackTitle;
  const description = seo?.metaDescription ?? fallbackDescription;
  const canonical = seo?.canonicalUrl
    ? toAbsoluteUrl(seo.canonicalUrl)
    : path
      ? toAbsoluteUrl(path)
      : undefined;
  const ogImage = seo?.ogImage?.url ? toAbsoluteUrl(seo.ogImage.url) : undefined;
  const keywords = splitKeywords(seo?.keywords);

  return {
    ...(title ? { title } : {}),
    ...(description ? { description } : {}),
    ...(keywords ? { keywords } : {}),
    ...(canonical ? { alternates: { canonical } } : {}),
    ...(seo?.robotsNoIndex ? { robots: { index: false, follow: false } } : {}),
    openGraph: {
      ...(seo?.ogTitle || title ? { title: seo?.ogTitle ?? title } : {}),
      ...(seo?.ogDescription || description
        ? { description: seo?.ogDescription ?? description }
        : {}),
      ...(canonical ? { url: canonical } : {}),
      ...(ogType ? { type: ogType } : {}),
      ...(ogImage ? { images: [{ url: ogImage }] } : {}),
    },
  };
}
