import Image from "next/image";
import blurBack from "@/app/blur_back.png";
import type { ServicePageData, ServiceBadge } from "@/lib/strapi/service-page";
import { DiagnosticTriggerButton } from "@/components/shared/diagnostic-trigger-button";
import s from "./service-hero.module.css";

type Props = Pick<
  NonNullable<ServicePageData>,
  | "heroEyebrow"
  | "heroHeading"
  | "heroHeadingAccent"
  | "heroDescription"
  | "heroPrimaryButtonLabel"
  | "heroPrimaryButtonHref"
  | "heroBadges"
>;

function renderWithLineBreaks(value: string) {
  const normalized = value
    .replace(/<br\s*\/?>/gi, "\n")
    .replace(/&lt;\s*br\s*\/?\s*&gt;/gi, "\n");

  return normalized.split("\n").map((line, index) => (
    <span key={`${line}-${index}`}>
      {index > 0 && <br />}
      {line}
    </span>
  ));
}

export function ServiceHero({
  heroEyebrow,
  heroHeading,
  heroHeadingAccent,
  heroDescription,
  heroPrimaryButtonLabel,
  heroPrimaryButtonHref,
  heroBadges,
}: Props) {
  return (
    <section className={s.section}>

      <div className={s.inner}>
        {heroEyebrow && <p className={s.eyebrow}>{heroEyebrow}</p>}
        <span className={s.divider} />

        <h1 className={s.heading}>
          {heroHeading && <span>{renderWithLineBreaks(heroHeading)}</span>}
          {heroHeadingAccent && (
            <>

              <span className={s.headingAccent}>{renderWithLineBreaks(heroHeadingAccent)}</span>
            </>
          )}
        </h1>

        {heroDescription && <p className={s.description}>{heroDescription}</p>}

        <div className={s.buttons}>
          {heroPrimaryButtonLabel && (
            <DiagnosticTriggerButton
              className={s.btnPrimary}
              dataTargetHref={heroPrimaryButtonHref ?? "#"}
            >
              {heroPrimaryButtonLabel}
              <span className={s.btnArrow} aria-hidden>→</span>
            </DiagnosticTriggerButton>
          )}
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
