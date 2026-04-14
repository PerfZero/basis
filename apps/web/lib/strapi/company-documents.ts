import { resolveStrapiMediaUrl } from "./media-url";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const STRAPI_TOKEN = process.env.STRAPI_API_TOKEN;

export type CompanyDocumentText = {
  title: string;
  content: string;
};

export type SocialLink = {
  id: number;
  title: string;
  url: string;
  iconUrl: string | null;
};

export type CompanyDocumentsData = {
  privacyPolicy?: CompanyDocumentText;
  offerAgreement?: CompanyDocumentText;
  referralProgramTerms?: CompanyDocumentText;
  socialLinks?: SocialLink[];
} | null;

type StrapiData = Record<string, unknown>;

function normalizeString(value: unknown): string {
  return typeof value === "string" ? value.trim() : "";
}

function normalizeDocument(data: StrapiData, titleKey: string, contentKey: string): CompanyDocumentText | undefined {
  const title = normalizeString(data[titleKey]);
  const content = normalizeString(data[contentKey]);

  if (!title && !content) return undefined;

  return {
    title,
    content,
  };
}

function extractSingleTypeData(json: unknown): StrapiData | null {
  if (!json || typeof json !== "object") return null;

  const data = (json as { data?: unknown }).data;
  if (!data || typeof data !== "object") return null;

  const attributes = (data as { attributes?: unknown }).attributes;
  if (attributes && typeof attributes === "object") {
    return attributes as StrapiData;
  }

  return data as StrapiData;
}

function normalizeSocialLinks(value: unknown): SocialLink[] {
  if (!Array.isArray(value)) return [];

  return value
    .map((item, index) => {
      if (!item || typeof item !== "object") return null;
      const record = item as StrapiData;
      const url = normalizeString(record.url);
      if (!url) return null;

      const title = normalizeString(record.title);
      const iconValue = record.icon as Record<string, unknown> | undefined;
      const iconFromV4 =
        (iconValue?.data as { attributes?: { url?: string } } | undefined)?.attributes?.url;
      const iconFromV5 = iconValue?.url as string | undefined;
      const iconUrl = iconFromV4 ?? iconFromV5;
      const id = typeof record.id === "number" ? (record.id as number) : index;

      return {
        id,
        title: title || "Соцсеть",
        url,
        iconUrl: resolveStrapiMediaUrl(iconUrl ?? null),
      };
    })
    .filter((item): item is SocialLink => Boolean(item));
}

export async function getCompanyDocuments(): Promise<CompanyDocumentsData> {
  const headers: Record<string, string> = STRAPI_TOKEN
    ? { Authorization: `Bearer ${STRAPI_TOKEN}` }
    : {};

  try {
    const response = await fetch(`${STRAPI_URL}/api/company-document`, {
      headers,
      cache: "no-store",
    });

    if (!response.ok) return null;

    const json = await response.json();
    const data = extractSingleTypeData(json);
    if (!data) return null;

    return {
      privacyPolicy: normalizeDocument(data, "privacyPolicyTitle", "privacyPolicyContent"),
      offerAgreement: normalizeDocument(data, "offerAgreementTitle", "offerAgreementContent"),
      referralProgramTerms: normalizeDocument(data, "referralProgramTermsTitle", "referralProgramTermsContent"),
      socialLinks: normalizeSocialLinks(data.socialLinks),
    };
  } catch {
    return null;
  }
}

export async function getFooterSocialLinks(): Promise<SocialLink[]> {
  const headers: Record<string, string> = STRAPI_TOKEN
    ? { Authorization: `Bearer ${STRAPI_TOKEN}` }
    : {};

  try {
    const response = await fetch(`${STRAPI_URL}/api/company-document?populate[socialLinks]=*`, {
      headers,
      cache: "no-store",
    });

    if (!response.ok) return [];

    const json = await response.json();
    const data = extractSingleTypeData(json);
    if (!data) return [];

    return normalizeSocialLinks(data.socialLinks);
  } catch {
    return [];
  }
}
