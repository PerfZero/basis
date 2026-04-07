import { getServicesSection } from "@/lib/strapi/services";
import { ServicesSection } from "./services-section";

export async function ServicesSectionServer() {
  const data = await getServicesSection();
  return <ServicesSection {...data} />;
}
