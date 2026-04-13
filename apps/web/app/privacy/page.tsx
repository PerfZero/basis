import type { Metadata } from "next";
import { LegalDocumentPage } from "@/components/legal/legal-document-page.server";

export const metadata: Metadata = {
  title: "Политика конфиденциальности | BasisThree",
  description: "Политика конфиденциальности компании BasisThree.",
};

export default function PrivacyPage() {
  return <LegalDocumentPage documentType="privacyPolicy" />;
}
