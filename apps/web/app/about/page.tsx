import { SiteHeader } from "@/components/header/site-header.server";
import { SiteFooterServer } from "@/components/footer/site-footer.server";
import { AboutHeroServer } from "@/components/about/about-hero.server";
import { TeamFormSectionServer } from "@/components/about/team-form-section.server";

export default function AboutPage() {
  return (
    <>
      <SiteHeader />
      <main>
        <AboutHeroServer />
        <TeamFormSectionServer />
      </main>
      <SiteFooterServer />
    </>
  );
}
