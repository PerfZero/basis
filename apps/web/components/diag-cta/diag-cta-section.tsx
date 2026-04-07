import Image from "next/image";
import type { DiagCtaData } from "@/lib/strapi/diag-cta";
import styles from "./diag-cta-section.module.css";

export function DiagCtaSection({ headingParts, subheading, buttonLabel, buttonHref, imageUrl }: DiagCtaData) {
  return (
    <section className={styles.section}>
      <div className={styles.inner}>
        <h2 className={styles.heading}>
          {headingParts.map((part, i) =>
            part.accent ? (
              <span key={i} className={styles.headingAccent}>{part.text}</span>
            ) : (
              <span key={i}>{part.text}</span>
            )
          )}
        </h2>
        {subheading && <p className={styles.subheading}>{subheading}</p>}
        <a href={buttonHref} className={styles.btn}>{buttonLabel}</a>
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
