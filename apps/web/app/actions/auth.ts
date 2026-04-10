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

function splitFullName(fullName: string): { firstName: string; lastName: string; middleName: string } {
  const [firstName = "", lastName = "", middleName = ""] = fullName
    .trim()
    .split(/\s+/)
    .filter(Boolean);
  return { firstName, lastName, middleName };
}

export async function registerAction(data: {
  name: string;
  email: string;
  phone: string;
  company: string;
  password: string;
  referralCode?: string;
}): Promise<ActionResult> {
  const name = data.name.trim();
  const email = data.email.trim();
  const password = data.password;
  const phone = data.phone.trim();
  const company = data.company.trim();
  const phoneDigits = phone.replace(/\D/g, "");
  const { firstName, lastName, middleName } = splitFullName(name);

  if (!name || !email || !password || !phone) {
    return { error: "Заполните обязательные поля." };
  }

  if (phoneDigits.length !== 11 || !phoneDigits.startsWith("7")) {
    return { error: "Введите телефон в формате +7 (999) 999-99-99." };
  }

  const cookieStore = await cookies();
  const cookieReferralCode = cookieStore.get(REF_COOKIE)?.value;
  const referralCode = (data.referralCode || cookieReferralCode || "").trim();

  const res = await fetch(`${STRAPI_URL}/api/auth/local/register`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      username: name,
      email,
      password,
    }),
  });

  const json = await res.json();

  if (!res.ok) {
    return { error: json?.error?.message ?? "Ошибка регистрации" };
  }

  // Сохраняем профильные поля в Strapi сразу после регистрации
  await fetch(`${STRAPI_URL}/api/users/${json.user.id}`, {
    method: "PUT",
    headers: { "Content-Type": "application/json", Authorization: `Bearer ${json.jwt}` },
    body: JSON.stringify({
      phone,
      company,
      firstName,
      lastName,
      middleName,
    }),
  });

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
            email: email || json.user.email || "",
            phone: phone || "",
            company: company || "Без компании",
            product: "Не указан",
            referralStatus: "in_progress",
            payout: 0,
            user: registeredUserId,
            inviterUserId: inviterId,
            inviterUser: inviterId,
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
    firstName,
    lastName,
    middleName,
    phone,
    company,
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

export async function changePasswordAction(data: {
  currentPassword: string;
  newPassword: string;
  confirmPassword: string;
}): Promise<ActionResult> {
  const currentPassword = data.currentPassword.trim();
  const newPassword = data.newPassword.trim();
  const confirmPassword = data.confirmPassword.trim();

  if (!currentPassword || !newPassword || !confirmPassword) {
    return { error: "Заполните все поля для смены пароля." };
  }

  if (newPassword.length < 6) {
    return { error: "Новый пароль должен содержать минимум 6 символов." };
  }

  if (newPassword !== confirmPassword) {
    return { error: "Подтверждение пароля не совпадает." };
  }

  const cookieStore = await cookies();
  const token = cookieStore.get("basis_jwt")?.value;
  if (!token) return { error: "Не авторизован" };

  const res = await fetch(`${STRAPI_URL}/api/auth/change-password`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${token}`,
    },
    body: JSON.stringify({
      currentPassword,
      password: newPassword,
      passwordConfirmation: confirmPassword,
    }),
  });

  if (!res.ok) {
    const json = await res.json().catch(() => null);
    return { error: json?.error?.message ?? "Не удалось изменить пароль." };
  }

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
