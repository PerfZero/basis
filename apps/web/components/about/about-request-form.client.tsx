"use client";

import { type FormEvent, useState } from "react";
import { IMaskInput } from "react-imask";
import s from "./team-form-section.module.css";

const DIRECTION_OPTIONS = [
  "B2B-портал",
  "BI-аналитика",
  "ERP",
  "CRM",
  "Другое",
] as const;

type SubmitState = {
  type: "idle" | "success" | "error";
  message: string;
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

export function AboutRequestForm() {
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [phone, setPhone] = useState("");
  const [state, setState] = useState<SubmitState>({ type: "idle", message: "" });

  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setState({ type: "idle", message: "" });
    const form = event.currentTarget;

    const formData = new FormData(form);
    const payload = {
      name: String(formData.get("name") ?? "").trim(),
      company: String(formData.get("company") ?? "").trim(),
      direction: String(formData.get("direction") ?? "").trim(),
      pain: String(formData.get("pain") ?? "").trim(),
      turnover: String(formData.get("turnover") ?? "").trim(),
      employeeCount: String(formData.get("employeeCount") ?? "").trim(),
      phone: phone.trim(),
      consent: formData.get("consent") === "on",
    };

    if (!payload.name || !payload.company || !payload.direction || !payload.pain || !payload.phone) {
      setState({ type: "error", message: "Заполните обязательные поля формы." });
      return;
    }

    if (!payload.consent) {
      setState({ type: "error", message: "Подтвердите согласие на обработку персональных данных." });
      return;
    }

    const phoneDigits = payload.phone.replace(/\D/g, "");
    if (phoneDigits.length !== 11 || !phoneDigits.startsWith("7")) {
      setState({ type: "error", message: "Введите телефон в формате +7 (999) 999-99-99." });
      return;
    }

    try {
      setIsSubmitting(true);
      const response = await fetch("/api/contact-requests", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });

      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        setState({
          type: "error",
          message: extractErrorMessage(body, "Не удалось отправить заявку. Попробуйте ещё раз."),
        });
        return;
      }

      form.reset();
      setPhone("");
      setState({ type: "success", message: "Заявка отправлена. Мы свяжемся с вами в ближайшее время." });
    } catch {
      setState({ type: "error", message: "Ошибка сети. Проверьте соединение и попробуйте снова." });
    } finally {
      setIsSubmitting(false);
    }
  }

  return (
    <form className={s.form} onSubmit={handleSubmit}>
      <div className={s.twoCols}>
        <label className={s.field}>
          <span className={s.label}>Ваше имя *</span>
          <input name="name" className={s.input} placeholder="Александр" required />
        </label>
        <label className={s.field}>
          <span className={s.label}>Компания *</span>
          <input name="company" className={s.input} placeholder='ООО "Компания"' required />
        </label>
      </div>

      <label className={s.field}>
        <span className={s.label}>Направление *</span>
        <select name="direction" className={s.input} defaultValue="" required>
          <option value="" disabled>Выберите направление</option>
          {DIRECTION_OPTIONS.map((option) => (
            <option key={option} value={option}>{option}</option>
          ))}
        </select>
      </label>

      <label className={s.field}>
        <span className={s.label}>В чём главная «боль» сейчас? *</span>
        <textarea
          name="pain"
          className={s.textarea}
          placeholder="Опишите проблему, которую хотите решить"
          required
        />
      </label>

      <div className={s.twoCols}>
        <label className={s.field}>
          <span className={s.label}>Оборот компании</span>
          <input name="turnover" className={s.input} placeholder="Выберите диапазон" />
        </label>
        <label className={s.field}>
          <span className={s.label}>Количество сотрудников</span>
          <input name="employeeCount" className={s.input} placeholder="Выберите" />
        </label>
      </div>

      <label className={s.field}>
        <span className={s.label}>Телефон для связи *</span>
        <IMaskInput
          name="phone"
          mask="+{7} (000) 000-00-00"
          value={phone}
          onAccept={(value: unknown) => setPhone(String(value))}
          className={s.input}
          placeholder="+7 (___) ___-__-__"
          required
          inputMode="tel"
        />
      </label>

      <button type="submit" className={s.submit} disabled={isSubmitting}>
        <span>{isSubmitting ? "Отправляем..." : "Отправить запрос экспертам"}</span>
        <span className={s.submitCircle} aria-hidden="true">→</span>
      </button>

      <label className={s.consent}>
        <input name="consent" type="checkbox" required />
        <span>
          Я даю согласие на обработку моих персональных данных в соответствии с Политикой
          конфиденциальности в целях обработки моего обращения.
        </span>
      </label>

      {state.type !== "idle" && (
        <p className={state.type === "success" ? s.formMessageSuccess : s.formMessageError}>
          {state.message}
        </p>
      )}
    </form>
  );
}
