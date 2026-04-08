"use client";

import Image from "next/image";
import { useEffect, useMemo, useRef, useState } from "react";
import type { ServicePageData, ServiceProblemItem } from "@/lib/strapi/service-page";
import s from "./service-problem.module.css";

const RAY_ANGLES = [-76, -48, -20, 8, 36, 64];
const RAY_DISTANCES = [120, 150, 186, 186, 150, 120];
const WHEEL_THRESHOLD = 42;
const WHEEL_COOLDOWN_MS = 180;

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
  const [shift, setShift] = useState(0);
  const viewportRef = useRef<HTMLDivElement>(null);
  const wheelDeltaRef = useRef(0);
  const lastStepTsRef = useRef(0);

  if (!problemTitle && problemItems.length === 0) return null;
  if (problemItems.length === 0) return null;

  useEffect(() => {
    const el = viewportRef.current;
    if (!el || problemItems.length <= 1) return;

    const onWheel = (e: WheelEvent) => {
      if (e.cancelable) e.preventDefault();
      e.stopPropagation();

      const delta =
        e.deltaMode === WheelEvent.DOM_DELTA_LINE
          ? e.deltaY * 16
          : e.deltaMode === WheelEvent.DOM_DELTA_PAGE
            ? e.deltaY * 220
            : e.deltaY;

      wheelDeltaRef.current += delta;
      const now = Date.now();
      if (now - lastStepTsRef.current < WHEEL_COOLDOWN_MS) return;
      if (Math.abs(wheelDeltaRef.current) < WHEEL_THRESHOLD) return;

      const direction = wheelDeltaRef.current > 0 ? 1 : -1;
      setShift((prev) => prev + direction);
      wheelDeltaRef.current = 0;
      lastStepTsRef.current = now;
    };

    el.addEventListener("wheel", onWheel, { passive: false });
    return () => el.removeEventListener("wheel", onWheel as EventListener);
  }, [problemItems.length]);

  const rayItems = useMemo(() => {
    return RAY_ANGLES.map((_, slot) => {
      const logicalIndex = shift + slot;
      const index = ((logicalIndex % problemItems.length) + problemItems.length) % problemItems.length;
      return { slot, item: problemItems[index] };
    });
  }, [problemItems, shift]);

  const activeSlot = 2;

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

        <div className={s.viewport} ref={viewportRef}>
          {rayItems.map(({ slot, item }: { slot: number; item: ServiceProblemItem }) => {
            const angleDeg = RAY_ANGLES[slot];
            const angleRad = (angleDeg * Math.PI) / 180;
            const radius = RAY_DISTANCES[slot];
            const x = Math.cos(angleRad) * radius;
            const y = Math.sin(angleRad) * radius;
            const isActive = slot === activeSlot;

            return (
              <article
                key={`${slot}-${item.id}`}
                className={[s.item, isActive ? s.itemActive : s.itemInactive].join(" ")}
                style={{
                  transform: `translate(${x}px, calc(-50% + ${y}px)) rotate(${angleDeg * 0.24}deg)`,
                  opacity: isActive ? 1 : 0.52,
                }}
              >
                <h3 className={s.itemTitle}>{item.title}</h3>
                {isActive && item.description && <p className={s.itemDesc}>{item.description}</p>}
              </article>
            );
          })}
        </div>
      </div>
    </section>
  );
}
