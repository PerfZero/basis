import type { Metadata } from "next";
import { resolveStrapiMediaUrl } from "./media-url";

const DEFAULT_SITE_URL = "https://basisthree.ru";
const DEFAULT_OG_IMAGE = "/Rectangle 23.png";

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

function isLocalUrl(value: string): boolean {
  return /(^|\.)localhost(?::|\/|$)|127\.0\.0\.1|0\.0\.0\.0/.test(value);
}

export function getSiteUrl(): string {
  const value = process.env.NEXT_PUBLIC_SITE_URL?.trim() || process.env.SITE_URL?.trim();
  if (!value || isLocalUrl(value)) return DEFAULT_SITE_URL;
  return value.replace(/\/$/, "");
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
  const ogImage = seo?.ogImage?.url
    ? toAbsoluteUrl(seo.ogImage.url)
    : toAbsoluteUrl(DEFAULT_OG_IMAGE);
  const socialTitle = seo?.ogTitle ?? title;
  const socialDescription = seo?.ogDescription ?? description;
  const hasSocialImage = Boolean(ogImage);
  const keywords = splitKeywords(seo?.keywords);

  return {
    ...(title ? { title } : {}),
    ...(description ? { description } : {}),
    ...(keywords ? { keywords } : {}),
    ...(canonical ? { alternates: { canonical } } : {}),
    ...(seo?.robotsNoIndex ? { robots: { index: false, follow: false } } : {}),
    openGraph: {
      siteName: "BasisThree",
      locale: "ru_RU",
      ...(socialTitle ? { title: socialTitle } : {}),
      ...(socialDescription ? { description: socialDescription } : {}),
      ...(canonical ? { url: canonical } : {}),
      ...(ogType ? { type: ogType } : {}),
      ...(ogImage
        ? {
            images: [
              {
                url: ogImage,
                width: seo?.ogImage?.url ? 1200 : 1200,
                height: seo?.ogImage?.url ? 630 : 500,
                alt: socialTitle ?? "BasisThree",
              },
            ],
          }
        : {}),
    },
    twitter: {
      card: hasSocialImage ? "summary_large_image" : "summary",
      ...(socialTitle ? { title: socialTitle } : {}),
      ...(socialDescription ? { description: socialDescription } : {}),
      ...(ogImage ? { images: [ogImage] } : {}),
    },
  };
}
