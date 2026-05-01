import Image from "next/image";
import type { ServicePageData, ServiceFeatureCard } from "@/lib/strapi/service-page";
import { FormattedText } from "@/components/shared/formatted-text";
import s from "./service-features.module.css";

type Props = Pick<
  NonNullable<ServicePageData>,
  "featuresTitle" | "featuresTitleAccent" | "featureCards"
>;

export function ServiceFeatures({
  featuresTitle,
  featuresTitleAccent,
  featureCards,
}: Props) {
  if (!featuresTitle && featureCards.length === 0) return null;

  return (
    <section className={s.section}>
      <div className={s.container}>
        {(featuresTitle || featuresTitleAccent) && (
          <h2 className={s.title}>
            {featuresTitle && (
              <span>
                <FormattedText text={`${featuresTitle} `} />
              </span>
            )}
            {featuresTitleAccent && (
              <span className={s.titleAccent}>
                <FormattedText text={featuresTitleAccent} />
              </span>
            )}
          </h2>
        )}

        <div className={s.grid}>
          {featureCards.map((card: ServiceFeatureCard) => (
            <article key={card.id} className={s.card}>
              {card.icon?.url ? (
                <Image
                  src={card.icon.url}
                  alt=""
                  width={32}
                  height={32}
                  unoptimized
                  aria-hidden
                  className={s.cardIcon}
                />
              ) : (
                <span className={s.cardIconDot} aria-hidden />
              )}
              <h3 className={s.cardTitle}>
                <FormattedText text={card.title} />
              </h3>
              {card.description && (
                <p className={s.cardDesc}>
                  <FormattedText text={card.description} />
                </p>
              )}
            </article>
          ))}
        </div>
      </div>
    </section>
  );
}
