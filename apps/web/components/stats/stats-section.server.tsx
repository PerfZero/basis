import { getStatsBlock } from "@/lib/strapi/stats-block";
import { StatsSection } from "./stats-section";

export async function StatsSectionServer() {
  const data = await getStatsBlock();
  return <StatsSection {...data} />;
}
