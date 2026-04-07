"use server";

import { cookies } from "next/headers";
import { redirect } from "next/navigation";
import { resolveStrapiMediaUrl } from "@/lib/strapi/media-url";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const REF_COOKIE = "basis_ref_code";

const COOKIE_OPTS = {
  httpOnly: true,
  secure: process.env.NODE_ENV === "production",
  sameSite: "lax" as const,
  path: "/",
  maxAge: 60 * 60 * 24 * 30, // 30 дней
};

export type ActionResult = { error: string } | null;

function parseInviterId(refCode?: string): number | null {
  if (!refCode) return null;
  const match = refCode.trim().toUpperCase().match(/^IVN(\d+)2024$/);
  if (!match) return null;
  const inviterId = Number(match[1]);
  return Number.isFinite(inviterId) && inviterId > 0 ? inviterId : null;
}

export async function registerAction(data: {
  name: string;
  email: string;
  phone: string;
  company: string;
  password: string;
  referralCode?: string;
}): Promise<ActionResult> {
  const cookieStore = await cookies();
  const cookieReferralCode = cookieStore.get(REF_COOKIE)?.value;
  const referralCode = (data.referralCode || cookieReferralCode || "").trim();

  const res = await fetch(`${STRAPI_URL}/api/auth/local/register`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      username: data.name,
      email: data.email,
      password: data.password,
    }),
  });

  const json = await res.json();

  if (!res.ok) {
    return { error: json?.error?.message ?? "Ошибка регистрации" };
  }

  // Сохраняем phone и company в Strapi
  if (data.phone || data.company) {
    await fetch(`${STRAPI_URL}/api/users/${json.user.id}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json", Authorization: `Bearer ${json.jwt}` },
      body: JSON.stringify({ phone: data.phone, company: data.company }),
    });
  }

  cookieStore.set("basis_jwt", json.jwt, COOKIE_OPTS);
  if (referralCode) {
    cookieStore.set(REF_COOKIE, referralCode, { ...COOKIE_OPTS, httpOnly: false });
  }

  const inviterId = parseInviterId(referralCode);
  const registeredUserId = Number(json?.user?.id);

  if (inviterId && inviterId !== registeredUserId) {
    try {
      const referralRes = await fetch(`${STRAPI_URL}/api/referrals`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${json.jwt}`,
        },
        body: JSON.stringify({
          data: {
            contactPerson: data.name || json.user.username || "Новый клиент",
            email: data.email || json.user.email || "",
            phone: data.phone || "",
            company: data.company || "Без компании",
            product: "Не указан",
            status: "in_progress",
            payout: 0,
            inviterUserId: inviterId,
          },
        }),
      });

      if (!referralRes.ok) {
        console.error("[referral] create failed", referralRes.status, await referralRes.text());
      } else {
        cookieStore.delete(REF_COOKIE);
      }
    } catch (error) {
      console.error("[referral] create error", error);
    }
  }

  cookieStore.set("basis_user", JSON.stringify({
    id: json.user.id,
    username: json.user.username,
    email: json.user.email,
    firstName: data.name.split(" ")[0] ?? data.name,
    lastName: data.name.split(" ")[1] ?? "",
    middleName: data.name.split(" ")[2] ?? "",
    phone: data.phone,
    company: data.company,
  }), { ...COOKIE_OPTS, httpOnly: false });

  redirect("/cabinet");
}

export async function loginAction(data: {
  email: string;
  password: string;
}): Promise<ActionResult> {
  const res = await fetch(`${STRAPI_URL}/api/auth/local`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ identifier: data.email, password: data.password }),
  });

  const json = await res.json();

  if (!res.ok) {
    return { error: json?.error?.message ?? "Неверный email или пароль" };
  }

  const cookieStore = await cookies();
  cookieStore.set("basis_jwt", json.jwt, COOKIE_OPTS);

  // Загружаем полные данные пользователя из Strapi
  const meRes = await fetch(`${STRAPI_URL}/api/users/me`, {
    headers: { Authorization: `Bearer ${json.jwt}` },
  });
  const meJson = meRes.ok ? await meRes.json() : json.user;

  cookieStore.set("basis_user", JSON.stringify({
    id: meJson.id,
    username: meJson.username,
    email: meJson.email,
    firstName: meJson.firstName ?? "",
    lastName: meJson.lastName ?? "",
    middleName: meJson.middleName ?? "",
    phone: meJson.phone ?? "",
    company: meJson.company ?? "",
  }), { ...COOKIE_OPTS, httpOnly: false });

  redirect("/cabinet");
}

export async function updateUserAction(data: Partial<{
  firstName: string;
  lastName: string;
  middleName: string;
  email: string;
  phone: string;
  company: string;
}>): Promise<ActionResult> {
  const cookieStore = await cookies();
  const token = cookieStore.get("basis_jwt")?.value;
  const raw = cookieStore.get("basis_user")?.value;
  if (!token || !raw) return { error: "Не авторизован" };

  const user = JSON.parse(raw);

  const res = await fetch(`${STRAPI_URL}/api/users/${user.id}`, {
    method: "PUT",
    headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
    body: JSON.stringify({
      ...(data.phone !== undefined && { phone: data.phone }),
      ...(data.company !== undefined && { company: data.company }),
      ...(data.email !== undefined && { email: data.email }),
      ...(data.firstName !== undefined && { firstName: data.firstName }),
      ...(data.lastName !== undefined && { lastName: data.lastName }),
      ...(data.middleName !== undefined && { middleName: data.middleName }),
    }),
  });

  if (!res.ok) {
    const json = await res.json();
    return { error: json?.error?.message ?? "Ошибка сохранения" };
  }

  const updated = { ...user, ...data };
  cookieStore.set("basis_user", JSON.stringify(updated), { ...COOKIE_OPTS, httpOnly: false });
  return null;
}

export type Document = {
  id: number;
  project: string;
  name: string;
  docStatus: "pending_signature" | "signed" | "under_review";
  fileUrl: string | null;
};

export async function getDocumentsAction(): Promise<Document[]> {
  const cookieStore = await cookies();
  const token = cookieStore.get("basis_jwt")?.value;
  const raw = cookieStore.get("basis_user")?.value;
  if (!token || !raw) return [];

  const user = JSON.parse(raw);
  const url = `${STRAPI_URL}/api/documents?filters[user][id][$eq]=${user.id}&populate=file&sort=id:desc`;
  const res = await fetch(url, { headers: { Authorization: `Bearer ${token}` }, cache: "no-store" });
  if (!res.ok) {
    console.error("[docs] fetch failed", res.status, await res.text());
    return [];
  }

  const json = await res.json();
  console.log("[docs] raw response", JSON.stringify(json));
  return (json?.data ?? []).map((d: Record<string, unknown>) => ({
    id: d.id as number,
    project: (d.project as string) ?? "",
    name: (d.name as string) ?? "",
    docStatus: (d.docStatus as Document["docStatus"]) ?? "under_review",
    fileUrl: resolveStrapiMediaUrl((d.file as Record<string, unknown>)?.url as string | null),
  }));
}

export async function logoutAction() {
  const cookieStore = await cookies();
  cookieStore.delete("basis_jwt");
  cookieStore.delete("basis_user");
  redirect("/");
}
