import { resolveStrapiMediaUrl } from "./media-url";
import { mapStrapiSeo, type StrapiSeo } from "./seo";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const STRAPI_TOKEN = process.env.STRAPI_API_TOKEN;

export type ServiceBadge = {
  id: number;
  icon?: { url?: string };
  label: string;
};

export type ServiceProblemItem = {
  id: number;
  title: string;
  description?: string;
};

export type ServiceTargetCard = {
  id: number;
  tag?: string;
  title: string;
  challenge?: string;
  feature?: string;
};

export type ServiceFeatureCard = {
  id: number;
  icon?: { url?: string };
  title: string;
  description?: string;
};

export type ServiceStatRow = {
  id: number;
  label: string;
  valueBefore?: string;
  valueAfter?: string;
};

export type ServiceRecognizeCard = {
  id: number;
  title: string;
  description?: string;
  feature?: string;
  image?: { url?: string };
};

export type ServiceAutoTab = {
  id: number;
  label: string;
  subtitle?: string;
  challenge?: string;
  feature?: string;
  image?: { url?: string };
  buttonLabel?: string;
  buttonHref?: string;
};

export type ServiceLogicSlide = {
  id: number;
  title: string;
  description?: string;
  image?: { url?: string };
  buttonLabel?: string;
  buttonHref?: string;
};

export type ServicePageData = {
  slug: string;
  heroEyebrow?: string;
  heroHeading?: string;
  heroHeadingAccent?: string;
  heroDescription?: string;
  heroPrimaryButtonLabel?: string;
  heroPrimaryButtonHref?: string;
  heroBadges: ServiceBadge[];

  problemTitle?: string;
  problemIcon?: { url?: string };
  problemItems: ServiceProblemItem[];

  targetTitle?: string;
  targetButtonLabel?: string;
  targetButtonHref?: string;
  targetCards: ServiceTargetCard[];

  featuresTitle?: string;
  featuresTitleAccent?: string;
  featureCards: ServiceFeatureCard[];

  statsTitle?: string;
  statsColBefore?: string;
  statsColAfter?: string;
  statsBottomText?: string;
  statsRows: ServiceStatRow[];

  recognizeTitle?: string;
  recognizeCards: ServiceRecognizeCard[];

  autoTitle?: string;
  autoTabs: ServiceAutoTab[];

  logicTitle?: string;
  logicSlides: ServiceLogicSlide[];

  ctaHeading?: string;
  ctaHeadingAccent?: string;
  ctaSubheading?: string;
  ctaImage?: { url?: string };
  ctaPrimaryButtonLabel?: string;
  ctaPrimaryButtonHref?: string;
  seo?: StrapiSeo;
} | null;

export async function getServicePageSlugs(): Promise<string[]> {
  const headers: Record<string, string> = STRAPI_TOKEN
    ? { Authorization: `Bearer ${STRAPI_TOKEN}` }
    : {};

  const query = new URLSearchParams();
  query.set("fields[0]", "slug");
  query.set("pagination[pageSize]", "100");
  query.set("sort[0]", "slug:asc");

  try {
    const res = await fetch(`${STRAPI_URL}/api/service-pages?${query.toString()}`, {
      headers,
      next: { revalidate: 300 },
    });
    if (!res.ok) return [];

    const json = await res.json();
    const items = json?.data;
    if (!Array.isArray(items)) return [];

    return items
      .map((item: { slug?: unknown; attributes?: { slug?: unknown } }) =>
        typeof item.slug === "string"
          ? item.slug
          : typeof item.attributes?.slug === "string"
            ? item.attributes.slug
            : "",
      )
      .map((slug) => slug.trim())
      .filter((slug) => slug.length > 0);
  } catch {
    return [];
  }
}

