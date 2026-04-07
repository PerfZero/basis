import { SiteHeader } from "@/components/header/site-header.server";
import { SiteFooterServer } from "@/components/footer/site-footer.server";
import { CabinetPage } from "@/components/cabinet/cabinet-page";
import { requireAuth } from "@/lib/auth-server";

export const metadata = { title: "Личный кабинет | BasisThree" };

export default async function Cabinet() {
  const user = await requireAuth(); // редирект на /login если нет куки

  return (
    <div>
      <SiteHeader />
      <main>
        <CabinetPage user={user} />
      </main>
      <SiteFooterServer />
    </div>
  );
}
