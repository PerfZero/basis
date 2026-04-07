"use client";

import Image from "next/image";
import { useState } from "react";
import type { ServicePageData, ServiceProblemItem } from "@/lib/strapi/service-page";
import s from "./service-problem.module.css";

const ITEM_H  = 160;
const TILT    = 14;

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
  const [active, setActive] = useState(Math.floor(problemItems.length / 2));

  if (!problemTitle && problemItems.length === 0) return null;

  return (
    <section className={s.section}>
      <div className={s.container}>

        <div className={s.left}>
          <h2 className={s.title}>
            {problemTitle && <span>{problemTitle}</span>}
            {problemTitleAccent && (
              <span className={s.titleAccent}> {problemTitleAccent}</span>
            )}
          </h2>
          {problemIcon?.url && (
            <div className={s.titleIcon}>
              <Image src={problemIcon.url} alt="" width={36} height={36} unoptimized aria-hidden className={s.titleIconImg} />
            </div>
          )}
        </div>

        <div className={s.viewport}>
          {problemItems.map((item: ServiceProblemItem, index: number) => {
            const offset   = index - active;
            const isActive = offset === 0;
            const tiltDeg  = offset * TILT;
            const translateY = offset * ITEM_H;
            const opacity  = Math.max(0.15, 1 - Math.abs(offset) * 0.42);

            return (
              <article
                key={item.id}
                className={[s.item, isActive ? s.itemActive : s.itemInactive].join(" ")}
                style={{
                  transform: `translateY(calc(-50% + ${translateY}px)) rotateZ(${tiltDeg}deg)${isActive ? " translateX(20px)" : ""}`,
                  opacity,
                  zIndex: problemItems.length - Math.abs(offset),
                }}
                onClick={() => setActive(index)}
                role="button"
                tabIndex={0}
                onKeyDown={(e) => e.key === "Enter" && setActive(index)}
              >
                <h3 className={s.itemTitle}>{item.title}</h3>
                {item.description && (
                  <p className={s.itemDesc}>{item.description}</p>
                )}
              </article>
            );
          })}
        </div>

      </div>
    </section>
  );
}
