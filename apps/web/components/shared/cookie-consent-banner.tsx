"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import styles from "./cookie-consent-banner.module.css";

const CONSENT_KEY = "basis_cookie_consent_v1";

export function CookieConsentBanner() {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const saved = window.localStorage.getItem(CONSENT_KEY);
    if (!saved) {
      setVisible(true);
    }
  }, []);

  const onAccept = () => {
    window.localStorage.setItem(CONSENT_KEY, "accepted");
    setVisible(false);
  };

  const onReject = () => {
    window.localStorage.setItem(CONSENT_KEY, "rejected");
    setVisible(false);
  };

  if (!visible) {
    return null;
  }

  return (
    <div className={styles.banner} role="dialog" aria-live="polite" aria-label="Согласие на cookie">
      <div className={styles.content}>
        <p className={styles.text}>
          Мы используем cookie, чтобы сайт работал корректно и для аналитики. Продолжая использовать
          сайт, вы соглашаетесь с{" "}
          <Link href="/privacy" className={styles.link}>
            политикой конфиденциальности
          </Link>
          .
        </p>
        <div className={styles.actions}>
          <button type="button" className={`${styles.button} ${styles.buttonGhost}`} onClick={onReject}>
            Отклонить
          </button>
          <button type="button" className={`${styles.button} ${styles.buttonPrimary}`} onClick={onAccept}>
            Принять
          </button>
        </div>
      </div>
    </div>
  );
}
