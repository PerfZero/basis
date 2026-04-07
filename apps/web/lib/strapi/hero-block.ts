export type HeadingPart = { text: string; accent: boolean };

export type HeroBlockData = {
  eyebrow: string;
  headingParts: HeadingPart[];
  description: string;
  primaryButtonLabel: string;
  primaryButtonHref: string;
  secondaryButtonLabel: string;
  secondaryButtonHref: string;
};

const FALLBACK_HEADING = "Строим системы, которые [Увеличивают] Маржинальность";

/** "Hello [World] foo" → [{text:"Hello ", accent:false}, {text:"World", accent:true}, {text:" foo", accent:false}] */
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

const fallback: HeroBlockData = {
  eyebrow: "инженерное бюро цифровых решений",
  headingParts: parseHeading(FALLBACK_HEADING),
  description:
    "Проектируем и внедряем B2B-порталы, ERP, BI и CRM — решения, которые устраняют хаос в операционке и дают вам реальный контроль над бизнесом.",
  primaryButtonLabel: "Начать диагностику",
  primaryButtonHref: "#contact",
  secondaryButtonLabel: "Наши услуги",
  secondaryButtonHref: "#services",
};

export async function getHeroBlock(): Promise<HeroBlockData> {
  const baseUrl = process.env.STRAPI_URL ?? "http://localhost:1337";
  const token = process.env.STRAPI_API_TOKEN;

  try {
    const response = await fetch(`${baseUrl}/api/hero-block`, {
      headers: token ? { Authorization: `Bearer ${token}` } : {},
      next: { revalidate: 60 },
    });

    if (!response.ok) return fallback;

    const json = await response.json();
    const d = json?.data ?? {};

    return {
      eyebrow: d.eyebrow || fallback.eyebrow,
      headingParts: parseHeading(d.heading || FALLBACK_HEADING),
      description: d.description || fallback.description,
      primaryButtonLabel: d.primaryButtonLabel || fallback.primaryButtonLabel,
      primaryButtonHref: d.primaryButtonHref || fallback.primaryButtonHref,
      secondaryButtonLabel: d.secondaryButtonLabel || fallback.secondaryButtonLabel,
      secondaryButtonHref: d.secondaryButtonHref || fallback.secondaryButtonHref,
    };
  } catch {
    return fallback;
  }
}
