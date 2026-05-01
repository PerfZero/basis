"use client";

import { useState } from "react";
import type { ServicePageData, ServiceAutoTab } from "@/lib/strapi/service-page";
import { DiagnosticTriggerButton } from "@/components/shared/diagnostic-trigger-button";
import { FormattedText } from "@/components/shared/formatted-text";
import s from "./service-auto.module.css";

type Props = Pick<NonNullable<ServicePageData>, "autoTitle" | "autoTabs">;

export function ServiceAuto({ autoTitle, autoTabs }: Props) {
  const [active, setActive] = useState(0);

  if (!autoTitle && autoTabs.length === 0) return null;

  const tab = autoTabs[active];

  return (
    <section className={s.section}>
      {autoTitle && (
        <h2 className={s.title}>
          <FormattedText text={autoTitle} />
        </h2>
      )}

      <div className={s.card}>
        <div className={s.tabs}>
          {autoTabs.map((t: ServiceAutoTab, i: number) => (
            <button
              key={t.id}
              className={[s.tab, i === active ? s.tabActive : ""].join(" ")}
              onClick={() => setActive(i)}
            >
              <FormattedText text={t.label} />
              <span className={s.tabDivider} />
            </button>
          ))}
        </div>

        <div className={s.body}>
          <div className={s.left}>
            {tab?.subtitle && (
              <h3 className={s.subtitle}>
                <FormattedText text={tab.subtitle} />
              </h3>
            )}
            {tab?.challenge && (
              <p className={s.challenge}>
                <span className={s.challengeLabel}>Вызов:</span>{" "}
                <FormattedText text={tab.challenge} />
              </p>
            )}
            {tab?.feature && (
              <div className={s.feature}>
                <span className={s.featureIcon} aria-hidden>
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fillRule="evenodd" clipRule="evenodd" d="M10 1.25H9.966C8.595 1.25 7.519 1.25 6.655 1.32C5.775 1.393 5.048 1.541 4.39 1.877C3.30799 2.42829 2.42829 3.30799 1.877 4.39C1.541 5.048 1.393 5.775 1.321 6.655C1.25 7.519 1.25 8.595 1.25 9.966V14.034C1.25 15.405 1.25 16.481 1.32 17.345C1.393 18.225 1.541 18.952 1.877 19.61C2.42829 20.692 3.30799 21.5717 4.39 22.123C5.048 22.459 5.775 22.607 6.655 22.679C7.519 22.75 8.595 22.75 9.966 22.75H16.08C16.933 22.75 17.452 22.75 17.9 22.68C19.0994 22.4901 20.2079 21.9253 21.0666 21.0666C21.9253 20.2079 22.4901 19.0994 22.68 17.9C22.75 17.452 22.75 16.933 22.75 16.08V15C22.75 14.8011 22.671 14.6103 22.5303 14.4697C22.3897 14.329 22.1989 14.25 22 14.25C21.8011 14.25 21.6103 14.329 21.4697 14.4697C21.329 14.6103 21.25 14.8011 21.25 15V16C21.25 16.958 21.248 17.35 21.198 17.665C21.0576 18.5515 20.6402 19.3708 20.0055 20.0055C19.3708 20.6402 18.5515 21.0576 17.665 21.198C17.349 21.248 16.958 21.25 16 21.25H10C8.587 21.25 7.573 21.25 6.777 21.184C5.99 21.12 5.482 20.996 5.071 20.787C4.27111 20.3797 3.62069 19.7297 3.213 18.93C3.003 18.518 2.88 18.01 2.816 17.223C2.751 16.427 2.75 15.413 2.75 14V10C2.75 8.587 2.75 7.573 2.816 6.777C2.88 5.99 3.004 5.482 3.213 5.071C3.62052 4.27095 4.27095 3.62052 5.071 3.213C5.482 3.003 5.99 2.88 6.777 2.816C7.573 2.751 8.587 2.75 10 2.75H15C15.1989 2.75 15.3897 2.67098 15.5303 2.53033C15.671 2.38968 15.75 2.19891 15.75 2C15.75 1.80109 15.671 1.61032 15.5303 1.46967C15.3897 1.32902 15.1989 1.25 15 1.25H10ZM21.53 6.53C21.6625 6.38783 21.7346 6.19978 21.7312 6.00548C21.7277 5.81118 21.649 5.62579 21.5116 5.48838C21.3742 5.35097 21.1888 5.27225 20.9945 5.26883C20.8002 5.2654 20.6122 5.33752 20.47 5.47L11.966 13.974L8.494 10.936C8.42041 10.8681 8.33398 10.8157 8.2398 10.7818C8.14562 10.7478 8.0456 10.7331 7.94563 10.7384C7.84567 10.7438 7.74778 10.769 7.65775 10.8128C7.56771 10.8566 7.48734 10.9179 7.42139 10.9932C7.35543 11.0685 7.30521 11.1563 7.2737 11.2513C7.24219 11.3463 7.23002 11.4466 7.2379 11.5464C7.24579 11.6462 7.27357 11.7434 7.31962 11.8323C7.36566 11.9212 7.42903 12 7.506 12.064L11.506 15.564C11.6492 15.6893 11.8346 15.7554 12.0247 15.7491C12.2148 15.7428 12.3955 15.6645 12.53 15.53L21.53 6.53Z" fill="url(#paint0_linear_284_1690)" />
                    <defs>
                      <linearGradient id="paint0_linear_284_1690" x1="3.5" y1="1" x2="20.5" y2="23" gradientUnits="userSpaceOnUse">
                        <stop stopColor="#0B7A66" />
                        <stop offset="1" stopColor="#6DAFA3" />
                      </linearGradient>
                    </defs>
                  </svg>
                </span>
                <p className={s.featureText}>
                  <FormattedText text={tab.feature} />
                </p>
              </div>
            )}
            {tab?.buttonLabel && (
              <DiagnosticTriggerButton className={s.btn} dataTargetHref={tab.buttonHref ?? "#contact"}>
                <FormattedText text={tab.buttonLabel} />
                <span className={s.btnArrow} aria-hidden>
                  <svg width="13" height="8" viewBox="0 0 13 8" fill="none">
                    <path d="M0.5 3.18201C0.223858 3.18201 0 3.40586 0 3.68201C0 3.95815 0.223858 4.18201 0.5 4.18201V3.68201V3.18201ZM12.8536 4.03556C13.0488 3.8403 13.0488 3.52371 12.8536 3.32845L9.67157 0.146472C9.47631-0.04879 9.15973-0.04879 8.96447 0.146472C8.7692 0.341734 8.7692 0.658317 8.96447 0.853579L11.7929 3.68201L8.96447 6.51043C8.7692 6.7057 8.7692 7.02228 8.96447 7.21754C9.15973 7.4128 9.47631 7.4128 9.67157 7.21754L12.8536 4.03556ZM0.5 3.68201V4.18201H12.5V3.68201V3.18201H0.5V3.68201Z" fill="currentColor"/>
                  </svg>
                </span>
              </DiagnosticTriggerButton>
            )}
          </div>

          <div className={s.right}>
            {tab?.image?.url && (
              // eslint-disable-next-line @next/next/no-img-element
              <img src={tab.image.url} alt={tab.subtitle ?? ""} className={s.image} />
            )}
          </div>
        </div>
      </div>
    </section>
  );
}
