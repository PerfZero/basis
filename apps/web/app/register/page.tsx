import { RegisterForm } from "@/components/auth/register-form";

export const metadata = { title: "Регистрация | BasisThree" };

type RegisterPageProps = {
  searchParams?: Promise<{ ref?: string | string[] }>;
};

export default async function RegisterPage({ searchParams }: RegisterPageProps) {
  const resolved = searchParams ? await searchParams : {};
  const rawRef = resolved.ref;
  const refCode = Array.isArray(rawRef) ? rawRef[0] : rawRef;

  return <RegisterForm refCode={refCode?.trim() || ""} />;
}
