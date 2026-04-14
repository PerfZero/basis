import { resolveStrapiMediaUrl } from "./media-url";
import { mapStrapiSeo, type StrapiSeo } from "./seo";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const STRAPI_TOKEN = process.env.STRAPI_API_TOKEN;

type Principle = {
  id: number;
  badge?: string;
  title?: string;
  paragraph1?: string;
  paragraph2?: string;
};

export type AboutPageData = {
  eyebrow?: string;
  heading?: string;
  description?: string;
  badge1Text?: string;
  badge2Text?: string;
  badge1Icon?: { url?: string };
  badge2Icon?: { url?: string };
  sectionTitle?: string;
  backgroundImage?: { url?: string };
  principles?: Principle[];
  contactWorkTitle?: string;
  contactWorkLabel?: string;
  contactWorkValue?: string;
  contactWorkIcon?: { url?: string };
  contactDocsTitle?: string;
  contactDocsPhoneLabel?: string;
  contactDocsPhoneValue?: string;
  contactDocsEmailLabel?: string;
  contactDocsEmailValue?: string;
  contactDocsIcon?: { url?: string };
  contactCoffeeTitle?: string;
  contactCoffeeText?: string;
  contactCoffeeButtonLabel?: string;
  contactCoffeeImage?: { url?: string };
  seo?: StrapiSeo;
} | null;

export async function getAboutPage(): Promise<AboutPageData> {
  const headers: Record<string, string> = STRAPI_TOKEN
    ? { Authorization: `Bearer ${STRAPI_TOKEN}` }
    : {};

  try {
    const query = new URLSearchParams();
    query.set("populate", "*");

    const res = await fetch(
      `${STRAPI_URL}/api/about-page?${query.toString()}`,
      {
        headers,
        cache: "no-store",
      },
    );
    if (!res.ok) return null;

    const json = await res.json();
    const d = json?.data;
    if (!d) return null;

    return {
      eyebrow: d.eyebrow ?? undefined,
      heading: d.heading ?? undefined,
      description: d.description ?? undefined,
      badge1Text: d.badge1Text ?? undefined,
      badge2Text: d.badge2Text ?? undefined,
      badge1Icon: d.badge1Icon?.url
        ? { url: resolveStrapiMediaUrl(d.badge1Icon.url) ?? undefined }
        : undefined,
      badge2Icon: d.badge2Icon?.url
        ? { url: resolveStrapiMediaUrl(d.badge2Icon.url) ?? undefined }
        : undefined,
      sectionTitle: d.sectionTitle ?? undefined,
      backgroundImage: d.backgroundImage?.url
        ? { url: resolveStrapiMediaUrl(d.backgroundImage.url) ?? undefined }
        : undefined,
      principles: Array.isArray(d.principles)
        ? d.principles.map((p: Principle, i: number) => ({
            id: p.id ?? i + 1,
            badge: p.badge ?? "",
            title: p.title ?? "",
            paragraph1: p.paragraph1 ?? "",
            paragraph2: p.paragraph2 ?? "",
          }))
        : [],
      contactWorkTitle: d.contactWorkTitle ?? undefined,
      contactWorkLabel: d.contactWorkLabel ?? undefined,
      contactWorkValue: d.contactWorkValue ?? undefined,
      contactWorkIcon: d.contactWorkIcon?.url
        ? { url: resolveStrapiMediaUrl(d.contactWorkIcon.url) ?? undefined }
        : undefined,
      contactDocsTitle: d.contactDocsTitle ?? undefined,
      contactDocsPhoneLabel: d.contactDocsPhoneLabel ?? undefined,
      contactDocsPhoneValue: d.contactDocsPhoneValue ?? undefined,
      contactDocsEmailLabel: d.contactDocsEmailLabel ?? undefined,
      contactDocsEmailValue: d.contactDocsEmailValue ?? undefined,
      contactDocsIcon: d.contactDocsIcon?.url
        ? { url: resolveStrapiMediaUrl(d.contactDocsIcon.url) ?? undefined }
        : undefined,
      contactCoffeeTitle: d.contactCoffeeTitle ?? undefined,
      contactCoffeeText: d.contactCoffeeText ?? undefined,
      contactCoffeeButtonLabel: d.contactCoffeeButtonLabel ?? undefined,
      contactCoffeeImage: d.contactCoffeeImage?.url
        ? { url: resolveStrapiMediaUrl(d.contactCoffeeImage.url) ?? undefined }
        : undefined,
      seo: mapStrapiSeo(d.seo),
    };
  } catch {
    return null;
  }
}
