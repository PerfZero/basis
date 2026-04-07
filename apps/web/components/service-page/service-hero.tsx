import Image from "next/image";
import blurBack from "@/app/blur_back.png";
import type { ServicePageData, ServiceBadge } from "@/lib/strapi/service-page";
import s from "./service-hero.module.css";

type Props = Pick<
  NonNullable<ServicePageData>,
  | "heroEyebrow"
  | "heroHeading"
  | "heroHeadingAccent"
  | "heroDescription"
  | "heroPrimaryButtonLabel"
  | "heroPrimaryButtonHref"
  | "heroSecondaryButtonLabel"
  | "heroBadges"
>;

export function ServiceHero({
  heroEyebrow,
  heroHeading,
  heroHeadingAccent,
  heroDescription,
  heroPrimaryButtonLabel,
  heroPrimaryButtonHref,
  heroSecondaryButtonLabel,
  heroBadges,
}: Props) {
  return (
    <section className={s.section}>

      <div className={s.inner}>
        {heroEyebrow && <p className={s.eyebrow}>{heroEyebrow}</p>}
        <span className={s.divider} />

        <h1 className={s.heading}>
          {heroHeading && <span>{heroHeading}</span>}
          {heroHeadingAccent && (
            <>
              <br />
              <span className={s.headingAccent}>{heroHeadingAccent}</span>
            </>
          )}
        </h1>

        {heroDescription && <p className={s.description}>{heroDescription}</p>}

        <div className={s.buttons}>
          {heroPrimaryButtonLabel && (
            <a href={heroPrimaryButtonHref ?? "#"} className={s.btnPrimary}>
              {heroPrimaryButtonLabel}
              <span className={s.btnArrow} aria-hidden>→</span>
            </a>
          )}
          <a href="#" className={s.btnSecondary}>
            {heroSecondaryButtonLabel ?? "Подробнее"}
          </a>
        </div>

        {heroBadges.length > 0 && (
          <div className={s.badges}>
            {heroBadges.map((badge: ServiceBadge) => (
              <span key={badge.id} className={s.badge}>
                {badge.icon?.url ? (
                  <Image
                    src={badge.icon.url}
                    alt=""
                    width={16}
                    height={16}
                    unoptimized
                    aria-hidden
                    className={s.badgeIcon}
                  />
                ) : (
                  <span className={s.badgeDot} aria-hidden />
                )}
                <span>{badge.label}</span>
              </span>
            ))}
          </div>
        )}
      </div>
    </section>
  );
}
