import { getHeroBlock } from "@/lib/strapi/hero-block";
import { HeroSection } from "./hero-section";

export async function HeroSectionServer() {
  const data = await getHeroBlock();
  return <HeroSection {...data} />;
}
