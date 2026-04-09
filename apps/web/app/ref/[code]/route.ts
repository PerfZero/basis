import { NextResponse } from "next/server";

const REF_COOKIE = "basis_ref_code";

function isLocalUrl(value: string): boolean {
  return /localhost|127\.0\.0\.1/.test(value);
}

function resolvePublicOrigin(request: Request): string {
  const forwardedHost = request.headers.get("x-forwarded-host")?.split(",")[0]?.trim();
  const forwardedProto = request.headers.get("x-forwarded-proto")?.split(",")[0]?.trim() ?? "https";
  if (forwardedHost) return `${forwardedProto}://${forwardedHost}`;

  const requestOrigin = new URL(request.url).origin;
  if (!isLocalUrl(requestOrigin)) return requestOrigin;

  const envSiteUrl = process.env.NEXT_PUBLIC_SITE_URL?.trim();
  if (envSiteUrl && !isLocalUrl(envSiteUrl)) return envSiteUrl;

  return requestOrigin;
}

export async function GET(
  request: Request,
  context: { params: Promise<{ code: string }> },
) {
  const { code } = await context.params;
  const safeCode = code?.trim();

  if (!safeCode) {
    return NextResponse.redirect(new URL("/register", resolvePublicOrigin(request)));
  }

  const redirectUrl = new URL(
    `/register?ref=${encodeURIComponent(safeCode)}`,
    resolvePublicOrigin(request),
  );
  const response = NextResponse.redirect(redirectUrl);

  response.cookies.set(REF_COOKIE, safeCode, {
    httpOnly: false,
    sameSite: "lax",
    secure: process.env.NODE_ENV === "production",
    path: "/",
    maxAge: 60 * 60 * 24 * 30,
  });

  return response;
}
