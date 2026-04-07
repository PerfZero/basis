import { getDiagCta } from "@/lib/strapi/diag-cta";
import { DiagCtaSection } from "./diag-cta-section";

export async function DiagCtaSectionServer() {
  const data = await getDiagCta();
  return <DiagCtaSection {...data} />;
}
