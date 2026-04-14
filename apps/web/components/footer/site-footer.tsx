import Link from "next/link";
import styles from "./site-footer.module.css";

type MenuItem = { id: number; title: string; link: string };
type SocialLink = { id: number; title: string; url: string; kind: string };

const TelegramIcon = () => (
  <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M13 26C20.1814 26 26 20.1814 26 13C26 5.81858 20.1814 0 13 0C5.81858 0 0 5.81858 0 13C0 20.1814 5.81858 26 13 26ZM5.94858 12.7183L18.4828 7.88558C19.0645 7.67542 19.5726 8.0275 19.3841 8.90717L19.3852 8.90608L17.251 18.9605C17.0928 19.6733 16.6693 19.8467 16.0767 19.5108L12.8267 17.1156L11.2591 18.6258C11.0858 18.7991 10.9395 18.9453 10.6037 18.9453L10.8344 15.6379L16.8578 10.1963C17.1199 9.96558 16.7993 9.83558 16.4537 10.0653L9.01008 14.7518L5.80125 13.7508C5.10467 13.5298 5.0895 13.0542 5.94858 12.7183V12.7183Z" fill="#0B7A66" />
  </svg>
);

const WhatsAppIcon = () => (
  <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M13.001 -0.0107422C20.1877 -0.0106023 26.0136 5.81525 26.0137 13.002C26.0137 20.1887 20.1877 26.0155 13.001 26.0156C5.8141 26.0156 -0.0126953 20.1888 -0.0126953 13.002C-0.0125911 5.81516 5.81416 -0.0107422 13.001 -0.0107422ZM13.127 5.2002C8.82847 5.2002 5.20032 8.485 5.2002 12.8516C5.2002 14.6799 5.54301 15.9421 5.84473 17.0752C6.09798 17.9948 6.32128 18.8372 6.32129 19.834C6.42931 21.162 8.90624 20.3858 9.68848 19.3926C10.9251 20.2755 11.637 20.4961 13.168 20.4961C17.3997 20.4736 20.8141 17.0719 20.7998 12.8926C20.7998 8.64741 17.4291 5.20037 13.127 5.2002ZM13.2305 8.97461V8.97852C15.3999 9.10123 17.0701 10.9171 16.9854 13.0615C16.8397 15.2014 14.9865 16.8325 12.8174 16.7295C12.1383 16.6757 11.4853 16.4459 10.9248 16.0635C10.5858 16.3982 10.0422 16.8318 9.82617 16.7803C9.37553 16.6617 8.84667 14.4003 9.14453 12.543C9.50582 10.2991 11.1373 8.86815 13.2305 8.97461Z" fill="#0B7A66" />
  </svg>
);

const LinkIcon = () => (
  <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect x="3" y="3" width="20" height="20" rx="6" fill="#0B7A66" fillOpacity="0.12" />
    <path
      d="M11.0864 13.9173L14.9143 10.0894"
      stroke="#0B7A66"
      strokeWidth="1.8"
      strokeLinecap="round"
    />
    <path
      d="M10.0041 15.0041C8.7161 13.7161 8.7161 11.6274 10.0041 10.3394L11.3394 9.00413C12.6274 7.71616 14.7161 7.71616 16.0041 9.00413"
      stroke="#0B7A66"
      strokeWidth="1.8"
      strokeLinecap="round"
    />
    <path
      d="M15.9957 10.9959C17.2837 12.2839 17.2837 14.3726 15.9957 15.6606L14.6604 16.9959C13.3724 18.2838 11.2837 18.2838 9.99573 16.9959"
      stroke="#0B7A66"
      strokeWidth="1.8"
      strokeLinecap="round"
    />
  </svg>
);

function getSocialIcon(kind: string) {
  switch (kind) {
    case "telegram":
      return <TelegramIcon />;
    case "whatsapp":
      return <WhatsAppIcon />;
    default:
      return <LinkIcon />;
  }
}

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
                    aria-label={link.title || link.kind}
                    target="_blank"
                    rel="noreferrer"
                  >
                    {getSocialIcon(link.kind)}
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
