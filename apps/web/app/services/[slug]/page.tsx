import { SiteHeader } from "@/components/header/site-header.server";
import { SiteFooterServer } from "@/components/footer/site-footer.server";
import { ServicePageServer } from "@/components/service-page/service-page.server";
import { notFound } from "next/navigation";
import { getServicePage } from "@/lib/strapi/service-page";

type Props = {
  params: Promise<{ slug: string }>;
};

export async function generateMetadata({ params }: Props) {
  const { slug } = await params;
  const data = await getServicePage(slug);
  if (!data) return {};
  return {
    title: [data.heroEyebrow, data.heroHeading].filter(Boolean).join(" — "),
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
