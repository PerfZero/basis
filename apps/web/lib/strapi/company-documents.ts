const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const STRAPI_TOKEN = process.env.STRAPI_API_TOKEN;

export type CompanyDocumentText = {
  title: string;
  content: string;
};

export type CompanyDocumentsData = {
  privacyPolicy?: CompanyDocumentText;
  offerAgreement?: CompanyDocumentText;
  referralProgramTerms?: CompanyDocumentText;
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

export async function getCompanyDocuments(): Promise<CompanyDocumentsData> {
  const headers: Record<string, string> = STRAPI_TOKEN
    ? { Authorization: `Bearer ${STRAPI_TOKEN}` }
    : {};

  try {
    const response = await fetch(`${STRAPI_URL}/api/company-document`, {
      headers,
      next: { revalidate: 60 },
    });

    if (!response.ok) return null;

    const json = await response.json();
    const data = extractSingleTypeData(json);
    if (!data) return null;

    return {
      privacyPolicy: normalizeDocument(data, "privacyPolicyTitle", "privacyPolicyContent"),
      offerAgreement: normalizeDocument(data, "offerAgreementTitle", "offerAgreementContent"),
      referralProgramTerms: normalizeDocument(data, "referralProgramTermsTitle", "referralProgramTermsContent"),
    };
  } catch {
    return null;
  }
}
