"use client";

import { type FormEvent, useEffect, useRef, useState } from "react";
import { ArrowRight, Phone, UserRound, X } from "lucide-react";
import { IMaskInput } from "react-imask";
import s from "./diagnostic-modal.module.css";

type Props = {
  onClose: () => void;
};

function extractErrorMessage(body: unknown, fallback: string): string {
  if (!body || typeof body !== "object") return fallback;
  const src = body as Record<string, unknown>;

  if (typeof src.error === "string" && src.error.trim()) return src.error;
  if (typeof src.message === "string" && src.message.trim()) return src.message;

  if (src.error && typeof src.error === "object") {
    const nested = src.error as Record<string, unknown>;
    if (typeof nested.message === "string" && nested.message.trim()) return nested.message;
    if (typeof nested.name === "string" && nested.name.trim()) return nested.name;
  }

  return fallback;
}

export function DiagnosticModal({ onClose }: Props) {
  const [phone, setPhone] = useState("");
  const [consent, setConsent] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [message, setMessage] = useState<{ type: "success" | "error"; text: string } | null>(null);
  const overlayRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => { document.body.style.overflow = prev; };
  }, []);

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") onClose();
    }
    document.addEventListener("keydown", onKey);
    return () => document.removeEventListener("keydown", onKey);
  }, [onClose]);

  async function handleSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setMessage(null);
    const form = e.currentTarget;
    const name = String((new FormData(form)).get("name") ?? "").trim();

    if (!consent) {
      setMessage({ type: "error", text: "Подтвердите согласие на обработку персональных данных." });
      return;
    }

    try {
      setIsSubmitting(true);
      const res = await fetch("/api/diagnostic-requests", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ data: { name, phone, consent } }),
      });

      if (!res.ok) {
        const body = await res.json().catch(() => ({}));
        setMessage({
          type: "error",
          text: extractErrorMessage(body, "Не удалось отправить заявку. Попробуйте ещё раз."),
        });
        return;
      }

      setMessage({ type: "success", text: "Заявка отправлена. Мы свяжемся с вами в ближайшее время." });
      form.reset();
      setPhone("");
      setConsent(false);
    } catch {
      setMessage({ type: "error", text: "Ошибка сети. Проверьте соединение и попробуйте снова." });
    } finally {
      setIsSubmitting(false);
    }
  }

  return (
    <div
      className={s.overlay}
      ref={overlayRef}
      onClick={(e) => { if (e.target === overlayRef.current) onClose(); }}
    >
      <div className={s.modal} role="dialog" aria-modal="true" aria-labelledby="diag-modal-title">
        <button type="button" className={s.closeBtn} onClick={onClose} aria-label="Закрыть">
          <X size={20} />
        </button>

        <h2 id="diag-modal-title" className={s.title}>Оставить заявку</h2>

        <form className={s.form} onSubmit={handleSubmit}>
          <div className={s.inputWrap}>
            <span className={s.inputIcon}><UserRound size={20} /></span>
            <input name="name" className={s.input} placeholder="Имя" required />
          </div>

          <div className={s.inputWrap}>
            <span className={s.inputIcon}><Phone size={20} /></span>
            <IMaskInput
              name="phone"
              mask="+{7} (000) 000-00-00"
              value={phone}
              onAccept={(value: unknown) => setPhone(String(value))}
              className={s.input}
              placeholder="Телефон"
              required
              inputMode="tel"
            />
          </div>

          <label className={s.consent}>
            <span
              className={`${s.checkboxWrap}${consent ? ` ${s.checked}` : ""}`}
              onClick={() => setConsent((v) => !v)}
              role="checkbox"
              aria-checked={consent}
              tabIndex={0}
              onKeyDown={(e) => { if (e.key === " " || e.key === "Enter") setConsent((v) => !v); }}
            >
              {consent && (
                <svg width="12" height="10" viewBox="0 0 12 10" fill="none">
                  <path d="M1 5L4.5 8.5L11 1" stroke="#fff" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" />
                </svg>
              )}
            </span>
            <span className={s.consentText} onClick={() => setConsent((v) => !v)}>
              Я даю согласие на обработку моих персональных данных в соответствии с{" "}
              <a href="/privacy" className={s.consentLink} onClick={(e) => e.stopPropagation()}>
                Политикой конфиденциальности
              </a>{" "}
              в целях обработки моего обращения.
            </span>
          </label>

          <button type="submit" className={s.submit} disabled={isSubmitting}>
            <span>{isSubmitting ? "Отправляем..." : "Отправить"}</span>
            <span className={s.submitCircle} aria-hidden="true">
              <ArrowRight size={18} />
            </span>
          </button>

          {message && (
            <p className={message.type === "success" ? `${s.message} ${s.messageSuccess}` : `${s.message} ${s.messageError}`}>
              {message.text}
            </p>
          )}
        </form>
      </div>
    </div>
  );
}
