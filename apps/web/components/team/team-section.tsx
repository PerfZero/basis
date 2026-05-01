import Image from "next/image";
import type { TeamSectionData } from "@/lib/strapi/team";
import { FormattedText } from "@/components/shared/formatted-text";
import s from "./team-section.module.css";

export function TeamSection({ heading, subheading, members }: TeamSectionData) {
  if (members.length === 0) return null;

  return (
    <section className={s.section}>
      <div className={s.inner}>
        <div className={s.header}>
          <h2 className={s.heading}>
            <FormattedText text={heading} />
          </h2>
          {subheading && (
            <p className={s.subheading}>
              <FormattedText text={subheading} />
            </p>
          )}
        </div>

        <div className={s.grid}>
          {members.map((member) => (
            <div key={member.id} className={s.card}>
              <div className={s.watermark} aria-hidden>
                <Image src="/watermark.png" alt="" width={220} height={120} className={s.watermarkImg} />
              </div>


              {member.photoUrl && (
                <div className={s.warpper}>
                <Image src={member.photoUrl} alt={member.name} width={290} height={370} unoptimized className={s.photo} sizes="(max-width: 768px) 100vw, 355px" />
             </div>
                )}

              <div className={s.cardBottom}>
                <p className={s.role}>
                  <FormattedText text={member.role} />
                </p>
                <p className={s.name}>
                  <FormattedText text={member.name} />
                </p>
                {member.description && (
                  <p className={s.description}>
                    <FormattedText text={member.description} />
                  </p>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
