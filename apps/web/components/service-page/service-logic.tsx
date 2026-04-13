"use client";

import { useEffect, useRef, useState, type TouchEventHandler } from "react";
import type { ServicePageData, ServiceLogicSlide } from "@/lib/strapi/service-page";
import { DiagnosticTriggerButton } from "@/components/shared/diagnostic-trigger-button";
import s from "./service-logic.module.css";

type Props = Pick<NonNullable<ServicePageData>, "logicTitle" | "logicSlides">;

export function ServiceLogic({ logicTitle, logicSlides }: Props) {
  const [active, setActive] = useState(0);
  const contentRef = useRef<HTMLDivElement>(null);
  const wheelDeltaRef = useRef(0);
  const lastStepTsRef = useRef(0);
  const touchStartRef = useRef<{ x: number; y: number } | null>(null);

  if (!logicTitle && logicSlides.length === 0) return null;
  if (logicSlides.length === 0) return null;

  useEffect(() => {
    setActive((prev) => {
      if (logicSlides.length === 0) return 0;
      return ((prev % logicSlides.length) + logicSlides.length) % logicSlides.length;
    });
  }, [logicSlides.length]);

  useEffect(() => {
    const el = contentRef.current;
    if (!el || logicSlides.length <= 1) return;

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
      const threshold = 40;
      const cooldownMs = 170;

      if (now - lastStepTsRef.current < cooldownMs) return;
      if (Math.abs(wheelDeltaRef.current) < threshold) return;

      const dir = wheelDeltaRef.current > 0 ? 1 : -1;
      setActive((prev) => (prev + dir + logicSlides.length) % logicSlides.length);
      wheelDeltaRef.current = 0;
      lastStepTsRef.current = now;
    };

    el.addEventListener("wheel", onWheel, { passive: false });
    return () => el.removeEventListener("wheel", onWheel as EventListener);
  }, [logicSlides.length]);

  const slide = logicSlides[active];
  const changeSlide = (direction: 1 | -1) => {
    setActive((prev) => (prev + direction + logicSlides.length) % logicSlides.length);
  };

  const onTouchStart: TouchEventHandler<HTMLDivElement> = (event) => {
    const touch = event.touches[0];
    if (!touch) return;
    touchStartRef.current = { x: touch.clientX, y: touch.clientY };
  };

  const onTouchEnd: TouchEventHandler<HTMLDivElement> = (event) => {
    const start = touchStartRef.current;
    touchStartRef.current = null;
    if (!start || logicSlides.length <= 1) return;

    const touch = event.changedTouches[0];
    if (!touch) return;

    const dx = touch.clientX - start.x;
    const dy = touch.clientY - start.y;
    const absDx = Math.abs(dx);
    const absDy = Math.abs(dy);
    const threshold = 42;

    if (absDx < threshold && absDy < threshold) return;

    if (absDx >= absDy) {
      changeSlide(dx < 0 ? 1 : -1);
      return;
    }

    changeSlide(dy < 0 ? 1 : -1);
  };

  const onTouchCancel: TouchEventHandler<HTMLDivElement> = () => {
    touchStartRef.current = null;
  };

  return (
    <section className={s.section}>
      {logicTitle && <h2 className={s.title}>{logicTitle}</h2>}

      <div className={s.container}>
        <div className={s.imageWrap}>
          {slide?.image?.url && (
            // eslint-disable-next-line @next/next/no-img-element
            <img src={slide.image.url} alt={slide.title} className={s.image} />
          )}
        </div>

        <div
          className={s.content}
          ref={contentRef}
          onTouchStart={onTouchStart}
          onTouchEnd={onTouchEnd}
          onTouchCancel={onTouchCancel}
        >
          <div className={s.slides}>
            {logicSlides.map((item: ServiceLogicSlide, i: number) => (
              <div
                key={item.id}
                className={[s.slide, i === active ? s.slideActive : ""].join(" ")}
              >
                <h3 className={s.slideTitle}>{item.title}</h3>
                {item.description && (
                  <p className={s.slideDesc}>{item.description}</p>
                )}
                {item.buttonLabel && (
                  <DiagnosticTriggerButton className={s.btn} dataTargetHref={item.buttonHref ?? "#contact"}>
                    {item.buttonLabel}
                    <span className={s.btnArrow} aria-hidden>→</span>
                  </DiagnosticTriggerButton>
                )}
              </div>
            ))}
          </div>

          {logicSlides.length > 1 && (
            <div className={s.dots}>
              {logicSlides.map((_, i) => (
                <button
                  key={i}
                  type="button"
                  className={[s.dot, i === active ? s.dotActive : ""].join(" ")}
                  onClick={() => setActive(i)}
                  aria-label={`Слайд ${i + 1}`}
                />
              ))}
            </div>
          )}
        </div>
      </div>
    </section>
  );
}
