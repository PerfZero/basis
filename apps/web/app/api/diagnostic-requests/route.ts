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

export async function POST(request: Request) {
  const body = await request.json().catch(() => null) as
    | { name?: string; phone?: string; consent?: boolean; data?: { name?: string; phone?: string; consent?: boolean } }
    | null;
  if (!body) {
    return NextResponse.json({ error: "Некорректное тело запроса." }, { status: 400 });
  }

  const src = body.data ?? body;
  const name = String(src.name ?? "").trim();
  const phone = String(src.phone ?? "").trim();
  const consent = Boolean(src.consent);

  if (!name || !phone) {
    return NextResponse.json({ error: "Заполните обязательные поля." }, { status: 400 });
  }

  if (!consent) {
    return NextResponse.json({ error: "Нужно согласие на обработку персональных данных." }, { status: 400 });
  }

  const phoneDigits = phone.replace(/\D/g, "");
  if (phoneDigits.length !== 11 || !phoneDigits.startsWith("7")) {
    return NextResponse.json({ error: "Введите телефон в формате +7 (999) 999-99-99." }, { status: 400 });
  }

  const response = await fetch(`${STRAPI_URL}/api/diagnostic-requests`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      ...(STRAPI_API_TOKEN ? { Authorization: `Bearer ${STRAPI_API_TOKEN}` } : {}),
    },
    body: JSON.stringify({ data: { name, phone, consent } }),
    cache: "no-store",
  });

  if (!response.ok) {
    const raw = await response.text();
    const errorMessage = extractStrapiError(raw) ?? "Не удалось отправить заявку.";
    return NextResponse.json({ error: errorMessage }, { status: 502 });
  }

  return NextResponse.json({ ok: true });
}
