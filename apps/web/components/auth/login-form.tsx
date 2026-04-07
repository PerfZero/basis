"use client";

import Link from "next/link";
import Image from "next/image";
import { useState } from "react";
import { loginAction } from "@/app/actions/auth";
import s from "./login-form.module.css";

export function LoginForm() {
  const [remember, setRemember] = useState(true);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setError("");
    setLoading(true);

    const fd = new FormData(e.currentTarget);
    const result = await loginAction({
      email: fd.get("email") as string,
      password: fd.get("password") as string,
    });

    if (result?.error) {
      setError(result.error);
      setLoading(false);
    }
  }

  return (
    <div className={s.page}>
      <header className={s.header}>
        <Link href="/" className={s.logo}>
          <Image src="/logo.svg" alt="BasisThree" width={142} height={40} priority />
        </Link>
        <Link href="/register" className={s.registerBtn}>
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><circle cx="10" cy="8" r="4"/><path d="M16 19c0-3.3-2.7-6-6-6S4 15.7 4 19"/><path d="M19 8v6M22 11h-6"/></svg>
          Зарегистрироваться
        </Link>
      </header>

      <main className={s.main}>
        <h1 className={s.heading}>Вход</h1>

        <form className={s.card} onSubmit={handleSubmit}>
          <div className={s.field}>
            <span className={s.fieldIcon}>
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m2 7 10 7 10-7"/></svg>
            </span>
            <input className={s.input} name="email" type="email" placeholder="Почта" autoComplete="email" required />
          </div>

          <div className={s.field}>
            <span className={s.fieldIcon}>
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
            </span>
            <input className={s.input} name="password" type="password" placeholder="Пароль" autoComplete="current-password" required />
          </div>

          {error && <p className={s.error}>{error}</p>}

          <div className={s.row}>
            <label className={s.checkboxLabel}>
              <input type="checkbox" className={s.checkbox} checked={remember} onChange={(e) => setRemember(e.target.checked)} />
              <span>Запомнить меня</span>
            </label>
            <a href="#" className={s.forgot}>Забыли пароль?</a>
          </div>

          <button type="submit" className={s.submit} disabled={loading}>
            {loading ? "Вход..." : "Войти"}
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
        <Link href="#" className={s.footerLink}>Политика конфиденциальности</Link>
      </footer>
    </div>
  );
}
