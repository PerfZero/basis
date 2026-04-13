"use client";

import { useEffect, useMemo, useState } from "react";
import s from "./referral-tab.module.css";

type ReferralStatus = "in_progress" | "contract_signed";

type ReferralEntry = {
  id: number;
  contactPerson: string;
  email: string;
  phone: string;
  company: string;
  product: string;
  status: ReferralStatus;
  payout: number;
};

type ReferralPayload = {
  referralLink: string;
  termsUrl: string;
  summary: {
    totalInvited: number;
    closedContracts: number;
    totalPayout: number;
  };
  entries: ReferralEntry[];
};

const STATUS_LABELS: Record<ReferralStatus, string> = {
  in_progress: "В работе",
  contract_signed: "Контракт заключён",
};

const STATUS_CLASS: Record<ReferralStatus, string> = {
  in_progress: s.statusProgress,
  contract_signed: s.statusDone,
};

function formatMoney(value: number): string {
  return `${new Intl.NumberFormat("ru-RU").format(value)} ₽`;
}

function companyWord(value: number): string {
  const m10 = value % 10;
  const m100 = value % 100;
  if (m10 === 1 && m100 !== 11) return "компания";
  if (m10 >= 2 && m10 <= 4 && (m100 < 12 || m100 > 14)) return "компании";
  return "компаний";
}

function dealsText(value: number): string {
  const m10 = value % 10;
  const m100 = value % 100;
  if (m10 === 1 && m100 !== 11) return "сделка завершена";
  if (m10 >= 2 && m10 <= 4 && (m100 < 12 || m100 > 14)) return "сделки завершены";
  return "сделок завершено";
}

const DocIcon = () => (
  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" aria-hidden="true">
    <path d="M8 3h6l5 5v11a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2Z" stroke="currentColor" strokeWidth="1.8" />
    <path d="M14 3v5h5M9 13h6M9 17h6" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" />
  </svg>
);

export function ReferralTab() {
  const [loading, setLoading] = useState(true);
  const [copied, setCopied] = useState(false);
  const [data, setData] = useState<ReferralPayload>({
    referralLink: "",
    termsUrl: "#",
    summary: { totalInvited: 0, closedContracts: 0, totalPayout: 0 },
    entries: [],
  });

  useEffect(() => {
    fetch("/api/referrals")
      .then(async (res) => {
        if (res.status === 401) {
          window.location.href = "/login";
          return null;
        }

        const payload = (await res.json()) as ReferralPayload;
        if (payload && payload.summary) setData(payload);
        return payload;
      })
      .finally(() => setLoading(false));
  }, []);

  const stats = useMemo(() => data.summary, [data.summary]);

  async function handleCopy() {
    if (!data.referralLink) return;
    try {
      await navigator.clipboard.writeText(data.referralLink);
      setCopied(true);
      setTimeout(() => setCopied(false), 1800);
    } catch {
      setCopied(false);
    }
  }

  return (
    <section className={s.wrap}>
      <div className={s.headerRow}>
        <h2 className={s.title}>Реферальная программа</h2>
        <a href={data.termsUrl || "#"} target="_blank" rel="noopener noreferrer" className={s.termsBtn}>
          <DocIcon />
          <span>Условия программы</span>
        </a>
      </div>

      <div className={s.linkBox}>
        <p className={s.linkText}>
          Ваша ссылка: <span>{data.referralLink || "—"}</span>
        </p>
        <button type="button" onClick={handleCopy} className={s.copyBtn} aria-label="Скопировать реферальную ссылку">
          {copied ? "Ссылка скопирована" : "Скопировать ссылку"}
          <span className={s.copyArrow}>→</span>
        </button>
      </div>

      <div className={s.statsGrid}>
        <article className={s.statCard}>
          <p className={s.statLabel}>Всего приглашено</p>
          <span>
          <p className={s.statValue}>{stats.totalInvited}</p>
            <p className={s.statSub}>{companyWord(stats.totalInvited)}</p>
          </span>
        </article>
        <article className={s.statCard}>
          <p className={s.statLabel}>Заключено контрактов</p>
          <span>
          <p className={s.statValue}>{stats.closedContracts}</p>
            <p className={s.statSub}>{dealsText(stats.closedContracts)}</p>
          </span>
        </article>
        <article className={s.statCard}>
          <p className={s.statLabel}>Начислено выплат</p>
          <p className={s.statMoney}>{formatMoney(stats.totalPayout)}</p>
        </article>
      </div>

      <h3 className={s.historyTitle}>История рефералов</h3>

      {loading ? (
        <p className={s.empty}>Загружаем данные...</p>
      ) : (
        <>
          <div className={s.tableWrap}>
            <table className={s.table}>
              <thead>
                <tr>
                  <th>Контактное лицо</th>
                  <th>Контакты</th>
                  <th>Компания</th>
                  <th>Продукт</th>
                  <th>Статус</th>
                  <th>Выплата</th>
                </tr>
              </thead>
              <tbody>
                {data.entries.length === 0 ? (
                  <tr>
                    <td colSpan={6} className={s.noRows}>
                      История пока пуста
                    </td>
                  </tr>
                ) : (
                  data.entries.map((entry) => (
                    <tr key={entry.id}>
                      <td>{entry.contactPerson}</td>
                      <td>
                        {entry.email && <div>{entry.email}</div>}
                        {entry.phone && <div>{entry.phone}</div>}
                      </td>
                      <td>{entry.company}</td>
                      <td>
                        <span className={s.productBadge}>{entry.product}</span>
                      </td>
                      <td>
                        <span className={`${s.status} ${STATUS_CLASS[entry.status]}`}>
                          <span className={s.dot} />
                          {STATUS_LABELS[entry.status]}
                        </span>
                      </td>
                      <td className={s.payoutCell}>{entry.payout > 0 ? formatMoney(entry.payout) : "—"}</td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>

          <div className={s.mobileHistory}>
            {data.entries.length === 0 ? (
              <p className={s.noRows}>История пока пуста</p>
            ) : (
              data.entries.map((entry) => (
                <article key={`mobile-${entry.id}`} className={s.mobileCard}>
                  <div className={s.mobileRow}>
                    <span className={s.mobileLabel}>Контактное лицо</span>
                    <span className={s.mobileValue}>{entry.contactPerson || "—"}</span>
                  </div>
                  <div className={s.mobileRow}>
                    <span className={s.mobileLabel}>Контакты</span>
                    <span className={s.mobileValue}>
                      {entry.email && <span>{entry.email}</span>}
                      {entry.phone && <span>{entry.phone}</span>}
                      {!entry.email && !entry.phone && "—"}
                    </span>
                  </div>
                  <div className={s.mobileRow}>
                    <span className={s.mobileLabel}>Компания</span>
                    <span className={s.mobileValue}>{entry.company || "—"}</span>
                  </div>
                  <div className={s.mobileRow}>
                    <span className={s.mobileLabel}>Продукт</span>
                    <span className={s.productBadge}>{entry.product}</span>
                  </div>
                  <div className={s.mobileRow}>
                    <span className={s.mobileLabel}>Статус</span>
                    <span className={`${s.status} ${STATUS_CLASS[entry.status]}`}>
                      <span className={s.dot} />
                      {STATUS_LABELS[entry.status]}
                    </span>
                  </div>
                  <div className={s.mobileRow}>
                    <span className={s.mobileLabel}>Выплата</span>
                    <span className={s.mobilePayout}>{entry.payout > 0 ? formatMoney(entry.payout) : "—"}</span>
                  </div>
                </article>
              ))
            )}
          </div>
        </>
      )}
    </section>
  );
}
