"use client";

import Image from "next/image";
import { type CSSProperties, useEffect, useState } from "react";
import type { ServicePageData, ServiceProblemItem } from "@/lib/strapi/service-page";
import s from "./service-problem.module.css";

const WORD_SWITCH_MS = 1000;

type Props = Pick<
  NonNullable<ServicePageData>,
  "problemTitle" | "problemTitleAccent" | "problemIcon" | "problemItems"
>;

export function ServiceProblem({
  problemTitle,
  problemTitleAccent,
  problemIcon,
  problemItems,
}: Props) {
  const [activeIndex, setActiveIndex] = useState(0);

  if (!problemTitle && problemItems.length === 0) return null;
  if (problemItems.length === 0) return null;

  useEffect(() => {
    if (problemItems.length <= 1) return;
    const timer = window.setInterval(() => {
      setActiveIndex((prev) => (prev + 1) % problemItems.length);
    }, WORD_SWITCH_MS);
    return () => window.clearInterval(timer);
  }, [problemItems.length]);

  const activeItem: ServiceProblemItem = problemItems[activeIndex] ?? problemItems[0];
  const orbitCount = Math.max(problemItems.length, 1);

  return (
    <section className={s.section}>
      <div className={s.container}>
        <div className={s.left}>
          <h2 className={s.title}>
            {problemTitle && <span>{problemTitle}</span>}
            {problemTitleAccent && <span className={s.titleAccent}> {problemTitleAccent}</span>}
          </h2>
          {problemIcon?.url && (
            <div className={s.titleIcon}>
              <Image
                src={problemIcon.url}
                alt=""
                width={36}
                height={36}
                unoptimized
                aria-hidden
                className={s.titleIconImg}
              />
            </div>
          )}
        </div>

        <div className={s.viewport}>
          <div className={s.orbitStage}>
            <div className={s.orbit} aria-hidden="true">
              {problemItems.map((item: ServiceProblemItem, index: number) => {
                const style = {
                  "--index": index,
                  "--count": orbitCount,
                } as CSSProperties;
                return (
                  <span key={item.id} className={s.orbitWord} style={style}>
                    {item.title}
                  </span>
                );
              })}
            </div>
            <article className={s.centerCard}>
              <h3 className={s.itemTitle}>{activeItem.title}</h3>
              {activeItem.description && <p className={s.itemDesc}>{activeItem.description}</p>}
            </article>
          </div>

          <div className={s.mobileList}>
            {problemItems.map((item: ServiceProblemItem) => (
              <article key={item.id} className={s.mobileItem}>
                <h3 className={s.itemTitle}>{item.title}</h3>
                {item.description && <p className={s.itemDesc}>{item.description}</p>}
              </article>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
