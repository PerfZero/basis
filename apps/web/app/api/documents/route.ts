import { cookies } from "next/headers";
import { NextResponse } from "next/server";
import { resolveStrapiMediaUrl } from "@/lib/strapi/media-url";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";

export async function GET() {
  const cookieStore = await cookies();
  const token = cookieStore.get("basis_jwt")?.value;
  const raw = cookieStore.get("basis_user")?.value;

  if (!token || !raw) {
    return NextResponse.json([], { status: 401 });
  }

  const user = JSON.parse(raw);
  const url = `${STRAPI_URL}/api/documents`;
  const res = await fetch(url, {
    headers: { Authorization: `Bearer ${token}` },
    cache: "no-store",
  });

  if (!res.ok) {
    const errBody = await res.text();
    console.error("[docs] strapi error", res.status, errBody);
    return NextResponse.json({ strapiError: errBody, userId: user.id, url }, { status: res.status });
  }

  const json = await res.json();
  console.log("[docs] raw", JSON.stringify(json));

  const docs = (json?.data ?? []).map((d: Record<string, unknown>) => ({
    id: d.id,
    project: (d.project as string) ?? "",
    name: (d.name as string) ?? "",
    docStatus: (d.docStatus as string) ?? "under_review",
    fileUrl: resolveStrapiMediaUrl((d.file as Record<string, unknown>)?.url as string | null),
  }));

  return NextResponse.json(docs);
}
