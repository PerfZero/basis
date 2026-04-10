"use client";

import { useEffect, useState } from "react";
import s from "./scroll-to-top-button.module.css";

const SHOW_AFTER_PX = 480;

export function ScrollToTopButton() {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const onScroll = () => {
      setVisible(window.scrollY > SHOW_AFTER_PX);
    };

    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  return (
    <button
      type="button"
      aria-label="Наверх"
      className={`${s.button} ${visible ? s.visible : ""}`}
      onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
    >
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none" aria-hidden="true">
        <path
          d="M8 2.5L14 8.5L12.94 9.56L8.75 5.37V14H7.25V5.37L3.06 9.56L2 8.5L8 2.5Z"
          fill="currentColor"
        />
      </svg>
    </button>
  );
}
