import Image from "next/image";
import type { StatsBlockData, PhotoCard, StatCard } from "@/lib/strapi/stats-block";
import { FormattedText } from "@/components/shared/formatted-text";
import s from "./stats-section.module.css";

const FALLBACK_ICONS = [<IconBoxes key="boxes" />, <IconBars key="bars" />, <IconRuble key="ruble" />];

export function StatsSection({ cards }: StatsBlockData) {
  let statIndex = 0;
  return (
    <section className={s.section}>
      <div className={s.grid}>
        {cards.map((card) => {
          if (card.__component === "blocks.photo-card") {
            return <PhotoCardItem key={`photo-${card.id}`} card={card} />;
          }
          const icon = FALLBACK_ICONS[statIndex % FALLBACK_ICONS.length];
          statIndex++;
          return <StatCardItem key={`stat-${card.id}`} card={card} icon={icon} />;
        })}
      </div>
    </section>
  );
}

function PhotoCardItem({ card }: { card: PhotoCard }) {
  return (
    <div className={s.photoCard}>
      {card.photoUrl && (
        <Image src={card.photoUrl} alt={card.alt || "Фото"} fill unoptimized className="object-cover object-center" sizes="266px" />
      )}
    </div>
  );
}

function StatCardItem({ card, icon }: { card: StatCard; icon: React.ReactNode }) {
  return (
    <div className={s.statCard}>
      <p className={s.statValue}>
        <FormattedText text={card.value} />
        <span className={s.statArrow}>
          <svg width="5" height="7" viewBox="0 0 5 7" fill="none">
            <path d="M4.52034 2.99752L2.43594 0.08408C2.41731 0.0581144 2.39277 0.0369494 2.36436 0.0223305C2.33594 0.00771158 2.30445 5.76692e-05 2.2725 0C2.24042 6.70182e-05 2.20834 0.00778883 2.17984 0.0225238C2.15134 0.0372588 2.12678 0.0585814 2.10818 0.08472L0.0372176 2.99816C0.0157829 3.02827 0.0030742 3.06371 0.000491087 3.10058C-0.00209202 3.13745 0.00555081 3.17432 0.0225777 3.20712C0.0394911 3.23997 0.0651398 3.26751 0.0967005 3.28672C0.128261 3.30593 0.16451 3.31606 0.201458 3.316H1.1761L1.17602 5.93272C1.17601 5.95915 1.18121 5.98533 1.19132 6.00975C1.20143 6.03417 1.21626 6.05635 1.23495 6.07504C1.25365 6.09373 1.27584 6.10855 1.30026 6.11865C1.32469 6.12875 1.35087 6.13394 1.3773 6.13392L3.18058 6.13384C3.20702 6.13385 3.2332 6.12865 3.25764 6.11853C3.28207 6.10841 3.30426 6.09358 3.32296 6.07488C3.34165 6.05618 3.35647 6.03398 3.36658 6.00954C3.37669 5.98511 3.38188 5.95892 3.38186 5.93248V3.31608H4.35682C4.43202 3.31608 4.50106 3.27368 4.53578 3.20672C4.55274 3.17381 4.56027 3.13686 4.55755 3.09994C4.55482 3.06302 4.54194 3.02758 4.52034 2.99752Z" fill="#0B7A66" />
          </svg>
        </span>
      </p>

      <p className={s.statLabel}>
        <FormattedText text={card.label} />
      </p>

      <div className={card.backgroundImageUrl ? s.statIcon : s.statIconFallback} aria-hidden>
        {card.backgroundImageUrl ? (
          <Image src={card.backgroundImageUrl} alt="" width={180} height={180} unoptimized />
        ) : icon}
      </div>
    </div>
  );
}

function IconBoxes() {
  return (
    <svg width="120" height="120" viewBox="0 0 120 120" fill="none">
      <rect x="10" y="50" width="45" height="45" rx="6" fill="var(--accent)" />
      <rect x="65" y="50" width="45" height="45" rx="6" fill="var(--accent)" />
      <rect x="37" y="15" width="45" height="45" rx="6" fill="var(--accent)" />
    </svg>
  );
}

function IconBars() {
  return (
    <svg width="120" height="120" viewBox="0 0 120 120" fill="none">
      <rect x="10" y="70" width="22" height="40" rx="4" fill="var(--accent)" />
      <rect x="42" y="45" width="22" height="65" rx="4" fill="var(--accent)" />
      <rect x="74" y="20" width="22" height="90" rx="4" fill="var(--accent)" />
    </svg>
  );
}

function IconRuble() {
  return (
    <svg width="120" height="120" viewBox="0 0 120 120" fill="none">
      <text x="50%" y="50%" dominantBaseline="middle" textAnchor="middle" fontSize="100" fontWeight="bold" fill="var(--accent)" fontFamily="sans-serif">₽</text>
    </svg>
  );
}
