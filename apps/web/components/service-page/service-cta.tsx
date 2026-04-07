import Image from "next/image";
import type { ServicePageData } from "@/lib/strapi/service-page";
import s from "./service-cta.module.css";

const CTA_IMAGE_URL = "/uploads/logo_blurpng_c2af2874a6.png";

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

  return (
    <section className={s.section}>
      <div className={s.container}>
        <h2 className={s.heading}>
          <span>{ctaHeading}</span>
          {ctaHeadingAccent && (
            <span className={s.headingAccent}> {ctaHeadingAccent}</span>
          )}
        </h2>

        {ctaSubheading && <p className={s.subheading}>{ctaSubheading}</p>}

        {ctaPrimaryButtonLabel && (
          <a href={ctaPrimaryButtonHref ?? "#contact"} className={s.btn}>
            {ctaPrimaryButtonLabel}
          </a>
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
