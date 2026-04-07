import { resolveStrapiMediaUrl } from "./media-url";

export type ServiceCard = {
  id: number;
  title: string;
  description: string;
  link: string;
  linkLabel: string;
  iconUrl: string | null;
  isFeatured: boolean;
  sortOrder: number;
};

export type ServicesSectionData = {
  heading: string;
  subheading: string;
  cards: ServiceCard[];
};

const fallback: ServicesSectionData = {
  heading: "Цифровой фундамент для вашего бизнеса",
  subheading: "Комплексные решения для автоматизации, аналитики и роста",
  cards: [],
};

type StrapiMediaV5 = { url?: string | null } | null;
type StrapiMediaV4 = { data?: { attributes?: { url?: string | null } | null } | null } | null;

type StrapiServiceCardV5 = {
  id: number;
  title?: string;
  description?: string;
  link?: string;
  linkLabel?: string;
  icon?: StrapiMediaV5;
  isFeatured?: boolean;
  sortOrder?: number;
};

type StrapiServiceCardV4 = {
  id: number;
  attributes?: {
    title?: string;
    description?: string;
    link?: string;
    linkLabel?: string;
    icon?: StrapiMediaV4;
    isFeatured?: boolean;
    sortOrder?: number;
  };
};

type StrapiSectionV5 = {
  heading?: string;
  subheading?: string;
};

type StrapiSectionV4 = {
  attributes?: {
    heading?: string;
    subheading?: string;
  };
};

type StrapiCollectionResponse = {
  data?: Array<StrapiServiceCardV5 | StrapiServiceCardV4>;
};

type StrapiSingleResponse = {
  data?: StrapiSectionV5 | StrapiSectionV4;
};

function normalizeSection(section: StrapiSectionV5 | StrapiSectionV4 | undefined): Pick<ServicesSectionData, "heading" | "subheading"> {
  const v4 = section as StrapiSectionV4;
  const v5 = section as StrapiSectionV5;
  const attrs = v4?.attributes
    ? v4.attributes
    : {
        heading: v5?.heading,
        subheading: v5?.subheading,
      };

  return {
    heading: attrs.heading || fallback.heading,
    subheading: attrs.subheading || fallback.subheading,
  };
}

function normalizeCard(card: StrapiServiceCardV5 | StrapiServiceCardV4): ServiceCard | null {
  const v4 = card as StrapiServiceCardV4;
  const v5 = card as StrapiServiceCardV5;
  const attrs = v4?.attributes
    ? v4.attributes
    : {
        title: v5.title,
        description: v5.description,
        link: v5.link,
        linkLabel: v5.linkLabel,
        icon: v5.icon,
        isFeatured: v5.isFeatured,
        sortOrder: v5.sortOrder,
      };

  if (!attrs.title) return null;

  const v4Icon = attrs.icon as StrapiMediaV4;
  const v5Icon = attrs.icon as StrapiMediaV5;
  const iconUrl = v4Icon?.data?.attributes?.url ?? v5Icon?.url ?? null;

  return {
    id: card.id,
    title: attrs.title,
    description: attrs.description || "",
    link: attrs.link || "#",
    linkLabel: attrs.linkLabel || "Подробнее",
    iconUrl: resolveStrapiMediaUrl(iconUrl),
    isFeatured: Boolean(attrs.isFeatured),
    sortOrder: attrs.sortOrder || 0,
  };
}

export async function getServicesSection(): Promise<ServicesSectionData> {
  const baseUrl = process.env.STRAPI_URL ?? "http://localhost:1337";
  const token = process.env.STRAPI_API_TOKEN;
  const headers: Record<string, string> = token ? { Authorization: `Bearer ${token}` } : {};
  const cardsQuery = new URLSearchParams();
  cardsQuery.set("populate[0]", "icon");
  cardsQuery.set("sort[0]", "sortOrder:asc");
  cardsQuery.set("pagination[pageSize]", "20");

  try {
    const [sectionRes, cardsRes] = await Promise.all([
      fetch(`${baseUrl}/api/services-section`, { headers, next: { revalidate: 60 } }),
      fetch(`${baseUrl}/api/service-cards?${cardsQuery.toString()}`, { headers, next: { revalidate: 60 } }),
    ]);

    const sectionJson = sectionRes.ok ? ((await sectionRes.json()) as StrapiSingleResponse) : {};
    const cardsJson = cardsRes.ok ? ((await cardsRes.json()) as StrapiCollectionResponse) : {};

    const section = normalizeSection(sectionJson.data);
    const cards = (cardsJson.data ?? [])
      .map((card) => normalizeCard(card))
      .filter((card): card is ServiceCard => card !== null);

    return {
      heading: section.heading,
      subheading: section.subheading,
      cards,
    };
  } catch {
    return fallback;
  }
}
