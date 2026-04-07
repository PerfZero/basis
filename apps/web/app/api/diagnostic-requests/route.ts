import { NextResponse } from "next/server";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const STRAPI_API_TOKEN = process.env.STRAPI_API_TOKEN;

export async function POST(request: Request) {
  const body = await request.json().catch(() => null) as { name?: string; phone?: string; consent?: boolean } | null;
  if (!body) {
    return NextResponse.json({ error: "Некорректное тело запроса." }, { status: 400 });
  }

  const name = String(body.name ?? "").trim();
  const phone = String(body.phone ?? "").trim();
  const consent = Boolean(body.consent);

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
    const details = await response.text();
    return NextResponse.json({ error: "Не удалось отправить заявку.", details }, { status: 502 });
  }

  return NextResponse.json({ ok: true });
}
