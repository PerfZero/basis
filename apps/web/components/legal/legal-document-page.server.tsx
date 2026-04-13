import { SiteFooterServer } from "@/components/footer/site-footer.server";
import { SiteHeader } from "@/components/header/site-header.server";
import { CompanyDocumentText, getCompanyDocuments } from "@/lib/strapi/company-documents";
import s from "./legal-document-page.module.css";

type DocumentType = "privacyPolicy" | "offerAgreement" | "referralProgramTerms";

const DEFAULT_TITLE: Record<DocumentType, string> = {
  privacyPolicy: "Политика конфиденциальности",
  offerAgreement: "Договор оферты",
  referralProgramTerms: "Условия программы",
};

function toHtmlContent(content: string): string {
  return content.trim();
}

export async function LegalDocumentPage({ documentType }: { documentType: DocumentType }) {
  const docs = await getCompanyDocuments();
  const document: CompanyDocumentText | undefined = docs?.[documentType];
  const title = document?.title || DEFAULT_TITLE[documentType];
  const contentHtml = toHtmlContent(document?.content ?? "");

  return (
    <>
      <SiteHeader />
      <main className={s.main}>
        <article className={s.article}>
          <h1 className={s.title}>{title}</h1>
          {contentHtml ? (
            <div className={s.content} dangerouslySetInnerHTML={{ __html: contentHtml }} />
          ) : (
            <p className={s.empty}>Документ пока не заполнен в админке.</p>
          )}
        </article>
      </main>
      <SiteFooterServer />
    </>
  );
}
