"use client";

import { useEffect, useState } from "react";
import { ArrowRight } from "lucide-react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { DiagnosticModal } from "./diagnostic-modal";
import s from "./header.module.css";

type HeaderActionsProps = {
  className?: string;
  mobile?: boolean;
};

export function HeaderActions({ className, mobile = false }: HeaderActionsProps) {
  const [open, setOpen] = useState(false);
  const [isAuthorized, setIsAuthorized] = useState(false);
  const pathname = usePathname();
  const isCabinetPage = pathname?.startsWith("/cabinet");
  const isProfileActive = Boolean(isCabinetPage || isAuthorized);

  useEffect(() => {
    if (typeof document === "undefined") return;
    const hasAuthCookie = document.cookie
      .split(";")
      .map((part) => part.trim())
      .some((part) => part.startsWith("basis_jwt=") || part.startsWith("basis_user="));
    setIsAuthorized(hasAuthCookie);
  }, [pathname]);

  return (
    <>
      <div className={className}>
        <Link
          href="/cabinet"
          aria-label="Профиль"
          aria-current={isCabinetPage ? "page" : undefined}
          className={`${s.profileBtn} ${isProfileActive ? s.profileBtnActive : ""}`.trim()}
        >
          <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fillRule="evenodd" clipRule="evenodd" d="M15 1.5625C11.0325 1.5625 7.8125 4.7825 7.8125 8.75C7.8125 12.7175 11.0325 15.9375 15 15.9375C18.9675 15.9375 22.1875 12.7175 22.1875 8.75C22.1875 4.7825 18.9675 1.5625 15 1.5625ZM27.1875 25C27.1875 22.7622 26.2986 20.6161 24.7162 19.0338C23.1339 17.4514 20.9878 16.5625 18.75 16.5625H11.25C9.01224 16.5625 6.86613 17.4514 5.28379 19.0338C3.70145 20.6161 2.8125 22.7622 2.8125 25C2.8125 25.9113 3.175 26.7863 3.81875 27.4313C4.46403 28.0753 5.33834 28.4371 6.25 28.4375H23.75C24.6612 28.4375 25.5362 28.075 26.1812 27.4313C26.8253 26.786 27.1871 25.9117 27.1875 25Z" fill="currentColor"/>
          </svg>

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
