import type { MetadataRoute } from "next";
import { getServicePageSlugs } from "@/lib/strapi/service-page";
import { getSiteUrl } from "@/lib/strapi/seo";

const STATIC_PATHS = ["/", "/about", "/privacy", "/oferta", "/referral-terms"];

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const siteUrl = getSiteUrl();
  const lastModified = new Date();
  const serviceSlugs = await getServicePageSlugs();
  const paths = [
    ...STATIC_PATHS,
    ...serviceSlugs.map((slug) => `/services/${slug}`),
  ];

  return paths.map((path) => ({
    url: `${siteUrl}${path}`,
    lastModified,
    changeFrequency: path === "/" ? "daily" : "weekly",
    priority: path === "/" ? 1 : path.startsWith("/services/") ? 0.8 : 0.7,
  }));
}
