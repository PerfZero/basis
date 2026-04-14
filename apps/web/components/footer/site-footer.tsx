import Image from "next/image";
import Link from "next/link";
import styles from "./site-footer.module.css";

type MenuItem = { id: number; title: string; link: string };
type SocialLink = { id: number; title: string; url: string; iconUrl: string | null };

export function SiteFooter({
  services,
  socialLinks,
}: {
  services: MenuItem[];
  socialLinks: SocialLink[];
}) {
  const year = new Date().getFullYear();

  return (
    <footer className={styles.footer}>
      <div className={styles.inner}>
        <div className={styles.columns}>
          {/* Услуги */}
          <div className={styles.col}>
            <p className={styles.colLabel}>услуги</p>
            <ul className={styles.colList}>
              {services.map((s) => (
                <li key={s.id}>
                  <a href={s.link} className={styles.colLink}>{s.title}</a>
                </li>
              ))}
            </ul>
          </div>

          {/* Информация */}
          <div className={styles.col}>
            <p className={styles.colLabel}>информация</p>
            <ul className={styles.colList}>
              <li><Link href="/about" className={styles.colLink}>О компании</Link></li>
              <li><Link href="/about#contact" className={styles.colLink}>Контакты</Link></li>
            </ul>
          </div>

          {/* Контакты */}
          <div id="contacts" className={styles.colContacts}>
            <p className={styles.colLabel}>контакты</p>
            <div className={styles.contactsEmailRow}>
              <a href="mailto:info@basisthree.ru" className={styles.colLink}>info@basisthree.ru</a>
              <div className={styles.socials}>
                {socialLinks.map((link) => (
                  <a
                    key={link.id}
                    href={link.url}
                    className={styles.socialBtn}
                    aria-label={link.title}
                    target="_blank"
                    rel="noreferrer"
                  >
                    {link.iconUrl ? (
                      <Image
                        src={link.iconUrl}
                        alt={link.title}
                        width={26}
                        height={26}
                        unoptimized
                        className={styles.socialIcon}
                      />
                    ) : (
                      <span className={styles.socialFallback}>{link.title}</span>
                    )}
                  </a>
                ))}
              </div>
            </div>
            <a href="tel:+79896551212" className={styles.colLink}>+7 (989) 655–12–12</a>
          </div>
        </div>

        {/* Bottom links */}
        <div className={styles.footerBottom}>
          <span className={styles.bottomItem}>© {year}. Все права защищены</span>
          <Link href="/privacy" className={styles.bottomItem}>
            Политика конфиденциальности
          </Link>
          <Link href="/oferta" className={styles.bottomItem}>
            Договор оферты
          </Link>
        </div>
      </div>

      <div className={styles.bigLogoWrap} aria-hidden="true">
        <span className={styles.bigLogoDark}>BASIS</span><span className={styles.bigLogoAccent}>THREE</span>
      </div>
    </footer>
  );
}
