import { AboutHero } from "./about-hero";
import { getAboutPage } from "@/lib/strapi/about-page";

export async function AboutHeroServer() {
  const data = await getAboutPage();
  return <AboutHero data={data} />;
}
