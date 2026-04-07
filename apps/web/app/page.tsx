import { SiteHeader } from "@/components/header/site-header.server";
import { HeroSectionServer } from "@/components/hero/hero-section.server";
import { StatsSectionServer } from "@/components/stats/stats-section.server";
import { TeamSectionServer } from "@/components/team/team-section.server";
import { ServicesSectionServer } from "@/components/services/services-section.server";
import { DiagCtaSectionServer } from "@/components/diag-cta/diag-cta-section.server";
import { SiteFooterServer } from "@/components/footer/site-footer.server";

export default async function Home() {
  return (
    <div>
      <SiteHeader />
      <main>
        <HeroSectionServer />
        <StatsSectionServer />
        <TeamSectionServer />
        <ServicesSectionServer />
        <DiagCtaSectionServer />
      </main>
      <SiteFooterServer />
    </div>
  );
}
