import type { Metadata } from "next";
import { SiteHeader } from "@/components/header/site-header.server";
import { SiteFooterServer } from "@/components/footer/site-footer.server";
import { ServicePageServer } from "@/components/service-page/service-page.server";
import { notFound } from "next/navigation";
import { getServicePage } from "@/lib/strapi/service-page";
import { buildMetadataFromSeo } from "@/lib/strapi/seo";

type Props = {
  params: Promise<{ slug: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const data = await getServicePage(slug);
  if (!data) return {};

  const fallbackTitle = [data.heroEyebrow, data.heroHeading]
    .filter(Boolean)
    .join(" — ");

  return {
    ...buildMetadataFromSeo({
      seo: data.seo,
      fallbackTitle: fallbackTitle.length > 0 ? fallbackTitle : "Услуга | BasisThree",
      fallbackDescription: data.heroDescription,
      path: `/services/${slug}`,
    }),
  };
}

export default async function ServicePage({ params }: Props) {
  const { slug } = await params;
  const data = await getServicePage(slug);

  if (!data) notFound();

  return (
    <>
      <SiteHeader />
      <main>
        <ServicePageServer slug={slug} />
      </main>
      <SiteFooterServer />
    </>
  );
}
