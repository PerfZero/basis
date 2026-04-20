"use client";

import { useState } from "react";
import styles from "./cookie-consent-banner.module.css";

const CONSENT_KEY = "basis_cookie_consent_v1";
const DEFAULT_TEXT =
  "Мы используем cookie, чтобы сайт работал корректно и для аналитики. Продолжая использовать сайт, вы соглашаетесь с";
const DEFAULT_POLICY_URL = "/privacy";

type CookieConsentBannerProps = {
  text?: string;
  policyUrl?: string;
};

export function CookieConsentBanner({ text, policyUrl }: CookieConsentBannerProps) {
  const [visible, setVisible] = useState(() => {
    if (typeof window === "undefined") return false;
    return window.localStorage.getItem(CONSENT_KEY) !== "accepted";
  });
  const bannerText = text?.trim() || DEFAULT_TEXT;
  const policyHref = policyUrl?.trim() || DEFAULT_POLICY_URL;

  const onAccept = () => {
    window.localStorage.setItem(CONSENT_KEY, "accepted");
    setVisible(false);
  };

  if (!visible) {
    return null;
  }

  return (
    <div className={styles.banner} role="dialog" aria-live="polite" aria-label="Согласие на cookie">
      <div className={styles.content}>
        <p className={styles.text}>
          {bannerText}{" "}
          <a href={policyHref} className={styles.link}>
            политикой конфиденциальности
          </a>
          .
        </p>
        <div className={styles.actions}>
          <button type="button" className={`${styles.button} ${styles.buttonPrimary}`} onClick={onAccept}>
            Принять
          </button>
        </div>
      </div>
    </div>
  );
}
