import { getTeamSection } from "@/lib/strapi/team";
import { TeamSection } from "./team-section";

export async function TeamSectionServer() {
  const data = await getTeamSection();
  return <TeamSection {...data} />;
}
