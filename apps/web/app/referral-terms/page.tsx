import type { Metadata } from "next";
import { LegalDocumentPage } from "@/components/legal/legal-document-page.server";

export const metadata: Metadata = {
  title: "Условия программы | BasisThree",
  description: "Условия реферальной программы BasisThree.",
};

export default function ReferralTermsPage() {
  return <LegalDocumentPage documentType="referralProgramTerms" />;
}
