import type { ServicePageData, ServiceStatRow } from "@/lib/strapi/service-page";
import { FormattedText } from "@/components/shared/formatted-text";
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
        {statsTitle && (
          <h2 className={s.title}>
            <FormattedText text={statsTitle} />
          </h2>
        )}

        <div className={`${s.tableWrap} ${s.desktopOnly}`}>
          <table className={s.table}>
            <thead>
              <tr>
                <th className={s.thLabel} />
                <th className={s.thBefore}>
                  <FormattedText text={statsColBefore ?? "До"} />
                </th>
                <th className={s.thAfter}>
                  <FormattedText text={statsColAfter ?? "После"} />
                </th>
              </tr>
            </thead>
            <tbody>
              {statsRows.map((row: ServiceStatRow) => (
                <tr key={row.id} className={s.row}>
                  <td className={s.tdLabel}>
                    <FormattedText text={row.label} />
                  </td>
                  <td className={s.tdBefore}>
                    <FormattedText text={row.valueBefore ?? ""} />
                  </td>
                  <td className={s.tdAfter}>
                    <FormattedText text={row.valueAfter ?? ""} />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <div className={s.mobileOnly}>
          <div className={s.mobileCard}>
            <h3 className={s.mobileSectionTitle}>
              <FormattedText text={statsColBefore ?? "До внедрения"} />
            </h3>
            <div className={s.mobileRows}>
              {statsRows.map((row: ServiceStatRow) => (
                <div key={`before-${row.id}`} className={s.mobileRow}>
                  <div className={s.mobileLabel}>
                    <FormattedText text={row.label} />
                  </div>
                  <div className={s.mobileValue}>
                    <FormattedText text={row.valueBefore ?? ""} />
                  </div>
                </div>
              ))}
            </div>

            <h3 className={`${s.mobileSectionTitle} ${s.mobileSectionTitleAfter}`}>
              <FormattedText text={statsColAfter ?? "После внедрения"} />
            </h3>
            <div className={s.mobileRows}>
              {statsRows.map((row: ServiceStatRow) => (
                <div key={`after-${row.id}`} className={s.mobileRow}>
                  <div className={s.mobileLabel}>
                    <FormattedText text={row.label} />
                  </div>
                  <div className={`${s.mobileValue} ${s.mobileValueAfter}`}>
                    <FormattedText text={row.valueAfter ?? ""} />
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

        {statsBottomText && (
          <p className={s.bottomText}>
            <FormattedText text={statsBottomText} />
          </p>
        )}
      </div>
    </section>
  );
}
