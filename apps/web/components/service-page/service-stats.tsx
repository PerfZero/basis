import type { ServicePageData, ServiceStatRow } from "@/lib/strapi/service-page";
import s from "./service-stats.module.css";

type Props = Pick<
  NonNullable<ServicePageData>,
  "statsTitle" | "statsColBefore" | "statsColAfter" | "statsBottomText" | "statsRows"
>;

export function ServiceStats({
  statsTitle,
  statsColBefore,
  statsColAfter,
  statsBottomText,
  statsRows,
}: Props) {
  if (!statsTitle && statsRows.length === 0) return null;

  return (
    <section className={s.section}>
      <div className={s.container}>
        {statsTitle && <h2 className={s.title}>{statsTitle}</h2>}

        <div className={`${s.tableWrap} ${s.desktopOnly}`}>
          <table className={s.table}>
            <thead>
              <tr>
                <th className={s.thLabel} />
                <th className={s.thBefore}>{statsColBefore ?? "До"}</th>
                <th className={s.thAfter}>{statsColAfter ?? "После"}</th>
              </tr>
            </thead>
            <tbody>
              {statsRows.map((row: ServiceStatRow) => (
                <tr key={row.id} className={s.row}>
                  <td className={s.tdLabel}>{row.label}</td>
                  <td className={s.tdBefore}>{row.valueBefore}</td>
                  <td className={s.tdAfter}>{row.valueAfter}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <div className={s.mobileOnly}>
          <div className={s.mobileCard}>
            <h3 className={s.mobileSectionTitle}>{statsColBefore ?? "До внедрения"}</h3>
            <div className={s.mobileRows}>
              {statsRows.map((row: ServiceStatRow) => (
                <div key={`before-${row.id}`} className={s.mobileRow}>
                  <div className={s.mobileLabel}>{row.label}</div>
                  <div className={s.mobileValue}>{row.valueBefore}</div>
                </div>
              ))}
            </div>

            <h3 className={`${s.mobileSectionTitle} ${s.mobileSectionTitleAfter}`}>
              {statsColAfter ?? "После внедрения"}
            </h3>
            <div className={s.mobileRows}>
              {statsRows.map((row: ServiceStatRow) => (
                <div key={`after-${row.id}`} className={s.mobileRow}>
                  <div className={s.mobileLabel}>{row.label}</div>
                  <div className={`${s.mobileValue} ${s.mobileValueAfter}`}>{row.valueAfter}</div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {statsBottomText && <p className={s.bottomText}>{statsBottomText}</p>}
      </div>
    </section>
  );
}
