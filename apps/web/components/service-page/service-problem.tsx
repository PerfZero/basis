"use client";

import Image from "next/image";
import gsap from "gsap";
import { useEffect, useMemo, useRef } from "react";
import type { ServicePageData, ServiceProblemItem } from "@/lib/strapi/service-page";
import s from "./service-problem.module.css";

const DEGREE_STEP = 20;
const PROBLEM_REPEAT_COUNT = 8;

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
  const scrollControlRef = useRef<HTMLDivElement | null>(null);
  const circleRef = useRef<HTMLDivElement | null>(null);
  const renderedItems = useMemo(() => {
    if (problemItems.length <= 1) return problemItems;
    const safeRepeatCount = Math.max(1, PROBLEM_REPEAT_COUNT);
    return Array.from({ length: safeRepeatCount }, () => problemItems).flat();
  }, [problemItems]);

  if (!problemTitle && problemItems.length === 0) return null;
  if (problemItems.length === 0) return null;

  useEffect(() => {
    const scrollControl = scrollControlRef.current;
    const wrapper = circleRef.current;
    if (!scrollControl || !wrapper) return;

    const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
    const radius = wrapper.offsetWidth / 2;
    const sentences = wrapper.querySelectorAll<HTMLElement>(`.${s.sentence}`);
    const sentenceCount = sentences.length;

    sentences.forEach((el, i) => {
      const angle = i * DEGREE_STEP;
      const rad = angle * (Math.PI / 180);
      const x = radius * Math.cos(rad);
      const y = radius * Math.sin(rad);

      gsap.set(el, {
        x,
        y,
        rotation: angle,
      });
    });

    if (reducedMotion || problemItems.length <= 1 || sentenceCount <= 1) {
      gsap.set(wrapper, { rotation: 0 });
      return;
    }

    gsap.set(wrapper, { rotation: 0 });
    let currentRotation = 0;

    const onWheel = (event: WheelEvent) => {
      event.preventDefault();
      currentRotation -= event.deltaY * 0.3;

      gsap.to(wrapper, {
        rotation: currentRotation,
        duration: 0.25,
        ease: "power2.out",
        overwrite: true,
      });
    };

    scrollControl.addEventListener("wheel", onWheel, { passive: false });

    return () => {
      scrollControl.removeEventListener("wheel", onWheel);
    };
  }, [problemItems.length, renderedItems.length]);

  return (
    <section className={s.sectionBackground}>
      <div className={s.paddingGlobal}>
        <div className={s.containerLarge}>
          <div className={s.onClickGeneralWrapper}>
            <div className={s.onClickWrapper}>
              <div className={s.textAlignRight} ref={scrollControlRef}>
                <div className={s.headingStyleH4}>
                  <div className={s.textColorGradient}>
                    <div className={s.textAlignLeftTablet}>
                      {problemTitle}
                      {problemTitleAccent ? <><br />{problemTitleAccent}</> : null}
                    </div>
                  </div>
                </div>
              </div>

              <div className={s.onClickIcon}>
                {problemIcon?.url ? (
                  <Image
                    src={problemIcon.url}
                    alt=""
                    width={76}
                    height={76}
                    unoptimized
                    aria-hidden
                  />
                ) : (
                  <svg viewBox="0 0 76 76" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                    <rect width="75.041" height="75.041" rx="16.9107" fill="white" />
                    <path d="M51.2086 37.6888L31.7307 30.6014C31.5726 30.5443 31.4015 30.5335 31.2374 30.5701C31.0734 30.6067 30.9231 30.6894 30.8042 30.8083C30.6854 30.9273 30.6028 31.0776 30.5662 31.2418C30.5296 31.4059 30.5404 31.5771 30.5975 31.7354L37.6803 51.2257C37.7422 51.397 37.8553 51.545 38.0042 51.6496C38.1531 51.7542 38.3306 51.8104 38.5126 51.8104C38.6899 51.8106 38.8632 51.7575 39.01 51.658C39.1568 51.5585 39.2703 51.4172 39.3359 51.2523L42.7357 42.7474L51.2352 39.3455C51.4032 39.2817 51.5478 39.1683 51.6498 39.0204C51.7519 38.8724 51.8065 38.6969 51.8065 38.5171C51.8065 38.3374 51.7519 38.1618 51.6498 38.0139C51.5478 37.8659 51.4032 37.7526 51.2352 37.6888H51.2086ZM41.7264 41.2325L41.3723 41.3742L41.2306 41.7286L38.5126 48.4439L32.9082 32.9137L48.4286 38.5216L41.7264 41.2325Z" fill="#111553" />
                  </svg>
                )}
              </div>
            </div>

            <div className={s.circleFadeWrapper}>
              <div className={s.circleFade} />
              <div className={`${s.circleFade} ${s.isBottom}`} />

              <div id="holder" className={s.circleWrapper} ref={circleRef}>
                <div className={s.wDynList}>
                  <div role="list" className={s.wDynItems}>
                    {renderedItems.map((item: ServiceProblemItem, index) => (
                      <div role="listitem" className={s.wDynItem} key={`${item.id}-${index}`}>
                        <div className={s.sentence}>
                          <div className={s.headingStyleH5}>
                            <div>{item.title}</div>
                          </div>
                          {item.description && (
                            <div className={s.textColorGray36}>
                              <div className={s.textSizeSmall}>
                                <div>{item.description}</div>
                              </div>
                            </div>
                          )}
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
