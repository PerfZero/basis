import Image from "next/image";
import Link from "next/link";
import styles from "./site-footer.module.css";

type MenuItem = { id: number; title: string; link: string };
type SocialLink = { id: number; title: string; url: string; iconUrl: string | null };

function socialLabel(link: SocialLink): string {
  if (link.title.trim()) return link.title.trim();
  try {
    return new URL(link.url).hostname.replace(/^www\./, "");
  } catch {
    return "Соцсеть";
  }
}

export function SiteFooter({
  services,
  socialLinks,
  contactEmail,
  contactPhone,
}: {
  services: MenuItem[];
  socialLinks: SocialLink[];
  contactEmail: string;
  contactPhone: string;
}) {
  const year = new Date().getFullYear();
  const phoneHref = `tel:${contactPhone.replace(/[^\d+]/g, "")}`;

  return (
    <footer className={styles.footer}>
      <div className={styles.inner}>
        <div className={styles.columns}>
          {/* Услуги */}
          <div className={styles.col}>
            <div className={styles.colMain}>
              <p className={styles.colLabel}>услуги</p>
              <ul className={styles.colList}>
                {services.map((s) => (
                  <li key={s.id}>
                    <a href={s.link} className={styles.colLink}>{s.title}</a>
                  </li>
                ))}
              </ul>
            </div>
            <span className={styles.bottomItem}>© {year}. Все права защищены</span>
          </div>

          {/* Информация */}
          <div className={styles.col}>
            <div className={styles.colMain}>
              <p className={styles.colLabel}>информация</p>
              <ul className={styles.colList}>
                <li><Link href="/about" className={styles.colLink}>О компании</Link></li>
                <li><Link href="/about#contact" className={styles.colLink}>Контакты</Link></li>
              </ul>
            </div>
            <Link href="/privacy" className={styles.bottomItem}>
              Политика конфиденциальности
            </Link>
          </div>

          {/* Контакты */}
          <div id="contacts" className={styles.colContacts}>
            <div className={styles.colMain}>
              <p className={styles.colLabel}>контакты</p>
              <div className={styles.contactsTopRow}>
                <a href={`mailto:${contactEmail}`} className={styles.colLink}>{contactEmail}</a>
                <a href={phoneHref} className={styles.colLink}>{contactPhone}</a>
              </div>
              <div className={styles.socials}>
                {socialLinks.map((link) => (
                  <a
                    key={link.id}
                    href={link.url}
                    className={styles.socialBtn}
                    aria-label={socialLabel(link)}
                    target="_blank"
                    rel="noreferrer"
                  >
                    {link.iconUrl ? (
                      <Image
                        src={link.iconUrl}
                        alt={socialLabel(link)}
                        width={26}
                        height={26}
                        unoptimized
                        className={styles.socialIcon}
                      />
                    ) : (
                      <span className={styles.socialFallback}>{socialLabel(link)}</span>
                    )}
                  </a>
                ))}
              </div>
            </div>
            <Link href="/oferta" className={styles.bottomItem}>
              Договор оферты
            </Link>
          </div>
        </div>
      </div>

      <div className={styles.bigLogoWrap} aria-hidden="true">
        <span className={styles.bigLogoDark}>BASIS</span><span className={styles.bigLogoAccent}>THREE</span>
      </div>
    </footer>
  );
}
