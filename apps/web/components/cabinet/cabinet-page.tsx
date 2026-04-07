"use client";

import { useEffect, useState, useTransition } from "react";
import { logoutAction, updateUserAction } from "@/app/actions/auth";
import type { AuthUser } from "@/lib/auth-server";
import { DocumentsTab } from "./documents-tab";
import { ReferralTab } from "./referral-tab";
import s from "./cabinet-page.module.css";

type TabId = "profile" | "documents" | "referral";

const TABS = [
  { id: "profile", label: "ваши данные" },
  { id: "documents", label: "ваши документы" },
  { id: "referral", label: "реферальная программа" },
] as const satisfies ReadonlyArray<{ id: TabId; label: string }>;

const TAB_STORAGE_KEY = "basis_cabinet_tab";

function isTabId(value: string | null): value is TabId {
  return value === "profile" || value === "documents" || value === "referral";
}

const LockIcon = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <rect x="3" y="11" width="18" height="11" rx="2"/>
    <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
  </svg>
);

function EditableField({ label, value, field, onSave }: {
  label: string;
  value: string;
  field: string;
  onSave: (field: string, value: string) => Promise<void>;
}) {
  const [editing, setEditing] = useState(false);
  const [val, setVal] = useState(value);
  const [pending, startTransition] = useTransition();

  function handleSave() {
    startTransition(async () => {
      await onSave(field, val);
      setEditing(false);
    });
  }

  return (
    <div className={s.infoBlock}>
      <p className={s.infoLabel}>{label}</p>
      <div className={s.infoValue}>
        {editing ? (
          <>
            <input
              className={s.inlineInput}
              value={val}
              onChange={(e) => setVal(e.target.value)}
              autoFocus
            />
            <button type="button" className={s.saveBtn} onClick={handleSave} disabled={pending}>
              {pending ? "..." : "Сохранить"}
            </button>
            <button type="button" className={s.cancelBtn} onClick={() => { setVal(value); setEditing(false); }}>
              Отмена
            </button>
          </>
        ) : (
          <>
            <span>{val || "—"}</span>
            <button type="button" className={s.changeBtn} onClick={() => setEditing(true)}>
              Изменить
            </button>
          </>
        )}
      </div>
    </div>
  );
}

function NameFields({ profile, onSave }: { profile: AuthUser; onSave: (f: string, v: string) => Promise<void> }) {
  const [editing, setEditing] = useState(false);
  const [vals, setVals] = useState({ firstName: profile.firstName ?? "", lastName: profile.lastName ?? "", middleName: profile.middleName ?? "" });
  const [pending, startTransition] = useTransition();

  function handleSave() {
    startTransition(async () => {
      await Promise.all([
        onSave("firstName", vals.firstName),
        onSave("lastName", vals.lastName),
        onSave("middleName", vals.middleName),
      ]);
      setEditing(false);
    });
  }

  return (
    <div className={s.nameSection}>
      <div className={s.nameRow}>
        {(["firstName", "lastName", "middleName"] as const).map((f, i) => (
          <div key={f} className={s.fieldGroup}>
            <label className={s.label}>{["Ваше имя", "Ваша фамилия", "Ваше отчество"][i]}</label>
            <input
              className={s.input}
              value={vals[f]}
              onChange={(e) => setVals((v) => ({ ...v, [f]: e.target.value }))}
              readOnly={!editing}
            />
          </div>
        ))}
      </div>
      <div className={s.nameActions}>
        {editing ? (
          <>
            <button type="button" className={s.saveBtn} onClick={handleSave} disabled={pending}>{pending ? "..." : "Сохранить"}</button>
            <button type="button" className={s.cancelBtn} onClick={() => setEditing(false)}>Отмена</button>
          </>
        ) : (
          <button type="button" className={s.changeBtn} onClick={() => setEditing(true)}>Изменить ФИО</button>
        )}
      </div>
    </div>
  );
}

export function CabinetPage({ user }: { user: AuthUser }) {
  const [tab, setTab] = useState<TabId>("profile");
  const [profile, setProfile] = useState(user);
  const initials = (profile.firstName?.[0] ?? profile.username?.[0] ?? "А").toUpperCase();

  useEffect(() => {
    const savedTab = window.localStorage.getItem(TAB_STORAGE_KEY);
    if (isTabId(savedTab)) {
      setTab(savedTab);
    }
  }, []);

  useEffect(() => {
    window.localStorage.setItem(TAB_STORAGE_KEY, tab);
  }, [tab]);

  async function handleSave(field: string, value: string) {
    const result = await updateUserAction({ [field]: value });
    if (!result) {
      setProfile((p) => ({ ...p, [field]: value }));
    }
  }

  return (
    <div className={s.page}>
      <div className={s.topRow}>
        <h1 className={s.heading}>Личный кабинет</h1>
      </div>

      <nav className={s.tabs}>
        {TABS.map((t) => (
          <button key={t.id} type="button"
            className={tab === t.id ? `${s.tab} ${s.tabActive}` : s.tab}
            onClick={() => setTab(t.id)}
          >
            {t.label}
          </button>
        ))}
      </nav>

      {tab === "profile" && (
        <div className={s.content}>
          <div className={s.avatar}>{initials}</div>

          <NameFields profile={profile} onSave={handleSave} />

          <hr className={s.divider} />

          <div className={s.infoRow}>
            <EditableField label="Рабочая почта" value={profile.email} field="email" onSave={handleSave} />
            <EditableField label="Компания" value={profile.company ?? ""} field="company" onSave={handleSave} />
          </div>

          <hr className={s.divider} />

          <EditableField label="Телефон" value={profile.phone ?? ""} field="phone" onSave={handleSave} />

          <hr className={s.divider} />

          <button type="button" className={s.passwordBtn}>
            <LockIcon />
            Изменить пароль
          </button>

          <form action={logoutAction}>
            <button type="submit" className={s.logoutBtn}>Выйти</button>
          </form>
        </div>
      )}

      {tab === "documents" && (
        <div className={s.content}>
          <DocumentsTab />
        </div>
      )}

      {tab === "referral" && (
        <div className={s.content}>
          <ReferralTab />
        </div>
      )}
    </div>
  );
}