export async function getServicePage(slug: string): Promise<ServicePageData> {
  const headers: Record<string, string> = STRAPI_TOKEN
    ? { Authorization: `Bearer ${STRAPI_TOKEN}` }
    : {};

  const query = new URLSearchParams();
  query.set("filters[slug][$eq]", slug);
  query.set("populate[heroBadges][populate][0]", "icon");
  query.set("populate[problemIcon]", "true");
  query.set("populate[problemItems]", "true");
  query.set("populate[targetCards]", "true");
  query.set("populate[featureCards][populate][0]", "icon");
  query.set("populate[statsRows]", "true");
  query.set("populate[recognizeCards][populate][0]", "image");
  query.set("populate[autoTabs][populate][0]", "image");
  query.set("populate[logicSlides][populate][0]", "image");
  query.set("populate[ctaImage]", "true");
  query.set("populate[seo][populate][0]", "ogImage");

  try {
    const res = await fetch(
      `${STRAPI_URL}/api/service-pages?${query.toString()}`,
      { headers, next: { revalidate: 60 } },
    );
    if (!res.ok) return null;

    const json = await res.json();
    const items = json?.data;
    if (!Array.isArray(items) || items.length === 0) return null;

    const d = items[0];
    if (!d) return null;

    return {
      slug: d.slug ?? slug,
      heroEyebrow: d.heroEyebrow ?? undefined,
      heroHeading: d.heroHeading ?? undefined,
      heroHeadingAccent: d.heroHeadingAccent ?? undefined,
      heroDescription: d.heroDescription ?? undefined,
      heroPrimaryButtonLabel: d.heroPrimaryButtonLabel ?? undefined,
      heroPrimaryButtonHref: d.heroPrimaryButtonHref ?? undefined,
      heroBadges: Array.isArray(d.heroBadges)
        ? d.heroBadges.map((b: { id: number; icon?: { url?: string }; label?: string }) => ({
            id: b.id,
            icon: b.icon?.url
              ? { url: resolveStrapiMediaUrl(b.icon.url) ?? undefined }
              : undefined,
            label: b.label ?? "",
          }))
        : [],

      problemTitle: d.problemTitle ?? undefined,
      problemIcon: d.problemIcon?.url
        ? { url: resolveStrapiMediaUrl(d.problemIcon.url) ?? undefined }
        : undefined,
      problemItems: Array.isArray(d.problemItems)
        ? d.problemItems.map((p: { id: number; title?: string; description?: string }) => ({
            id: p.id,
            title: p.title ?? "",
            description: p.description ?? undefined,
          }))
        : [],

      targetTitle: d.targetTitle ?? undefined,
      targetButtonLabel: d.targetButtonLabel ?? undefined,
      targetButtonHref: d.targetButtonHref ?? undefined,
      targetCards: Array.isArray(d.targetCards)
        ? d.targetCards.map((c: { id: number; tag?: string; title?: string; challenge?: string; feature?: string }) => ({
            id: c.id,
            tag: c.tag ?? undefined,
            title: c.title ?? "",
            challenge: c.challenge ?? undefined,
            feature: c.feature ?? undefined,
          }))
        : [],

      featuresTitle: d.featuresTitle ?? undefined,
      featuresTitleAccent: d.featuresTitleAccent ?? undefined,
      featureCards: Array.isArray(d.featureCards)
        ? d.featureCards.map((f: { id: number; icon?: { url?: string }; title?: string; description?: string }) => ({
            id: f.id,
            icon: f.icon?.url
              ? { url: resolveStrapiMediaUrl(f.icon.url) ?? undefined }
              : undefined,
            title: f.title ?? "",
            description: f.description ?? undefined,
          }))
        : [],

      statsTitle: d.statsTitle ?? undefined,
      statsColBefore: d.statsColBefore ?? undefined,
      statsColAfter: d.statsColAfter ?? undefined,
      statsBottomText: d.statsBottomText ?? undefined,
      statsRows: Array.isArray(d.statsRows)
        ? d.statsRows.map((r: { id: number; label?: string; valueBefore?: string; valueAfter?: string }) => ({
            id: r.id,
            label: r.label ?? "",
            valueBefore: r.valueBefore ?? undefined,
            valueAfter: r.valueAfter ?? undefined,
          }))
        : [],

      recognizeTitle: d.recognizeTitle ?? undefined,
      recognizeCards: Array.isArray(d.recognizeCards)
        ? d.recognizeCards.map((c: { id: number; title?: string; description?: string; feature?: string; image?: { url?: string } }) => ({
            id: c.id,
            title: c.title ?? "",
            description: c.description ?? undefined,
            feature: c.feature ?? undefined,
            image: c.image?.url
              ? { url: resolveStrapiMediaUrl(c.image.url) ?? undefined }
              : undefined,
          }))
        : [],

      autoTitle: d.autoTitle ?? undefined,
      autoTabs: Array.isArray(d.autoTabs)
        ? d.autoTabs.map((t: { id: number; label?: string; subtitle?: string; challenge?: string; feature?: string; image?: { url?: string }; buttonLabel?: string; buttonHref?: string }) => ({
            id: t.id,
            label: t.label ?? "",
            subtitle: t.subtitle ?? undefined,
            challenge: t.challenge ?? undefined,
            feature: t.feature ?? undefined,
            image: t.image?.url
              ? { url: resolveStrapiMediaUrl(t.image.url) ?? undefined }
              : undefined,
            buttonLabel: t.buttonLabel ?? undefined,
            buttonHref: t.buttonHref ?? undefined,
          }))
        : [],

      logicTitle: d.logicTitle ?? undefined,
      logicSlides: Array.isArray(d.logicSlides)
        ? d.logicSlides.map((s: { id: number; title?: string; description?: string; image?: { url?: string }; buttonLabel?: string; buttonHref?: string }) => ({
            id: s.id,
            title: s.title ?? "",
            description: s.description ?? undefined,
            image: s.image?.url
              ? { url: resolveStrapiMediaUrl(s.image.url) ?? undefined }
              : undefined,
            buttonLabel: s.buttonLabel ?? undefined,
            buttonHref: s.buttonHref ?? undefined,
          }))
        : [],

      ctaHeading: d.ctaHeading ?? undefined,
      ctaHeadingAccent: d.ctaHeadingAccent ?? undefined,
      ctaSubheading: d.ctaSubheading ?? undefined,
      ctaImage: d.ctaImage?.url
        ? { url: resolveStrapiMediaUrl(d.ctaImage.url) ?? undefined }
        : undefined,
      ctaPrimaryButtonLabel: d.ctaPrimaryButtonLabel ?? undefined,
      ctaPrimaryButtonHref: d.ctaPrimaryButtonHref ?? undefined,
      seo: mapStrapiSeo(d.seo),
    };
  } catch {
    return null;
  }
}
