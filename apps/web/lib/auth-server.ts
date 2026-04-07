import { cookies } from "next/headers";
import { redirect } from "next/navigation";

export type AuthUser = {
  id: number;
  username: string;
  email: string;
  firstName?: string;
  lastName?: string;
  middleName?: string;
  phone?: string;
  company?: string;
};

export async function getServerUser(): Promise<AuthUser | null> {
  const cookieStore = await cookies();
  const token = cookieStore.get("basis_jwt")?.value;
  if (!token) return null;

  const raw = cookieStore.get("basis_user")?.value;
  if (!raw) return null;

  try {
    return JSON.parse(raw) as AuthUser;
  } catch {
    return null;
  }
}

export async function requireAuth(): Promise<AuthUser> {
  const user = await getServerUser();
  if (!user) redirect("/login");
  return user;
}
