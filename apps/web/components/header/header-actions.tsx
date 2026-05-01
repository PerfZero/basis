"use client";

import { useState } from "react";
import { ArrowRight } from "lucide-react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { DiagnosticModal } from "./diagnostic-modal";
import s from "./header.module.css";

type HeaderActionsProps = {
  className?: string;
  mobile?: boolean;
};

function hasAuthCookie(): boolean {
  if (typeof document === "undefined") return false;
  return document.cookie
    .split(";")
    .map((part) => part.trim())
    .some((part) => part.startsWith("basis_jwt=") || part.startsWith("basis_user="));
}

export function HeaderActions({ className }: HeaderActionsProps) {
  const [open, setOpen] = useState(false);
  const pathname = usePathname();
  const isCabinetPage = pathname?.startsWith("/cabinet");
  const isAuthorized = hasAuthCookie();
  const isProfileActive = Boolean(isCabinetPage || isAuthorized);

  return (
    <>
      <div className={className}>
        <Link
          href="/cabinet"
          aria-label="Профиль"
          aria-current={isCabinetPage ? "page" : undefined}
          className={`${s.profileBtn} ${isProfileActive ? s.profileBtnActive : ""}`.trim()}
        >
          <svg className={s.profileIconDefault} width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden>
            <path fillRule="evenodd" clipRule="evenodd" d="M15 1.5625C11.0325 1.5625 7.8125 4.7825 7.8125 8.75C7.8125 12.7175 11.0325 15.9375 15 15.9375C18.9675 15.9375 22.1875 12.7175 22.1875 8.75C22.1875 4.7825 18.9675 1.5625 15 1.5625ZM15 3.4375C17.9325 3.4375 20.3125 5.8175 20.3125 8.75C20.3125 11.6825 17.9325 14.0625 15 14.0625C12.0675 14.0625 9.6875 11.6825 9.6875 8.75C9.6875 5.8175 12.0675 3.4375 15 3.4375ZM27.1875 25C27.1875 22.7622 26.2986 20.6161 24.7162 19.0338C23.1339 17.4514 20.9878 16.5625 18.75 16.5625H11.25C9.01224 16.5625 6.86613 17.4514 5.28379 19.0338C3.70145 20.6161 2.8125 22.7622 2.8125 25C2.8125 25.9113 3.175 26.7863 3.81875 27.4313C4.46403 28.0753 5.33834 28.4371 6.25 28.4375H23.75C24.6612 28.4375 25.5362 28.075 26.1812 27.4313C26.8253 26.786 27.1871 25.9117 27.1875 25ZM25.3125 25C25.3118 25.4142 25.147 25.8112 24.8541 26.1041C24.5612 26.397 24.1642 26.5618 23.75 26.5625H6.25C5.8358 26.5618 5.43876 26.397 5.14588 26.1041C4.85299 25.8112 4.68816 25.4142 4.6875 25C4.68701 24.1381 4.85642 23.2845 5.18604 22.4881C5.51566 21.6916 5.99903 20.968 6.60851 20.3585C7.218 19.749 7.94164 19.2657 8.73806 18.936C9.53448 18.6064 10.3881 18.437 11.25 18.4375H18.75C19.6119 18.437 20.4655 18.6064 21.2619 18.936C22.0584 19.2657 22.782 19.749 23.3915 20.3585C24.001 20.968 24.4843 21.6916 24.814 22.4881C25.1436 23.2845 25.313 24.1381 25.3125 25Z" fill="black"/>
          </svg>
          <svg className={s.profileIconHover} width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden>
            <path fillRule="evenodd" clipRule="evenodd" d="M15 1.5625C11.0325 1.5625 7.8125 4.7825 7.8125 8.75C7.8125 12.7175 11.0325 15.9375 15 15.9375C18.9675 15.9375 22.1875 12.7175 22.1875 8.75C22.1875 4.7825 18.9675 1.5625 15 1.5625ZM15 3.4375C17.9325 3.4375 20.3125 5.8175 20.3125 8.75C20.3125 11.6825 17.9325 14.0625 15 14.0625C12.0675 14.0625 9.6875 11.6825 9.6875 8.75C9.6875 5.8175 12.0675 3.4375 15 3.4375ZM27.1875 25C27.1875 22.7622 26.2986 20.6161 24.7162 19.0338C23.1339 17.4514 20.9878 16.5625 18.75 16.5625H11.25C9.01224 16.5625 6.86613 17.4514 5.28379 19.0338C3.70145 20.6161 2.8125 22.7622 2.8125 25C2.8125 25.9113 3.175 26.7863 3.81875 27.4313C4.46403 28.0753 5.33834 28.4371 6.25 28.4375H23.75C24.6612 28.4375 25.5362 28.075 26.1812 27.4313C26.8253 26.786 27.1871 25.9117 27.1875 25ZM25.3125 25C25.3118 25.4142 25.147 25.8112 24.8541 26.1041C24.5612 26.397 24.1642 26.5618 23.75 26.5625H6.25C5.8358 26.5618 5.43876 26.397 5.14588 26.1041C4.85299 25.8112 4.68816 25.4142 4.6875 25C4.68701 24.1381 4.85642 23.2845 5.18604 22.4881C5.51566 21.6916 5.99903 20.968 6.60851 20.3585C7.218 19.749 7.94164 19.2657 8.73806 18.936C9.53448 18.6064 10.3881 18.437 11.25 18.4375H18.75C19.6119 18.437 20.4655 18.6064 21.2619 18.936C22.0584 19.2657 22.782 19.749 23.3915 20.3585C24.001 20.968 24.4843 21.6916 24.814 22.4881C25.1436 23.2845 25.313 24.1381 25.3125 25Z" fill="#B7B7B3"/>
          </svg>
          <svg className={s.profileIconActive} width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden>
            <path fillRule="evenodd" clipRule="evenodd" d="M15 1.5625C11.0325 1.5625 7.8125 4.7825 7.8125 8.75C7.8125 12.7175 11.0325 15.9375 15 15.9375C18.9675 15.9375 22.1875 12.7175 22.1875 8.75C22.1875 4.7825 18.9675 1.5625 15 1.5625ZM27.1875 25C27.1875 22.7622 26.2986 20.6161 24.7162 19.0338C23.1339 17.4514 20.9878 16.5625 18.75 16.5625H11.25C9.01224 16.5625 6.86613 17.4514 5.28379 19.0338C3.70145 20.6161 2.8125 22.7622 2.8125 25C2.8125 25.9113 3.175 26.7863 3.81875 27.4313C4.46403 28.0753 5.33834 28.4371 6.25 28.4375H23.75C24.6612 28.4375 25.5362 28.075 26.1812 27.4313C26.8253 26.786 27.1871 25.9117 27.1875 25Z" fill="#0B7A66"/>
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
