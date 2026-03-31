type StrapiMenuServiceV5 = {
  id: number;
  title?: string;
  slug?: string;
  link?: string;
  sortOrder?: number;
  isActive?: boolean;
};

type StrapiMenuServiceV4 = {
  id: number;
  attributes?: {
    title?: string;
    slug?: string;
    link?: string;
    sortOrder?: number;
    isActive?: boolean;
  };
};

type StrapiResponse = {
  data?: Array<StrapiMenuServiceV5 | StrapiMenuServiceV4>;
};

export type ServiceMenuItem = {
  id: number;
  title: string;
  href: string;
  sortOrder: number;
};

const fallbackItems: ServiceMenuItem[] = [
  { id: 1, title: "Компьютерная диагностика", href: "#services", sortOrder: 1 },
  { id: 2, title: "Диагностика двигателя", href: "#services", sortOrder: 2 },
  { id: 3, title: "Проверка ходовой части", href: "#services", sortOrder: 3 },
];

function normalizeItem(item: StrapiMenuServiceV5 | StrapiMenuServiceV4): ServiceMenuItem | null {
  const v4Item = item as StrapiMenuServiceV4;
  const v5Item = item as StrapiMenuServiceV5;
  const attrs = v4Item.attributes
    ? v4Item.attributes
    : {
        title: v5Item.title,
        slug: v5Item.slug,
        link: v5Item.link,
        sortOrder: v5Item.sortOrder,
        isActive: v5Item.isActive,
      };

  if (!attrs?.title) return null;

  return {
    id: item.id,
    title: attrs.title,
    href: attrs.link || (attrs.slug ? `/services/${attrs.slug}` : "#services"),
    sortOrder: attrs.sortOrder ?? 0,
  };
}

export async function getServiceMenuItems(): Promise<ServiceMenuItem[]> {
  const baseUrl = process.env.STRAPI_URL ?? "http://localhost:1337";
  const token = process.env.STRAPI_API_TOKEN;
  const query =
    "fields[0]=title&fields[1]=slug&fields[2]=link&fields[3]=sortOrder&fields[4]=isActive&filters[isActive][$eq]=true&sort[0]=sortOrder:asc&pagination[pageSize]=50";

  try {
    const response = await fetch(`${baseUrl}/api/menu-services?${query}`, {
      headers: token ? { Authorization: `Bearer ${token}` } : {},
      next: { revalidate: 60 },
    });

    if (!response.ok) return fallbackItems;

    const json = (await response.json()) as StrapiResponse;
    const items = (json.data ?? []).map(normalizeItem).filter((item): item is ServiceMenuItem => item !== null);

    if (items.length === 0) return fallbackItems;
    return items.sort((a, b) => a.sortOrder - b.sortOrder);
  } catch {
    return fallbackItems;
  }
}
