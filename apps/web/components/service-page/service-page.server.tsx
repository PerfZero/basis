import { getServicePage } from "@/lib/strapi/service-page";
import { ServiceHero } from "./service-hero";
import { ServiceProblem } from "./service-problem";
import { ServiceTarget } from "./service-target";
import { ServiceAuto } from "./service-auto";
import { ServiceRecognize } from "./service-recognize";
import { ServiceLogic } from "./service-logic";
import { ServiceFeatures } from "./service-features";
import { ServiceStats } from "./service-stats";
import { ServiceCta } from "./service-cta";

export async function ServicePageServer({ slug }: { slug: string }) {
  const data = await getServicePage(slug);

  if (!data) return null;

  return (
    <>
      <ServiceHero
        heroEyebrow={data.heroEyebrow}
        heroHeading={data.heroHeading}
        heroHeadingAccent={data.heroHeadingAccent}
        heroDescription={data.heroDescription}
        heroPrimaryButtonLabel={data.heroPrimaryButtonLabel}
        heroPrimaryButtonHref={data.heroPrimaryButtonHref}
        heroSecondaryButtonLabel={data.heroSecondaryButtonLabel}
        heroBadges={data.heroBadges}
      />
      <ServiceProblem
        problemTitle={data.problemTitle}
        problemTitleAccent={data.problemTitleAccent}
        problemIcon={data.problemIcon}
        problemItems={data.problemItems}
      />
      <ServiceTarget
        targetTitle={data.targetTitle}
        targetButtonLabel={data.targetButtonLabel}
        targetButtonHref={data.targetButtonHref}
        targetCards={data.targetCards}
      />
      <ServiceAuto
        autoTitle={data.autoTitle}
        autoTabs={data.autoTabs}
      />
      <ServiceRecognize
        recognizeTitle={data.recognizeTitle}
        recognizeCards={data.recognizeCards}
      />
      <ServiceLogic
        logicTitle={data.logicTitle}
        logicSlides={data.logicSlides}
      />
      <ServiceFeatures
        featuresTitle={data.featuresTitle}
        featuresTitleAccent={data.featuresTitleAccent}
        featureCards={data.featureCards}
      />
      <ServiceStats
        statsTitle={data.statsTitle}
        statsColBefore={data.statsColBefore}
        statsColAfter={data.statsColAfter}
        statsRows={data.statsRows}
      />
      <ServiceCta
        ctaHeading={data.ctaHeading}
        ctaHeadingAccent={data.ctaHeadingAccent}
        ctaSubheading={data.ctaSubheading}
        ctaPrimaryButtonLabel={data.ctaPrimaryButtonLabel}
        ctaPrimaryButtonHref={data.ctaPrimaryButtonHref}
      />
    </>
  );
}
