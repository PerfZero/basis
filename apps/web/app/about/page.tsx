import type { Metadata } from "next";
import { SiteHeader } from "@/components/header/site-header.server";
import { SiteFooterServer } from "@/components/footer/site-footer.server";
import { AboutHeroServer } from "@/components/about/about-hero.server";
import { TeamFormSectionServer } from "@/components/about/team-form-section.server";
import { getAboutPage } from "@/lib/strapi/about-page";
import { buildMetadataFromSeo } from "@/lib/strapi/seo";

export async function generateMetadata(): Promise<Metadata> {
  const aboutPage = await getAboutPage();

  return buildMetadataFromSeo({
    seo: aboutPage?.seo,
    fallbackTitle: "О компании | BasisThree",
    fallbackDescription: aboutPage?.description,
    path: "/about",
  });
}

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
