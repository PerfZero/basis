import Image from "next/image";
import blurBack from "@/app/blur_back.png";
import type { HeroBlockData } from "@/lib/strapi/hero-block";
import s from "./hero-section.module.css";

type Props = HeroBlockData;

export function HeroSection({
  eyebrow,
  headingParts,
  description,
  primaryButtonLabel,
  primaryButtonHref,
  secondaryButtonLabel,
  secondaryButtonHref,
}: Props) {
  return (
    <section className={s.section}>
      <Image src={blurBack} alt="" aria-hidden fill className={s.bg} priority quality={100} />

      <div className={s.inner}>
        <p className={s.eyebrow}>{eyebrow}</p>

        <div className={s.divider} />

        <h1 className={s.heading}>
          {headingParts.map((part, i) =>
            part.accent ? (
              <span key={i} className={s.headingAccent}>[{part.text}]</span>
            ) : (
              <span key={i}>{part.text}</span>
            )
          )}
        </h1>

        <p className={s.description}>{description}</p>

        <div className={s.buttons}>
          <a href={primaryButtonHref} className={s.btnPrimary}>
            {primaryButtonLabel}
            <span className={s.btnArrow} aria-hidden>→</span>
          </a>
          <a href={secondaryButtonHref} className={s.btnSecondary}>
            {secondaryButtonLabel}
          </a>
        </div>
      </div>
    </section>
  );
}
