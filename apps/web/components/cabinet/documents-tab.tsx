"use client";

import { useEffect, useState } from "react";
import type { Document } from "@/app/actions/auth";
import s from "./documents-tab.module.css";

const STATUS_LABELS: Record<Document["docStatus"], string> = {
  pending_signature: "На подписании",
  signed: "Подписан",
  under_review: "На рассмотрении",
};

const STATUS_COLORS: Record<Document["docStatus"], string> = {
  pending_signature: "#0b7a66",
  signed: "#0b7a66",
  under_review: "#e53e3e",
};

export function DocumentsTab() {
  const [docs, setDocs] = useState<Document[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("/api/documents")
      .then((r) => r.json())
      .then((d) => {
        console.log("[docs] response", d);
        setDocs(Array.isArray(d) ? d : []);
        setLoading(false);
      })
      .catch((e) => { console.error("[docs] fetch error", e); setLoading(false); });
  }, []);

  return (
    <div className={s.wrap}>
      <h2 className={s.heading}>Все документы</h2>

      {loading ? (
        <p className={s.empty}>Загрузка...</p>
      ) : docs.length === 0 ? (
        <p className={s.empty}>Документы появятся здесь после их добавления.</p>
      ) : (
        <>
          <table className={s.table}>
            <thead>
              <tr>
                <th className={s.th}>Проект</th>
                <th className={s.th}>Наименование документа</th>
                <th className={s.th}>Состояние</th>
                <th className={s.th}>Файл</th>
              </tr>
            </thead>
            <tbody>
              {docs.map((doc) => (
                <tr key={doc.id} className={s.row}>
                  <td className={s.td}>{doc.project}</td>
                  <td className={s.td}>{doc.name}</td>
                  <td className={s.td}>
                    <span className={s.status}>
                      <span className={s.dot} style={{ background: STATUS_COLORS[doc.docStatus] }} />
                      <span style={{ color: STATUS_COLORS[doc.docStatus] }}>
                        {STATUS_LABELS[doc.docStatus]}
                      </span>
                    </span>
                  </td>
                  <td className={s.td}>
                    {doc.fileUrl ? (
                      <a href={doc.fileUrl} target="_blank" rel="noopener noreferrer" className={s.downloadBtn}>
                        Скачать PDF
                        <span className={s.downloadArrow}>
                          <svg width="13" height="8" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0.5 3.18188C0.223858 3.18188 -2.41411e-08 3.40574 0 3.68188C2.41411e-08 3.95803 0.223858 4.18188 0.5 4.18188L0.5 3.68188L0.5 3.18188ZM12.8536 4.03544C13.0488 3.84017 13.0488 3.52359 12.8536 3.32833L9.67157 0.14635C9.47631 -0.0489121 9.15973 -0.0489121 8.96447 0.14635C8.7692 0.341612 8.7692 0.658195 8.96447 0.853457L11.7929 3.68188L8.96447 6.51031C8.7692 6.70557 8.7692 7.02216 8.96447 7.21742C9.15973 7.41268 9.47631 7.41268 9.67157 7.21742L12.8536 4.03544ZM0.5 3.68188L0.5 4.18188L12.5 4.18188L12.5 3.68188L12.5 3.18188L0.5 3.18188L0.5 3.68188Z" fill="#0B7A66" />
                          </svg>
                        </span>
                      </a>
                    ) : (
                      <span className={s.unavailable}>Недоступно</span>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>

          <div className={s.mobileList}>
            {docs.map((doc) => (
              <article key={`mobile-${doc.id}`} className={s.mobileCard}>
                <div className={s.mobileRow}>
                  <span className={s.mobileLabel}>Проект</span>
                  <span className={s.mobileValue}>{doc.project}</span>
                </div>
                <div className={s.mobileRow}>
                  <span className={s.mobileLabel}>Документ</span>
                  <span className={s.mobileValue}>{doc.name}</span>
                </div>
                <div className={s.mobileRow}>
                  <span className={s.mobileLabel}>Состояние</span>
                  <span className={s.status}>
                    <span className={s.dot} style={{ background: STATUS_COLORS[doc.docStatus] }} />
                    <span style={{ color: STATUS_COLORS[doc.docStatus] }}>
                      {STATUS_LABELS[doc.docStatus]}
                    </span>
                  </span>
                </div>
                <div className={s.mobileActions}>
                  {doc.fileUrl ? (
                    <a href={doc.fileUrl} target="_blank" rel="noopener noreferrer" className={s.downloadBtn}>
                      Скачать PDF
                      <span className={s.downloadArrow}>
                        <svg width="13" height="8" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M0.5 3.18188C0.223858 3.18188 -2.41411e-08 3.40574 0 3.68188C2.41411e-08 3.95803 0.223858 4.18188 0.5 4.18188L0.5 3.68188L0.5 3.18188ZM12.8536 4.03544C13.0488 3.84017 13.0488 3.52359 12.8536 3.32833L9.67157 0.14635C9.47631 -0.0489121 9.15973 -0.0489121 8.96447 0.14635C8.7692 0.341612 8.7692 0.658195 8.96447 0.853457L11.7929 3.68188L8.96447 6.51031C8.7692 6.70557 8.7692 7.02216 8.96447 7.21742C9.15973 7.41268 9.47631 7.41268 9.67157 7.21742L12.8536 4.03544ZM0.5 3.68188L0.5 4.18188L12.5 4.18188L12.5 3.68188L12.5 3.18188L0.5 3.18188L0.5 3.68188Z" fill="#0B7A66" />
                        </svg>
                      </span>
                    </a>
                  ) : (
                    <span className={s.unavailable}>Недоступно</span>
                  )}
                </div>
              </article>
            ))}
          </div>
        </>
      )}
    </div>
  );
}
