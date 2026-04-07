import { NextResponse } from "next/server";

const REF_COOKIE = "basis_ref_code";

export async function GET(
  request: Request,
  context: { params: Promise<{ code: string }> },
) {
  const { code } = await context.params;
  const safeCode = code?.trim();

  if (!safeCode) {
    return NextResponse.redirect(new URL("/register", request.url));
  }

  const redirectUrl = new URL(`/register?ref=${encodeURIComponent(safeCode)}`, request.url);
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
