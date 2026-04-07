export function resolveStrapiMediaUrl(url?: string | null): string | null {
  if (!url) return null;
  if (url.startsWith("http://") || url.startsWith("https://")) return url;
  const baseUrl = process.env.STRAPI_URL ?? "http://localhost:1337";
  return `${baseUrl}${url.startsWith("/") ? "" : "/"}${url}`;
}
