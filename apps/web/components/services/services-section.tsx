import Image from "next/image";
import Link from "next/link";
import type { ServicesSectionData } from "@/lib/strapi/services";
import styles from "./services-section.module.css";

function splitHeadingLines(value: string): string[] {
  return value
    .split(/(?:<br\s*\/?>|\r?\n)/gi)
    .map((line) => line.trim())
    .filter((line) => line.length > 0);
}

export function ServicesSection({ heading, subheading, cards }: ServicesSectionData) {
  const headingLines = splitHeadingLines(heading);

  return (
    <section id="services" className={styles.section}>
      <div className={styles.inner}>
        <div className={styles.header}>
          <h2 className={styles.heading}>
            {headingLines.length > 0
              ? headingLines.map((line, index) => (
                  <span key={`${line}-${index}`}>
                    {index > 0 && <br />}
                    {line}
                  </span>
                ))
              : heading}
          </h2>
        </div>
        <div className={styles.grid}>
          {cards.map((card) => (
            (() => {
              const cardClass = card.isFeatured ? `${styles.card} ${styles.cardFeatured}` : styles.card;
              const isNavigable = Boolean(card.link && card.link !== "#");
              const content = (
                <>
                  {card.iconUrl && (
                    <div className={styles.iconWrap}>
                      <Image
                        src={card.iconUrl}
                        alt={card.title}
                        width={48}
                        height={48}
                        className={styles.icon}
                      />
                    </div>
                  )}
                  <h3 className={styles.cardTitle}>{card.title}</h3>
                  {card.description && (
                    <p className={styles.cardDescription}>{card.description}</p>
                  )}
                  {card.link && (
                    <span className={styles.cardLink}>
                      {card.linkLabel}{" "}
                      <svg width="10" height="8" viewBox="0 0 10 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5.79001 0.974031C5.73474 0.922534 5.69041 0.860434 5.65967 0.791434C5.62893 0.722435 5.6124 0.64795 5.61106 0.572423C5.60973 0.496896 5.62362 0.421874 5.65191 0.351833C5.68021 0.281792 5.72231 0.218166 5.77573 0.164752C5.82914 0.111338 5.89277 0.0692296 5.96281 0.0409388C6.03285 0.0126481 6.10787 -0.00124521 6.1834 8.7386e-05C6.25893 0.00141998 6.33341 0.0179511 6.40241 0.0486951C6.47141 0.0794391 6.53351 0.123766 6.58501 0.179031L9.58501 3.17903C9.69034 3.2845 9.74951 3.42747 9.74951 3.57653C9.74951 3.72559 9.69034 3.86856 9.58501 3.97403L6.58501 6.97403C6.53351 7.0293 6.47141 7.07362 6.40241 7.10437C6.33341 7.13511 6.25893 7.15164 6.1834 7.15297C6.10787 7.15431 6.03285 7.14041 5.96281 7.11212C5.89277 7.08383 5.82914 7.04172 5.77573 6.98831C5.72231 6.9349 5.68021 6.87127 5.65191 6.80123C5.62362 6.73119 5.60973 6.65617 5.61106 6.58064C5.6124 6.50511 5.62893 6.43063 5.65967 6.36163C5.69041 6.29263 5.73474 6.23053 5.79001 6.17903L7.83001 4.13903L0.562506 4.13903C0.413322 4.13903 0.270247 4.07977 0.164759 3.97428C0.0592697 3.86879 6.51286e-06 3.72571 6.51939e-06 3.57653C6.52591e-06 3.42735 0.0592698 3.28427 0.164759 3.17878C0.270247 3.07329 0.413322 3.01403 0.562507 3.01403L7.83001 3.01403L5.79001 0.974031Z" fill="#0B7A66" />
                      </svg>
                    </span>
                  )}
                </>
              );

              if (!isNavigable) {
                return (
                  <div key={card.id} className={cardClass}>
                    {content}
                  </div>
                );
              }

              return (
                <Link key={card.id} href={card.link} className={`${cardClass} ${styles.cardClickable}`}>
                  {content}
                </Link>
              );
            })()
          ))}
        </div>
      </div>
    </section>
  );
}
