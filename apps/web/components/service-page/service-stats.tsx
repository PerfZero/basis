import type { ServicePageData, ServiceStatRow } from "@/lib/strapi/service-page";
import s from "./service-stats.module.css";

type Props = Pick<
  NonNullable<ServicePageData>,
  "statsTitle" | "statsColBefore" | "statsColAfter" | "statsRows"
>;

export function ServiceStats({
  statsTitle,
  statsColBefore,
  statsColAfter,
  statsRows,
}: Props) {
  if (!statsTitle && statsRows.length === 0) return null;

  return (
    <section className={s.section}>
      <div className={s.container}>
        {statsTitle && <h2 className={s.title}>{statsTitle}</h2>}

        <div className={s.tableWrap}>
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
      </div>
    </section>
  );
}
