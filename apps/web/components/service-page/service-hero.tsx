import Image from "next/image";
import { Fragment } from "react";
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

type HeadingPart = { text: string; accent: boolean };

function normalizeHeading(value: string): string {
  return value
    .replace(/<br\s*\/?>/gi, "\n")
    .replace(/&lt;\s*br\s*\/?\s*&gt;/gi, "\n")
    .replace(/&nbsp;/gi, " ")
    .replace(/[\u2028\u2029]/g, "\n");
}

function parseHeadingParts(value: string): HeadingPart[] {
  const normalized = normalizeHeading(value);
  const parts: HeadingPart[] = [];
  const markerRegex = /%%([^%]+)%%|\[([^\]]+)\]/g;
  let last = 0;
  let match: RegExpExecArray | null = null;

  while ((match = markerRegex.exec(normalized)) !== null) {
    if (match.index > last) {
      parts.push({ text: normalized.slice(last, match.index), accent: false });
    }

    const accentText = match[1] ?? match[2] ?? "";
    if (accentText) {
      parts.push({ text: accentText, accent: true });
    }

    last = match.index + match[0].length;
  }

  if (last < normalized.length) {
    parts.push({ text: normalized.slice(last), accent: false });
  }

  if (parts.length === 0) {
    return [{ text: normalized, accent: false }];
  }

  return parts;
}

function renderTextWithBreaks(value: string, keyPrefix: string) {
  return normalizeHeading(value).split("\n").map((line, index) => (
    <Fragment key={`${keyPrefix}-${index}`}>
      {index > 0 && <br />}
      {line}
    </Fragment>
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
  const composedHeading = (() => {
    if (!heroHeading) return "";
    if (heroHeading.includes("%%") || /\[[^\]]+\]/.test(heroHeading)) {
      return heroHeading;
    }
    if (heroHeadingAccent) {
      return `${heroHeading} %%${heroHeadingAccent}%%`;
    }
    return heroHeading;
  })();
  const headingParts = composedHeading ? parseHeadingParts(composedHeading) : [];

  return (
    <section className={s.section}>

      <div className={s.inner}>
        {heroEyebrow && <p className={s.eyebrow}>{heroEyebrow}</p>}
        <span className={s.divider} />

        <h1 className={s.heading}>
          {headingParts.map((part, index) =>
            part.accent ? (
              <span key={`accent-${index}`} className={s.headingAccent}>
                {renderTextWithBreaks(part.text, `accent-${index}`)}
              </span>
            ) : (
              <span key={`plain-${index}`}>
                {renderTextWithBreaks(part.text, `plain-${index}`)}
              </span>
            )
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
