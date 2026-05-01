import Image from "next/image";
import type { TeamSectionData } from "@/lib/strapi/team";
import { DiagnosticTriggerButton } from "@/components/shared/diagnostic-trigger-button";
import { FormattedText } from "@/components/shared/formatted-text";
import { AboutRequestForm } from "./about-request-form.client";
import s from "./team-form-section.module.css";

type ContactBlockData = {
  workTitle?: string;
  workLabel?: string;
  workValue?: string;
  workIconUrl?: string;
  docsTitle?: string;
  docsPhoneLabel?: string;
  docsPhoneValue?: string;
  docsEmailLabel?: string;
  docsEmailValue?: string;
  docsIconUrl?: string;
  coffeeTitle?: string;
  coffeeText?: string;
  coffeeButtonLabel?: string;
  coffeeImageUrl?: string;
};

type TeamFormSectionProps = TeamSectionData & {
  contactBlock?: ContactBlockData;
};

export function TeamFormSection({
  heading,
  subheading,
  members,
  contactBlock,
}: TeamFormSectionProps) {
  const visibleMembers = members.slice(0, 3);
  if (visibleMembers.length === 0) return null;
  const docsContact = visibleMembers[0];
  const docsPhone =
    contactBlock?.docsPhoneValue || docsContact?.phone || "+7 495 555 66 77";
  const docsEmail =
    contactBlock?.docsEmailValue || docsContact?.email || "info@basisthree.ru";
  const coffeeImageStyle = contactBlock?.coffeeImageUrl
    ? { backgroundImage: `url(${contactBlock.coffeeImageUrl})` }
    : undefined;

  return (
    <section className={s.section}>
      <div className={s.inner}>
        <header className={s.header}>
          <h2 className={s.heading}>
            <FormattedText text={heading} />
          </h2>
          {subheading && (
            <p className={s.subheading}>
              <FormattedText text={subheading} />
            </p>
          )}
        </header>

        <div className={s.contentRow}>
          <div className={s.cardsCol}>
            {visibleMembers.map((member) => (
              <article key={member.id} className={s.card}>
                <div className={s.watermark} aria-hidden="true">
                  <Image
                    src="/watermark.png"
                    alt=""
                    width={220}
                    height={120}
                    className={s.watermarkImg}
                  />
                </div>
                <div className={s.cardInfo}>
                  {/* mobile: flex row (text left, qr right); desktop: transparent wrapper */}
                  <div className={s.cardBody}>
                    <div className={s.cardText}>
                      <p className={s.role}>
                        <FormattedText text={member.role} />
                      </p>
                      <h3 className={s.name}>
                        <FormattedText text={member.name} />
                      </h3>
                      <span className={s.line} />
                      {member.description && (
                        <p className={s.description}>
                          <FormattedText text={member.description} />
                        </p>
                      )}
                    </div>
                    {/* QR shown on mobile only */}
                    <div className={s.cardQrMobile} aria-hidden="true">
                      {member.contactHandle && (
                        <p className={s.handle}>{member.contactHandle}</p>
                      )}
                      {member.qrCodeUrl ? (
                        <Image
                          src={member.qrCodeUrl}
                          alt={`QR ${member.name}`}
                          width={72}
                          height={72}
                          unoptimized
                          className={s.qrImage}
                        />
                      ) : null}
                    </div>
                  </div>

                  <div className={s.spacer} />

                  {/* contact info */}
                  <div className={s.cardContact}>
                    <p className={s.contactLabel}>связаться</p>
                    <p className={s.phone}>{member.phone}</p>
                    {member.email && (
                      <a href={`mailto:${member.email}`} className={s.email}>
                        {member.email}
                      </a>
                    )}
                  </div>

                  {/* QR shown on desktop only */}
                  <div className={s.cardQrDesktop}>
                    {member.contactHandle && (
                      <p className={s.handle}>{member.contactHandle}</p>
                    )}
                    {member.qrCodeUrl ? (
                      <Image
                        src={member.qrCodeUrl}
                        alt={`QR ${member.name}`}
                        width={94}
                        height={94}
                        unoptimized
                        className={s.qrImage}
                      />
                    ) : (
                      <div className={s.qrPlaceholder} aria-hidden="true" />
                    )}
                  </div>
                </div>

                <div className={s.photoWrap}>
                  {member.photoUrl ? (
                    <Image
                      src={member.photoUrl}
                      alt={member.name}
                      fill
                      unoptimized
                      className={s.photo}
                      sizes="(max-width: 1100px) 100vw, 280px"
                    />
                  ) : (
                    <div className={s.photoFallback} />
                  )}
                  <span className={s.photoFade} />
                </div>
              </article>
            ))}
          </div>

          <div className={s.formCol}>
            <h3 className={s.formTitle}>ОПИШИТЕ ВАШ ТЕХНОЛОГИЧЕСКИЙ ВЫЗОВ</h3>
            <AboutRequestForm />
          </div>
        </div>

        <div className={s.contactCards} id="contact">
          <div className={s.contactTopRow}>
            <article className={s.workCard}>
              <div className={s.cornerTab} aria-hidden="true">
                {contactBlock?.workIconUrl && (
                  <Image
                    src={contactBlock.workIconUrl}
                    alt=""
                    width={16}
                    height={16}
                    unoptimized
                    className={s.cornerIcon}
                  />
                )}
              </div>
              <h3 className={s.contactCardTitle}>
                <FormattedText text={contactBlock?.workTitle || "Режим работы"} />
              </h3>
              <div className={s.contactSpacer} />
              <p className={s.contactLabel}>
                <FormattedText text={contactBlock?.workLabel || "Мы работаем в ритме бизнеса:"} />
              </p>
              <p className={s.contactValue}>
                <FormattedText text={contactBlock?.workValue || "Пн - Пт, 10:00 - 18:00"} />
              </p>
            </article>

            <article className={s.docsCard}>
              <div className={s.cornerTabLight} aria-hidden="true">
                {contactBlock?.docsIconUrl && (
                  <Image
                    src={contactBlock.docsIconUrl}
                    alt=""
                    width={16}
                    height={16}
                    unoptimized
                    className={s.cornerIcon}
                  />
                )}
              </div>
              <h3 className={s.contactCardTitleLight}>
                <FormattedText text={contactBlock?.docsTitle || "Для документов"} />
              </h3>
              <div className={s.contactSpacer} />
              <div className={s.docsRow}>
                <div className={s.docsCol}>
                  <p className={s.docsLabel}>
                    <FormattedText text={contactBlock?.docsPhoneLabel || "Телефон"} />
                  </p>
                  <p className={s.docsValue}>
                    <FormattedText text={docsPhone} />
                  </p>
                </div>
                <div className={s.docsCol}>
                  <p className={s.docsLabel}>
                    <FormattedText text={contactBlock?.docsEmailLabel || "Эл. почта"} />
                  </p>
                  <p className={s.docsValue}>
                    <FormattedText text={docsEmail} />
                  </p>
                </div>
              </div>
            </article>
          </div>

          <article className={s.coffeeCard}>
            <div className={s.coffeeContent}>
              <h3 className={s.coffeeTitle}>
                <FormattedText text={contactBlock?.coffeeTitle || "Начнем с кофе"} />
              </h3>
              <p className={s.coffeeText}>
                <FormattedText
                  text={
                    contactBlock?.coffeeText ||
                    "Если вы в Петербурге - приглашаем на личную встречу для обсуждения архитектуры вашего проекта"
                  }
                />
              </p>
            </div>
            <div className={s.coffeeMedia} style={coffeeImageStyle}>
              <DiagnosticTriggerButton className={s.coffeeButton}>
                <span>
                  <FormattedText text={contactBlock?.coffeeButtonLabel || "Договориться о встрече"} />
                </span>
                <span className={s.coffeeButtonCircle} aria-hidden="true">
                  →
                </span>
              </DiagnosticTriggerButton>
            </div>
          </article>
        </div>
      </div>
    </section>
  );
}
