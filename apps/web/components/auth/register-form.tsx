"use client";

import Link from "next/link";
import Image from "next/image";
import { useState } from "react";
import { IMaskInput } from "react-imask";
import { registerAction } from "@/app/actions/auth";
import s from "./register-form.module.css";

const CheckIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none" aria-hidden="true">
    <path d="M3 8L6.5 11.5L13 5" stroke="#0B7A66" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const fields = [
  { name: "name", placeholder: "Полное имя", type: "text",
    icon: <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><circle cx="12" cy="8" r="4"/><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7"/></svg> },
  { name: "email", placeholder: "Почта", type: "email",
    icon: <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m2 7 10 7 10-7"/></svg> },
  { name: "phone", placeholder: "Телефон", type: "tel",
    icon: <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><path d="M6.6 10.8c1.4 2.8 3.8 5.1 6.6 6.6l2.2-2.2c.3-.3.7-.4 1-.2 1.1.4 2.3.6 3.6.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1-9.4 0-17-7.6-17-17 0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.5.6 3.6.1.3 0 .7-.2 1L6.6 10.8z"/></svg> },
  { name: "company", placeholder: "Компания", type: "text",
    icon: <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><rect x="2" y="7" width="20" height="15" rx="1"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/></svg> },
  { name: "password", placeholder: "Пароль", type: "password",
    icon: <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg> },
];

export function RegisterForm({ refCode = "" }: { refCode?: string }) {
  const [phone, setPhone] = useState("");
  const [agreed, setAgreed] = useState(false);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const phoneDigits = phone.replace(/\D/g, "");
  const isPhoneValid = phoneDigits.length === 11 && phoneDigits.startsWith("7");

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    if (!agreed) return;
    if (!isPhoneValid) {
      setError("Введите телефон в формате +7 (999) 999-99-99.");
      return;
    }
    setError("");
    setLoading(true);

    const fd = new FormData(e.currentTarget);
    const result = await registerAction({
      name: fd.get("name") as string,
      email: fd.get("email") as string,
      phone: fd.get("phone") as string,
      company: fd.get("company") as string,
      password: fd.get("password") as string,
      referralCode: (fd.get("ref") as string) || "",
    });

    if (result?.error) {
      setError(result.error);
      setLoading(false);
    }
    // при успехе server action делает redirect — loading остаётся true
  }

  return (
    <div className={s.page}>
      <header className={s.header}>
        <Link href="/" className={s.logo}>
          <Image src="/logo.svg" alt="BasisThree" width={142} height={40} priority />
        </Link>
        <Link href="/login" className={s.loginBtn}>
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>
          Войти
        </Link>
      </header>

      <main className={s.main}>
        <div className={s.left}>
          <h1 className={s.heading}>Регистрация</h1>
          <ul className={s.features}>
            <li className={s.feature}><CheckIcon /><span>Реферальная система</span></li>
            <li className={s.feature}><CheckIcon /><span>Отслеживание статуса проектов</span></li>
            <li className={s.feature}><CheckIcon /><span>Связь с личным менеджером</span></li>
          </ul>
        </div>

        <form className={s.form} onSubmit={handleSubmit}>
          {refCode && (
            <p className={s.refHint}>
              Вы пришли по приглашению: <span>{refCode}</span>
            </p>
          )}
          <input type="hidden" name="ref" value={refCode} />
          {fields.map((f) => {
            if (f.name === "phone") {
              return (
                <div key={f.name} className={s.field}>
                  <span className={s.fieldIcon}>{f.icon}</span>
                  <IMaskInput
                    className={s.input}
                    name="phone"
                    mask="+{7} (000) 000-00-00"
                    value={phone}
                    onAccept={(value: unknown) => setPhone(String(value))}
                    placeholder={f.placeholder}
                    required
                    inputMode="tel"
                  />
                </div>
              );
            }

            return (
              <div key={f.name} className={s.field}>
                <span className={s.fieldIcon}>{f.icon}</span>
                <input
                  className={s.input}
                  name={f.name}
                  type={f.type}
                  placeholder={f.placeholder}
                  required={f.name !== "company"}
                />
              </div>
            );
          })}

          {error && <p className={s.error}>{error}</p>}

          <label className={s.checkboxLabel}>
            <input type="checkbox" className={s.checkbox} checked={agreed} onChange={(e) => setAgreed(e.target.checked)} />
            <span>Я принимаю условия использования и политику конфиденциальности</span>
          </label>

          <button type="submit" className={s.submit} disabled={!agreed || !isPhoneValid || loading}>
            {loading ? "Регистрация..." : "Зарегистрироваться"}
            <span className={s.submitArrow}>
              <svg width="13" height="8" viewBox="0 0 13 8" fill="none"><path d="M0.5 3.18198C0.223858 3.18198 0 3.40583 0 3.68198C0 3.95812 0.223858 4.18198 0.5 4.18198L0.5 3.18198ZM12.8536 4.03553C13.0488 3.84027 13.0488 3.52368 12.8536 3.32842L9.67157 0.146442C9.47631-0.0488206 9.15973-0.0488205 8.96447 0.146442C8.7692 0.341704 8.7692 0.658286 8.96447 0.853549L11.7929 3.68198L8.96447 6.5104C8.7692 6.70566 8.7692 7.02225 8.96447 7.21751C9.15973 7.41277 9.47631 7.41277 9.67157 7.21751L12.8536 4.03553ZM0.5 4.18198L12.5 4.18198L12.5 3.18198L0.5 3.18198L0.5 4.18198Z" fill="currentColor"/></svg>
            </span>
          </button>
        </form>
      </main>

      <footer className={s.footer}>
        <Link href="/" className={s.footerLink}>BasisThree</Link>
        <span className={s.footerSep}>/</span>
        <Link href="/about" className={s.footerLink}>О компании</Link>
        <span className={s.footerSep}>/</span>
        <Link href="/privacy" className={s.footerLink}>Политика конфиденциальности</Link>
      </footer>
    </div>
  );
}
