"use client";

import { useState } from "react";
import type { ServicePageData, ServiceLogicSlide } from "@/lib/strapi/service-page";
import s from "./service-logic.module.css";

type Props = Pick<NonNullable<ServicePageData>, "logicTitle" | "logicSlides">;

export function ServiceLogic({ logicTitle, logicSlides }: Props) {
  const [active, setActive] = useState(0);

  if (!logicTitle && logicSlides.length === 0) return null;

  const slide = logicSlides[active];

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

        <div className={s.content}>
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
                  <a href={item.buttonHref ?? "#"} className={s.btn}>
                    {item.buttonLabel}
                    <span className={s.btnArrow} aria-hidden>→</span>
                  </a>
                )}
              </div>
            ))}
          </div>

          {logicSlides.length > 1 && (
            <div className={s.dots}>
              {logicSlides.map((_, i) => (
                <button
                  key={i}
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
