import Image from "next/image";
import s from "./about-hero.module.css";
import type { AboutPageData } from "@/lib/strapi/about-page";
const FALLBACK_BG =
  "https://images.unsplash.com/photo-1591980607210-8ea99bee96f0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDM0ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NzU0NjQwMDV8&ixlib=rb-4.1.0&q=80&w=1080";

type Principle = {
  id: number;
  badge?: string;
  title?: string;
  paragraph1?: string;
  paragraph2?: string;
};

type AboutData = AboutPageData;

function renderAccentTextByClass(text: string, accentClass: string) {
  const lines = text.split(/<br\s*\/?>|\n/gi);

  return lines.flatMap((line, lineIndex) => {
    const parts = line.split(/(\[[^\]]+\])/g).filter(Boolean);
    const rendered = parts.map((part, partIndex) => {
      if (part.startsWith("[") && part.endsWith("]")) {
        return (
          <span key={`accent-${lineIndex}-${partIndex}`} className={accentClass}>
            {part.slice(1, -1)}
          </span>
        );
      }

      return <span key={`plain-${lineIndex}-${partIndex}`}>{part}</span>;
    });

    if (lineIndex < lines.length - 1) {
      rendered.push(<br key={`br-${lineIndex}`} />);
    }

    return rendered;
  });
}

const FALLBACK_PRINCIPLES: Principle[] = [
  {
    id: 1,
    badge: "Принцип 1",
    title: "Сначала — диагностика",
    paragraph1: "Не предлагаем решения без понимания задачи. Каждый проект начинается с глубокого аудита процессов.",
    paragraph2: "Вы получаете решение, которое действительно устраняет вашу боль, а не красивую демку.",
  },
  {
    id: 2,
    badge: "Принцип 2",
    title: "Инженерная точность",
    paragraph1: "Проектируем архитектуру до написания первой строки кода. Строгий технологический нейтралитет.",
    paragraph2: "Системы, которые работают под нагрузкой и не требуют переработки через год.",
  },
  {
    id: 3,
    badge: "Принцип 3",
    title: "Полевое мышление",
    paragraph1: "Проектируем не для «пользователей», а для живых людей с конкретными рабочими ситуациями.",
    paragraph2: "Интерфейсы, которые реально используются, а не саботируются сотрудниками.",
  },
];

export function AboutHero({ data }: { data: AboutData }) {
  const bgUrl = data?.backgroundImage?.url
    ? data.backgroundImage.url
    : FALLBACK_BG;

  const principles = (data?.principles && data.principles.length > 0)
    ? data.principles
    : FALLBACK_PRINCIPLES;

  return (
    <>
      <section className={s.hero}>
        <div className={s.container}>
          <p className={s.eyebrow}>{data?.eyebrow ?? "О компании"}</p>
          <span className={s.divider} />

          <h1 className={s.heading}>
            <span>{renderAccentTextByClass(data?.heading ?? "Инженерное [бюро] [BasisThree]", s.headingAccent)}</span>
          </h1>

          <p className={s.description}>
            {data?.description ?? "Мы ценим личное общение и глубокое погружение в задачу. Если ваш бизнес требует инженерного подхода к автоматизации — мы готовы к диалогу."}
          </p>

          <div className={s.locations}>
            <span className={s.locationItem}>
              {data?.badge1Icon?.url ? (
                <Image
                  src={data.badge1Icon.url}
                  alt=""
                  width={16}
                  height={16}
                  unoptimized
                  className={s.locationIcon}
                  aria-hidden="true"
                />
              ) : (
                <span className={s.locationDot} aria-hidden="true" />
              )}
              <span className={s.locationText}>
                {data?.badge1Text ?? "САНКТ-ПЕТЕРБУРГ"}
              </span>
            </span>
            <span className={s.locationItem}>
              {data?.badge2Icon?.url ? (
                <Image
                  src={data.badge2Icon.url}
                  alt=""
                  width={16}
                  height={16}
                  unoptimized
                  className={s.locationIcon}
                  aria-hidden="true"
                />
              ) : (
                <span className={s.locationDot} aria-hidden="true" />
              )}
              <span className={s.locationText}>
                {data?.badge2Text ?? "РАБОТАЕМ ПО ВСЕЙ РОССИИ"}
              </span>
            </span>
          </div>
        </div>
      </section>

      <section
        className={s.principlesSection}
      >
        <div className={s.principlesCard} style={{ backgroundImage: `url(${bgUrl})` }}>
          <div className={s.principlesOverlay} />
          <div className={s.principlesContent}>
            <h2 className={s.principlesTitle}>
              {data?.sectionTitle ?? "«Цифровой фундамент»"}
            </h2>
            <div className={s.principlesGrid}>
              {principles.map((p) => (
                <article key={p.id} className={s.principle}>
                  {p.badge && <span className={s.principleBadge}>{p.badge}</span>}
                  <h3 className={s.principleTitle}>{p.title}</h3>
                  {p.paragraph1 && <p className={s.principleTextPrimary}>{p.paragraph1}</p>}
                  <span className={s.principleDivider} />

                  {p.paragraph2 && <p className={s.principleTextSecondary}>{p.paragraph2}</p>}
                </article>
              ))}
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
