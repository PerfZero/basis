"use client";

import { useState } from "react";
import type { ServicePageData, ServiceRecognizeCard } from "@/lib/strapi/service-page";
import { FormattedText } from "@/components/shared/formatted-text";
import s from "./service-recognize.module.css";

type Props = Pick<NonNullable<ServicePageData>, "recognizeTitle" | "recognizeCards">;

export function ServiceRecognize({ recognizeTitle, recognizeCards }: Props) {
  const [hovered, setHovered] = useState<number | null>(null);

  if (!recognizeTitle && recognizeCards.length === 0) return null;

  return (
    <section className={s.section}>
      {recognizeTitle && (
        <h2 className={s.title}>
          <FormattedText text={recognizeTitle} />
        </h2>
      )}

      <div className={s.track}>
        {recognizeCards.map((card: ServiceRecognizeCard, i: number) => {
          const isActive = hovered === i;
          const isImageOnly = card.image?.url && !card.title;

          if (isImageOnly) {
            return (
              <div
                key={card.id}
                className={[s.card, s.cardImage, isActive ? s.cardExpanded : ""].join(" ")}
                onMouseEnter={() => setHovered(i)}
                onMouseLeave={() => setHovered(null)}
              >
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img src={card.image!.url!} alt="" className={s.cardImg} />
              </div>
            );
          }

          return (
            <article
              key={card.id}
              className={[s.card, isActive ? s.cardExpanded : "", card.image?.url ? s.cardWithImage : ""].join(" ")}
              onMouseEnter={() => setHovered(i)}
              onMouseLeave={() => setHovered(null)}
            >
              <div className={s.cardText}>
                <h3 className={s.cardTitle}>
                  <FormattedText text={card.title} />
                </h3>
                <div className={s.cardBody}>
                  {card.description && (
                    <p className={s.cardDesc}>
                      <span className={s.cardDescLabel}>Суть:</span>{" "}
                      <FormattedText text={card.description} />
                    </p>
                  )}
                  {card.feature && (
                    <p className={s.cardFeature}>
                      <FormattedText text={card.feature} />
                    </p>
                  )}
                </div>
              </div>
              {card.image?.url && (
                <div className={s.blocs}>
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img src={card.image.url} alt="" className={s.cardThumb} aria-hidden />
                </div>
                )}
            </article>
          );
        })}
      </div>
    </section>
  );
}
