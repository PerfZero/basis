import type { HeadingPart } from "./hero-block";
import { resolveStrapiMediaUrl } from "./media-url";

export type DiagCtaData = {
  headingParts: HeadingPart[];
  subheading: string;
  buttonLabel: string;
  buttonHref: string;
  imageUrl: string | null;
};

const FALLBACK_HEADING = "Диагностика [ВАШИХ] Бизнес-Процессов";

function parseHeading(raw: string): HeadingPart[] {
  const parts: HeadingPart[] = [];
  const regex = /\[([^\]]+)\]/g;
  let last = 0;
  let match;
  while ((match = regex.exec(raw)) !== null) {
    if (match.index > last) parts.push({ text: raw.slice(last, match.index), accent: false });
    parts.push({ text: match[1], accent: true });
    last = match.index + match[0].length;
  }
  if (last < raw.length) parts.push({ text: raw.slice(last), accent: false });
  return parts;
}

const fallback: DiagCtaData = {
  headingParts: parseHeading(FALLBACK_HEADING),
  subheading: "Расскажите о задаче — мы определим точки роста и предложим оптимальное решение. Бесплатно.",
  buttonLabel: "Начать диагностику",
  buttonHref: "#contact",
  imageUrl: null,
};

export async function getDiagCta(): Promise<DiagCtaData> {
  const baseUrl = process.env.STRAPI_URL ?? "http://localhost:1337";
  const token = process.env.STRAPI_API_TOKEN;
  const headers: Record<string, string> = token ? { Authorization: `Bearer ${token}` } : {};

  try {
    const res = await fetch(`${baseUrl}/api/diag-cta?populate=image`, { headers, next: { revalidate: 60 } });
    if (!res.ok) return fallback;

    const json = await res.json();
    const d = json?.data ?? {};

    return {
      headingParts: parseHeading(d.heading || FALLBACK_HEADING),
      subheading: d.subheading || fallback.subheading,
      buttonLabel: d.buttonLabel || fallback.buttonLabel,
      buttonHref: d.buttonHref || fallback.buttonHref,
      imageUrl: resolveStrapiMediaUrl(d.image?.url ?? null),
    };
  } catch {
    return fallback;
  }
}
