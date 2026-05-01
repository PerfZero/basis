import Image from "next/image";
import type { DiagCtaData } from "@/lib/strapi/diag-cta";
import { DiagnosticTriggerButton } from "@/components/shared/diagnostic-trigger-button";
import { FormattedText } from "@/components/shared/formatted-text";
import styles from "./diag-cta-section.module.css";

export function DiagCtaSection({ headingParts, subheading, buttonLabel, imageUrl }: DiagCtaData) {
  return (
    <section className={styles.section}>
      <div className={styles.inner}>
        <h2 className={styles.heading}>
          {headingParts.map((part, i) =>
            part.accent ? (
              <span key={i} className={styles.headingAccent}>
                <FormattedText text={part.text} />
              </span>
            ) : (
              <span key={i}>
                <FormattedText text={part.text} />
              </span>
            )
          )}
        </h2>
        {subheading && (
          <p className={styles.subheading}>
            <FormattedText text={subheading} />
          </p>
        )}
        <DiagnosticTriggerButton className={styles.btn}>{buttonLabel}</DiagnosticTriggerButton>
        {imageUrl && (
          <div className={styles.imageWrap}>
            <Image
              src={imageUrl}
              alt="Диагностика"
              width={692}
              height={601}
              className={styles.image}

            />
          </div>
        )}
      </div>
    </section>
  );
}
