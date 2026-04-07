import { NextResponse } from "next/server";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const STRAPI_API_TOKEN = process.env.STRAPI_API_TOKEN;

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
  const body = (await request.json().catch(() => null)) as ContactRequestPayload | null;
  if (!body) {
    return NextResponse.json({ error: "Некорректное тело запроса." }, { status: 400 });
  }

  const payload = {
    name: String(body.name ?? "").trim(),
    company: String(body.company ?? "").trim(),
    direction: String(body.direction ?? "").trim(),
    pain: String(body.pain ?? "").trim(),
    turnover: String(body.turnover ?? "").trim(),
    employeeCount: String(body.employeeCount ?? "").trim(),
    phone: String(body.phone ?? "").trim(),
    consent: Boolean(body.consent),
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
    const details = await response.text();
    return NextResponse.json(
      { error: "Strapi не принял заявку.", details },
      { status: 502 },
    );
  }

  return NextResponse.json({ ok: true });
}

