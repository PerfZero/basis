"use client";

import Image from "next/image";
import gsap from "gsap";
import { Fragment, useEffect, useMemo, useRef, useState } from "react";
import type { ServicePageData, ServiceProblemItem } from "@/lib/strapi/service-page";
import s from "./service-problem.module.css";

const DEFAULT_DEGREE_STEP = 20;
const DESKTOP_VISIBLE_SLOTS = 18;
const WHEEL_DELTA_THRESHOLD = 40;

type Props = Pick<
  NonNullable<ServicePageData>,
  "problemTitle" | "problemIcon" | "problemItems"
>;

type HeadingPart = { text: string; accent: boolean };

function normalizeHeading(value: string): string {
  return value
    .replace(/<br\s*\/?>/gi, "\n")
    .replace(/&lt;\s*br\s*\/?\s*&gt;/gi, "\n")
    .replace(/&nbsp;/gi, " ")
    .replace(/[\u2028\u2029]/g, "\n");
}

function parseHeadingParts(value: string): HeadingPart[] {
  const normalized = normalizeHeading(value);
  const parts: HeadingPart[] = [];
  const markerRegex = /%%([^%]+)%%|\[([^\]]+)\]/g;
  let last = 0;
  let match: RegExpExecArray | null = null;

  while ((match = markerRegex.exec(normalized)) !== null) {
    if (match.index > last) {
      parts.push({ text: normalized.slice(last, match.index), accent: false });
    }

    const accentText = match[1] ?? match[2] ?? "";
    if (accentText) {
      parts.push({ text: accentText, accent: true });
    }

    last = match.index + match[0].length;
  }

  if (last < normalized.length) {
    parts.push({ text: normalized.slice(last), accent: false });
  }

  return parts.length > 0 ? parts : [{ text: normalized, accent: false }];
}

function renderTextWithBreaks(value: string, keyPrefix: string) {
  return normalizeHeading(value).split("\n").map((line, index) => (
    <Fragment key={`${keyPrefix}-${index}`}>
      {index > 0 && <br />}
      {line}
    </Fragment>
  ));
}

export function ServiceProblem({
  problemTitle,
  problemIcon,
  problemItems,
}: Props) {
  const scrollControlRef = useRef<HTMLDivElement | null>(null);
  const circleRef = useRef<HTMLDivElement | null>(null);
  const [desktopOffset, setDesktopOffset] = useState(0);

  const desktopWheelItems = useMemo(() => {
    if (problemItems.length === 0) return [];

    return Array.from({ length: DESKTOP_VISIBLE_SLOTS }, (_, slotIndex) => {
      const itemIndex = (slotIndex + desktopOffset) % problemItems.length;
      return problemItems[itemIndex];
    });
  }, [problemItems, desktopOffset]);

  useEffect(() => {
    if (problemItems.length === 0) {
      setDesktopOffset(0);
      return;
    }

    setDesktopOffset((current) => {
      const normalized = ((current % problemItems.length) + problemItems.length) % problemItems.length;
      return normalized;
    });
  }, [problemItems.length]);

  const headingParts = problemTitle ? parseHeadingParts(problemTitle) : [];

  if (!problemTitle && problemItems.length === 0) return null;
  if (problemItems.length === 0) return null;

  useEffect(() => {
    const scrollControl = scrollControlRef.current;
    const wrapper = circleRef.current;
    if (!scrollControl || !wrapper) return;

    const isMobileViewport = window.matchMedia("(max-width: 991px)").matches;
    if (isMobileViewport) return;

    const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
    const radius = wrapper.offsetWidth / 2;
    if (radius <= 0) return;

    const sentences = wrapper.querySelectorAll<HTMLElement>(`.${s.sentence}`);
    const sentenceCount = sentences.length;
    const angleStep = sentenceCount > 0 ? 360 / sentenceCount : DEFAULT_DEGREE_STEP;

    sentences.forEach((el, i) => {
      const angle = i * angleStep;
      const rad = angle * (Math.PI / 180);
      const x = radius * Math.cos(rad);
      const y = radius * Math.sin(rad);

      gsap.set(el, {
        x,
        y,
        rotation: angle,
      });
    });

    const applyRotation = (rotation: number, animate: boolean) => {
      const update = animate ? gsap.to : gsap.set;

      update(wrapper, {
        rotation,
        ...(animate
          ? {
              duration: 0.25,
              ease: "power2.out",
              overwrite: true,
            }
          : {}),
      });
    };

    if (reducedMotion || problemItems.length <= 1 || sentenceCount <= 1) {
      applyRotation(0, false);
      return;
    }

    let currentStep = 0;
    let wheelDeltaBuffer = 0;
    applyRotation(currentStep * angleStep, false);

    const onWheel = (event: WheelEvent) => {
      event.preventDefault();
      wheelDeltaBuffer += event.deltaY;
      if (Math.abs(wheelDeltaBuffer) < WHEEL_DELTA_THRESHOLD) return;

      const direction = wheelDeltaBuffer > 0 ? 1 : -1;
      wheelDeltaBuffer = 0;
      currentStep += direction;
      setDesktopOffset((current) => {
        if (problemItems.length === 0) return 0;
        const next = current + direction;
        return ((next % problemItems.length) + problemItems.length) % problemItems.length;
      });
      applyRotation(currentStep * angleStep, true);
    };

    scrollControl.addEventListener("wheel", onWheel, { passive: false });

    return () => {
      scrollControl.removeEventListener("wheel", onWheel);
    };
  }, [problemItems.length, desktopWheelItems.length]);

  return (
    <section className={s.sectionBackground}>
      <div className={s.paddingGlobal}>
        <div className={s.containerLarge}>
          <div className={s.onClickGeneralWrapper}>
            <div className={s.onClickWrapper}>
              <div className={s.textAlignRight}>
                <div className={s.headingStyleH4}>
                  <div className={s.textColorGradient}>
                    <div className={s.textAlignLeftTablet}>
                      {headingParts.map((part, index) =>
                        part.accent ? (
                          <span key={`accent-${index}`} className={s.titleAccent}>
                            {renderTextWithBreaks(part.text, `accent-${index}`)}
                          </span>
                        ) : (
                          <span key={`plain-${index}`}>
                            {renderTextWithBreaks(part.text, `plain-${index}`)}
                          </span>
                        ),
                      )}
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

            <div className={`${s.circleFadeWrapper} ${s.desktopOnly}`}>
              <div className={s.circleFade} />
              <div className={`${s.circleFade} ${s.isBottom}`} />

              <div id="holder" className={s.circleWrapper} ref={circleRef}>
                <div className={s.wDynList}>
                  <div role="list" className={s.wDynItems}>
                    {desktopWheelItems.map((item: ServiceProblemItem, index) => (
                      <div role="listitem" className={s.wDynItem} key={`slot-${index}`}>
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

            <div
              className={`${s.wheelZone} ${s.desktopOnly}`}
              ref={scrollControlRef}
              aria-hidden="true"
            />

            <div className={s.mobileOnly}>
              <div className={s.mobileList} role="list">
                {problemItems.map((item: ServiceProblemItem, index) => (
                  <article
                    key={`${item.id}-${index}`}
                    role="listitem"
                    className={s.mobileItem}
                  >
                    <h3 className={s.mobileSentenceTitle}>{item.title}</h3>
                    {item.description && (
                      <p className={s.mobileSentenceDescription}>{item.description}</p>
                    )}
                  </article>
                ))}
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
