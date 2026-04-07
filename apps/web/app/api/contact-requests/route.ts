import { NextResponse } from "next/server";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const STRAPI_API_TOKEN = process.env.STRAPI_API_TOKEN;

function extractStrapiError(raw: string): string | null {
  try {
    const parsed = JSON.parse(raw) as Record<string, unknown>;
    if (typeof parsed.error === "string" && parsed.error.trim()) return parsed.error;
    if (parsed.error && typeof parsed.error === "object") {
      const nested = parsed.error as Record<string, unknown>;
      if (typeof nested.message === "string" && nested.message.trim()) return nested.message;
      if (typeof nested.name === "string" && nested.name.trim()) return nested.name;
    }
    if (typeof parsed.message === "string" && parsed.message.trim()) return parsed.message;
    return null;
  } catch {
    return null;
  }
}

type ContactRequestPayload = {
  name?: string;
  company?: string;
  direction?: string;
  pain?: string;
  turnover?: string;
  employeeCount?: string;
  phone?: string;
  consent?: boolean;
};

export async function POST(request: Request) {
  const body = (await request.json().catch(() => null)) as
    | ContactRequestPayload
    | { data?: ContactRequestPayload }
    | null;
  if (!body) {
    return NextResponse.json({ error: "Некорректное тело запроса." }, { status: 400 });
  }

  const src = (body as { data?: ContactRequestPayload }).data ?? (body as ContactRequestPayload);

  const payload = {
    name: String(src.name ?? "").trim(),
    company: String(src.company ?? "").trim(),
    direction: String(src.direction ?? "").trim(),
    pain: String(src.pain ?? "").trim(),
    turnover: String(src.turnover ?? "").trim(),
    employeeCount: String(src.employeeCount ?? "").trim(),
    phone: String(src.phone ?? "").trim(),
    consent: Boolean(src.consent),
    source: "about-form",
  };

  if (!payload.name || !payload.company || !payload.direction || !payload.pain || !payload.phone) {
    return NextResponse.json({ error: "Заполните обязательные поля." }, { status: 400 });
  }

  if (!payload.consent) {
    return NextResponse.json({ error: "Нужно согласие на обработку персональных данных." }, { status: 400 });
  }

  const response = await fetch(`${STRAPI_URL}/api/contact-requests`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      ...(STRAPI_API_TOKEN ? { Authorization: `Bearer ${STRAPI_API_TOKEN}` } : {}),
    },
    body: JSON.stringify({ data: payload }),
    cache: "no-store",
  });

  if (!response.ok) {
    const raw = await response.text();
    const errorMessage = extractStrapiError(raw) ?? "Strapi не принял заявку.";
    return NextResponse.json({ error: errorMessage }, { status: 502 });
  }

  return NextResponse.json({ ok: true });
}
