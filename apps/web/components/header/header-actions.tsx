import { ArrowRight, UserRound } from "lucide-react";
import Link from "next/link";
import s from "./header.module.css";

type HeaderActionsProps = {
  className?: string;
  mobile?: boolean;
};

export function HeaderActions({ className, mobile = false }: HeaderActionsProps) {
  return (
    <div className={className}>
      <Link href="/cabinet" aria-label="Профиль" className={s.profileBtn}>
        <UserRound size={34} />
      </Link>
      <button type="button" className={s.diagBtn}>
        Начать диагностику
        <ArrowRight size={16} />
      </button>
    </div>
  );
}
