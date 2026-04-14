import { getFooterSocialLinks } from "@/lib/strapi/company-documents";
import { SiteFooter } from "./site-footer";

type MenuItem = { id: number; title: string; link: string };

async function getMenuServices(): Promise<MenuItem[]> {
  const baseUrl = process.env.STRAPI_URL ?? "http://localhost:1337";
  const token = process.env.STRAPI_API_TOKEN;
  const headers: Record<string, string> = token ? { Authorization: `Bearer ${token}` } : {};

  try {
    const res = await fetch(
      `${baseUrl}/api/menu-services?sort=sortOrder:asc&pagination[pageSize]=20&filters[isActive][$eq]=true`,
      { headers, next: { revalidate: 60 } }
    );
    if (!res.ok) return [];
    const json = await res.json();
    return (json?.data ?? []).map((item: Record<string, unknown>) => ({
      id: item.id as number,
      title: (item.title as string) || "",
      link: (item.link as string) || "#",
    }));
  } catch {
    return [];
  }
}

export async function SiteFooterServer() {
  const services = await getMenuServices();
  const socialLinks = await getFooterSocialLinks();

  return <SiteFooter services={services} socialLinks={socialLinks} />;
}
