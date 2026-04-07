import { resolveStrapiMediaUrl } from "./media-url";

export type PhotoCard = {
  __component: "blocks.photo-card";
  id: number;
  photoUrl: string;
  alt: string;
};

export type StatCard = {
  __component: "blocks.stat-card";
  id: number;
  value: string;
  label: string;
  backgroundImageUrl: string | null;
};

export type StatsCard = PhotoCard | StatCard;

export type StatsBlockData = {
  cards: StatsCard[];
};

const fallback: StatsBlockData = {
  cards: [
    { __component: "blocks.stat-card", id: 1, value: "70%",  label: "высвобождение ресурсов\nотдела сбыта", backgroundImageUrl: null },
    { __component: "blocks.stat-card", id: 2, value: "×2",   label: "рост конверсии\nотдела продаж",        backgroundImageUrl: null },
    { __component: "blocks.stat-card", id: 3, value: "6-10", label: "месяцев\nокупаемость",                 backgroundImageUrl: null },
  ],
};

export async function getStatsBlock(): Promise<StatsBlockData> {
  const baseUrl = process.env.STRAPI_URL ?? "http://localhost:1337";
  const token = process.env.STRAPI_API_TOKEN;

  try {
    const response = await fetch(
      `${baseUrl}/api/stats-block?populate[cards][on][blocks.photo-card][populate]=*&populate[cards][on][blocks.stat-card][populate]=*`,
      {
        headers: token ? { Authorization: `Bearer ${token}` } : {},
        next: { revalidate: 60 },
      }
    );

    if (!response.ok) return fallback;

    const json = await response.json();
    const raw: unknown[] = json?.data?.cards ?? [];

    if (raw.length === 0) return fallback;

    const cards: StatsCard[] = raw.map((item: unknown) => {
      const c = item as Record<string, unknown>;

      if (c.__component === "blocks.photo-card") {
        const photo = c.photo as Record<string, unknown> | null;
        return {
          __component: "blocks.photo-card" as const,
          id: c.id as number,
          photoUrl: resolveStrapiMediaUrl(photo?.url as string) ?? "",
          alt: (c.alt as string) || "",
        };
      }

      const bg = c.backgroundImage as Record<string, unknown> | null;
      return {
        __component: "blocks.stat-card" as const,
        id: c.id as number,
        value: (c.value as string) || "",
        label: (c.label as string) || "",
        backgroundImageUrl: resolveStrapiMediaUrl(bg?.url as string),
      };
    });

    return { cards };
  } catch {
    return fallback;
  }
}
