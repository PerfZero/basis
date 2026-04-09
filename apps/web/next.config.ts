import type { NextConfig } from "next";
import path from "path";

const strapiHostname = (process.env.STRAPI_URL ?? "http://localhost:1337")
  .replace(/^https?:\/\//, "")
  .split(":")[0];

const isLocalStrapi = strapiHostname === "localhost" || strapiHostname === "127.0.0.1";
const strapiInternalUrl = process.env.STRAPI_URL ?? "http://localhost:1337";
const isProduction = process.env.NODE_ENV === "production";

const nextConfig: NextConfig = {
  outputFileTracingRoot: path.join(process.cwd(), "../../"),
  images: {
    // Keep optimizer enabled in production even when Strapi is local (127.0.0.1 in host deploy).
    unoptimized: !isProduction && isLocalStrapi,
    remotePatterns: [
      {
        protocol: "http",
        hostname: strapiHostname,
      },
      {
        protocol: "https",
        hostname: strapiHostname,
      },
    ],
  },
  async rewrites() {
    return [
      {
        source: "/uploads/:path*",
        destination: `${strapiInternalUrl}/uploads/:path*`,
      },
    ];
  },
};

export default nextConfig;
