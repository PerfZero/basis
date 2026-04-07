"use client";

import { useState } from "react";
import { ArrowRight, UserRound } from "lucide-react";
import Link from "next/link";
import { DiagnosticModal } from "./diagnostic-modal";
import s from "./header.module.css";

type HeaderActionsProps = {
  className?: string;
  mobile?: boolean;
};

export function HeaderActions({ className, mobile = false }: HeaderActionsProps) {
  const [open, setOpen] = useState(false);

  return (
    <>
      <div className={className}>
        <Link href="/cabinet" aria-label="Профиль" className={s.profileBtn}>
          <UserRound size={34} />
        </Link>
        <button type="button" className={s.diagBtn} onClick={() => setOpen(true)}>
          Начать диагностику
          <ArrowRight size={16} />
        </button>
      </div>

      {open && <DiagnosticModal onClose={() => setOpen(false)} />}
    </>
  );
}
