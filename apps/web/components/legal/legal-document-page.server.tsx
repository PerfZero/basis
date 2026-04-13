import { SiteFooterServer } from "@/components/footer/site-footer.server";
import { SiteHeader } from "@/components/header/site-header.server";
import { CompanyDocumentText, getCompanyDocuments } from "@/lib/strapi/company-documents";
import ReactMarkdown from "react-markdown";
import rehypeRaw from "rehype-raw";
import rehypeSanitize from "rehype-sanitize";
import remarkBreaks from "remark-breaks";
import remarkGfm from "remark-gfm";
import s from "./legal-document-page.module.css";

type DocumentType = "privacyPolicy" | "offerAgreement" | "referralProgramTerms";

const DEFAULT_TITLE: Record<DocumentType, string> = {
  privacyPolicy: "Политика конфиденциальности",
  offerAgreement: "Договор оферты",
  referralProgramTerms: "Условия программы",
};

function isExternalHref(href: string): boolean {
  return /^https?:\/\//i.test(href);
}

export async function LegalDocumentPage({ documentType }: { documentType: DocumentType }) {
  const docs = await getCompanyDocuments();
  const document: CompanyDocumentText | undefined = docs?.[documentType];
  const title = document?.title || DEFAULT_TITLE[documentType];
  const content = document?.content?.trim() ?? "";

  return (
    <>
      <SiteHeader />
      <main className={s.main}>
        <article className={s.article}>
          <h1 className={s.title}>{title}</h1>
          {content ? (
            <div className={s.content}>
              <ReactMarkdown
                remarkPlugins={[remarkGfm, remarkBreaks]}
                rehypePlugins={[rehypeRaw, rehypeSanitize]}
                components={{
                  a: ({ href, children, ...props }) => {
                    const hrefValue = href ?? "";
                    if (hrefValue && isExternalHref(hrefValue)) {
                      return (
                        <a href={hrefValue} target="_blank" rel="noopener noreferrer" {...props}>
                          {children}
                        </a>
                      );
                    }

                    return (
                      <a href={hrefValue || "#"} {...props}>
                        {children}
                      </a>
                    );
                  },
                }}
              >
                {content}
              </ReactMarkdown>
            </div>
          ) : (
            <p className={s.empty}>Документ пока не заполнен в админке.</p>
          )}
        </article>
      </main>
      <SiteFooterServer />
    </>
  );
}
