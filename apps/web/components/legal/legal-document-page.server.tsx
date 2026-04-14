import { SiteFooterServer } from "@/components/footer/site-footer.server";
import { SiteHeader } from "@/components/header/site-header.server";
import { CompanyDocumentText, getCompanyDocuments } from "@/lib/strapi/company-documents";
import { defaultSchema } from "hast-util-sanitize";
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

const sanitizeSchema = {
  ...defaultSchema,
  tagNames: Array.from(
    new Set([
      ...(defaultSchema.tagNames ?? []),
      "section",
      "article",
      "figure",
      "figcaption",
      "mark",
      "u",
      "s",
      "sup",
      "sub",
      "span",
      "div",
      "hr",
    ])
  ),
  attributes: {
    ...(defaultSchema.attributes ?? {}),
    "*": Array.from(
      new Set([
        ...(((defaultSchema.attributes ?? {})["*"] as string[] | undefined) ?? []),
        "id",
        "className",
        "style",
        "title",
        "dir",
        "lang",
      ])
    ),
    a: Array.from(
      new Set([
        ...(((defaultSchema.attributes ?? {}).a as string[] | undefined) ?? []),
        "href",
        "target",
        "rel",
        "title",
      ])
    ),
    img: Array.from(
      new Set([
        ...(((defaultSchema.attributes ?? {}).img as string[] | undefined) ?? []),
        "src",
        "alt",
        "title",
        "width",
        "height",
        "loading",
        "decoding",
      ])
    ),
    p: Array.from(new Set([(((defaultSchema.attributes ?? {}).p as string[] | undefined) ?? []), "style", "align"].flat())),
    div: Array.from(new Set([(((defaultSchema.attributes ?? {}).div as string[] | undefined) ?? []), "style", "align"].flat())),
    span: Array.from(new Set([(((defaultSchema.attributes ?? {}).span as string[] | undefined) ?? []), "style", "align"].flat())),
    h1: Array.from(new Set([(((defaultSchema.attributes ?? {}).h1 as string[] | undefined) ?? []), "style", "align"].flat())),
    h2: Array.from(new Set([(((defaultSchema.attributes ?? {}).h2 as string[] | undefined) ?? []), "style", "align"].flat())),
    h3: Array.from(new Set([(((defaultSchema.attributes ?? {}).h3 as string[] | undefined) ?? []), "style", "align"].flat())),
    h4: Array.from(new Set([(((defaultSchema.attributes ?? {}).h4 as string[] | undefined) ?? []), "style", "align"].flat())),
    h5: Array.from(new Set([(((defaultSchema.attributes ?? {}).h5 as string[] | undefined) ?? []), "style", "align"].flat())),
    h6: Array.from(new Set([(((defaultSchema.attributes ?? {}).h6 as string[] | undefined) ?? []), "style", "align"].flat())),
    table: Array.from(new Set([(((defaultSchema.attributes ?? {}).table as string[] | undefined) ?? []), "style"].flat())),
    thead: Array.from(new Set([(((defaultSchema.attributes ?? {}).thead as string[] | undefined) ?? []), "style"].flat())),
    tbody: Array.from(new Set([(((defaultSchema.attributes ?? {}).tbody as string[] | undefined) ?? []), "style"].flat())),
    tr: Array.from(new Set([(((defaultSchema.attributes ?? {}).tr as string[] | undefined) ?? []), "style"].flat())),
    td: Array.from(new Set([(((defaultSchema.attributes ?? {}).td as string[] | undefined) ?? []), "style", "colspan", "rowspan", "align"].flat())),
    th: Array.from(new Set([(((defaultSchema.attributes ?? {}).th as string[] | undefined) ?? []), "style", "colspan", "rowspan", "align"].flat())),
  },
  protocols: {
    ...(defaultSchema.protocols ?? {}),
    href: Array.from(new Set([...(((defaultSchema.protocols ?? {}).href as string[] | undefined) ?? []), "mailto", "tel"])),
    src: Array.from(new Set([...(((defaultSchema.protocols ?? {}).src as string[] | undefined) ?? []), "data"])),
  },
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
                rehypePlugins={[rehypeRaw, [rehypeSanitize, sanitizeSchema]]}
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
