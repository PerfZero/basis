import type { ServicePageData, ServiceTargetCard } from "@/lib/strapi/service-page";
import { DiagnosticTriggerButton } from "@/components/shared/diagnostic-trigger-button";
import s from "./service-target.module.css";

type Props = Pick<
  NonNullable<ServicePageData>,
  "targetTitle" | "targetButtonLabel" | "targetButtonHref" | "targetCards"
>;

export function ServiceTarget({
  targetTitle,
  targetButtonLabel,
  targetButtonHref,
  targetCards,
}: Props) {
  if (!targetTitle && targetCards.length === 0) return null;

  return (
    <section className={s.section}>
      <div className={s.container}>
        {targetTitle && (
          <h2 className={s.title}>{targetTitle}</h2>
        )}

        <div className={s.grid}>
          {targetCards.map((card: ServiceTargetCard) => (
            <article key={card.id} className={s.card}>
              {card.tag && <span className={s.tag}>{card.tag}</span>}
              <h3 className={s.cardTitle}>{card.title}</h3>
              {card.challenge && (
                <p className={s.challenge}>
                  <span className={s.challengeLabel}>Вызов:</span> {card.challenge}
                </p>
              )}
              {card.feature && (
                <p className={s.feature}>{card.feature}</p>
              )}
            </article>
          ))}
        </div>

        {targetButtonLabel && (
          <div className={s.btnWrap}>
            <DiagnosticTriggerButton className={s.btn} dataTargetHref={targetButtonHref ?? "#contact"}>
              {targetButtonLabel}
              <span className={s.btnArrow} aria-hidden><svg width="13" height="8" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0.5 3.18201C0.223858 3.18201 -2.41411e-08 3.40586 0 3.68201C2.41411e-08 3.95815 0.223858 4.18201 0.5 4.18201L0.5 3.68201L0.5 3.18201ZM12.8536 4.03556C13.0488 3.8403 13.0488 3.52371 12.8536 3.32845L9.67157 0.146472C9.47631 -0.04879 9.15973 -0.04879 8.96447 0.146472C8.7692 0.341734 8.7692 0.658317 8.96447 0.853579L11.7929 3.68201L8.96447 6.51043C8.7692 6.7057 8.7692 7.02228 8.96447 7.21754C9.15973 7.4128 9.47631 7.4128 9.67157 7.21754L12.8536 4.03556ZM0.5 3.68201L0.5 4.18201L12.5 4.18201L12.5 3.68201L12.5 3.18201L0.5 3.18201L0.5 3.68201Z" fill="#0B7A66" />
              </svg></span>
            </DiagnosticTriggerButton>
          </div>
        )}
      </div>
    </section>
  );
}
