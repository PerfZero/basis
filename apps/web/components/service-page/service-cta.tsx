import Image from "next/image";
import { DiagnosticTriggerButton } from "@/components/shared/diagnostic-trigger-button";
import { FormattedText } from "@/components/shared/formatted-text";
import type { ServicePageData } from "@/lib/strapi/service-page";
import s from "./service-cta.module.css";

const CTA_IMAGE_URL = "/Group 111.png";

type Props = Pick<
  NonNullable<ServicePageData>,
  | "ctaHeading"
  | "ctaHeadingAccent"
  | "ctaSubheading"
  | "ctaPrimaryButtonLabel"
  | "ctaPrimaryButtonHref"
>;

export function ServiceCta({
  ctaHeading,
  ctaHeadingAccent,
  ctaSubheading,
  ctaPrimaryButtonLabel,
  ctaPrimaryButtonHref,
}: Props) {
  if (!ctaHeading) return null;
  const targetHref = ctaPrimaryButtonHref ?? "#contact";

  return (
    <section className={s.section}>
      <div className={s.container}>
        <h2 className={s.heading}>
          <span>
            <FormattedText text={ctaHeading} />
          </span>
          {ctaHeadingAccent && (
            <span className={s.headingAccent}>
              {" "}
              <FormattedText text={ctaHeadingAccent} />
            </span>
          )}
        </h2>

        {ctaSubheading && (
          <p className={s.subheading}>
            <FormattedText text={ctaSubheading} />
          </p>
        )}

        {ctaPrimaryButtonLabel && (
          <DiagnosticTriggerButton className={s.btn} dataTargetHref={targetHref}>
            <FormattedText text={ctaPrimaryButtonLabel} />
          </DiagnosticTriggerButton>
        )}

        <div className={s.imageWrap}>
          <Image
            src={CTA_IMAGE_URL}
            alt=""
            width={1000}
            height={928}
            unoptimized
            className={s.image}
            aria-hidden
          />
        </div>
      </div>
    </section>
  );
}
