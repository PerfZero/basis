import { cookies } from "next/headers";
import { NextResponse } from "next/server";

const STRAPI_URL = process.env.STRAPI_URL ?? "http://localhost:1337";
const REFERRAL_TERMS_URL = process.env.NEXT_PUBLIC_REFERRAL_TERMS_URL ?? "#";

type ReferralStatus = "in_progress" | "contract_signed";

type ReferralEntry = {
  id: number;
  contactPerson: string;
  email: string;
  phone: string;
  company: string;
  product: string;
  status: ReferralStatus;
  payout: number;
};

type ReferralApiResponse = {
  referralLink: string;
  termsUrl: string;
  summary: {
    totalInvited: number;
    closedContracts: number;
    totalPayout: number;
  };
  entries: ReferralEntry[];
};

function buildReferralLink(siteUrl: string, userId: number): string {
  const referralCode = `IVN${userId}2024`;
  return `${siteUrl.replace(/\/$/, "")}/ref/${referralCode}`;
}

function resolveSiteUrl(request: Request): string {
  const envSiteUrl = process.env.NEXT_PUBLIC_SITE_URL;
  if (envSiteUrl) return envSiteUrl;

  return new URL(request.url).origin;
}

export async function GET(request: Request) {
  const cookieStore = await cookies();
  const token = cookieStore.get("basis_jwt")?.value;
  const rawUser = cookieStore.get("basis_user")?.value;

  if (!token || !rawUser) {
    return NextResponse.json({ message: "unauthorized" }, { status: 401 });
  }

  let userId = 0;
  try {
    userId = (JSON.parse(rawUser) as { id: number }).id;
  } catch {
    return NextResponse.json({ message: "unauthorized" }, { status: 401 });
  }

  const siteUrl = resolveSiteUrl(request);
  const url = `${STRAPI_URL}/api/referrals?filters[inviterUserId][$eq]=${userId}&sort[0]=createdAt:desc&pagination[pageSize]=200`;
  const response = await fetch(url, {
    headers: { Authorization: `Bearer ${token}` },
    cache: "no-store",
  });

  const fallback: ReferralApiResponse = {
    referralLink: buildReferralLink(siteUrl, userId),
    termsUrl: REFERRAL_TERMS_URL,
    summary: { totalInvited: 0, closedContracts: 0, totalPayout: 0 },
    entries: [],
  };

  if (!response.ok) {
    return NextResponse.json(fallback);
  }

  const json = await response.json();
  const entries: ReferralEntry[] = (json?.data ?? []).map((item: Record<string, unknown>) => ({
    id: Number(item.id),
    contactPerson: (item.contactPerson as string) ?? "",
    email: (item.email as string) ?? "",
    phone: (item.phone as string) ?? "",
    company: (item.company as string) ?? "",
    product: (item.product as string) ?? "",
    status: ((item.status as ReferralStatus) ?? "in_progress"),
    payout: Number(item.payout ?? 0),
  }));

  const closedEntries = entries.filter((entry) => entry.status === "contract_signed");
  const payload: ReferralApiResponse = {
    referralLink: buildReferralLink(siteUrl, userId),
    termsUrl: REFERRAL_TERMS_URL,
    summary: {
      totalInvited: entries.length,
      closedContracts: closedEntries.length,
      totalPayout: closedEntries.reduce((acc, entry) => acc + entry.payout, 0),
    },
    entries,
  };

  return NextResponse.json(payload);
}
