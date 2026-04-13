import type { Metadata } from "next";
import { LegalDocumentPage } from "@/components/legal/legal-document-page.server";

export const metadata: Metadata = {
  title: "Договор оферты | BasisThree",
  description: "Публичный договор оферты компании BasisThree.",
};

export default function OfertaPage() {
  return <LegalDocumentPage documentType="offerAgreement" />;
}
