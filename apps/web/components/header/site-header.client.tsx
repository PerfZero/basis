"use client";

import { type MouseEvent as ReactMouseEvent, useEffect, useRef, useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { Menu, X } from "lucide-react";

import type { NavItem } from "@/lib/navigation";
import type { ServiceMenuItem } from "@/lib/strapi/menu-services";

import { HeaderActions } from "./header-actions";
import { ServicesDropdown } from "./services-dropdown";
import { DiagnosticTriggerButton } from "@/components/shared/diagnostic-trigger-button";
import s from "./header.module.css";

type SiteHeaderClientProps = {
  staticNavItems: NavItem[];
  serviceMenuItems: ServiceMenuItem[];
};

export function SiteHeaderClient({ staticNavItems, serviceMenuItems }: SiteHeaderClientProps) {
  const pathname = usePathname();
  const [desktopServicesOpen, setDesktopServicesOpen] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const desktopServicesRef = useRef<HTMLLIElement>(null);

  useEffect(() => {
    function onPointerDown(e: MouseEvent) {
      if (!desktopServicesRef.current?.contains(e.target as Node)) setDesktopServicesOpen(false);
    }
    function onKeyDown(e: KeyboardEvent) {
      if (e.key === "Escape") { setDesktopServicesOpen(false); setMobileMenuOpen(false); }
    }
    window.addEventListener("mousedown", onPointerDown);
    window.addEventListener("keydown", onKeyDown);
    return () => { window.removeEventListener("mousedown", onPointerDown); window.removeEventListener("keydown", onKeyDown); };
  }, []);

  useEffect(() => {
    document.body.style.overflow = mobileMenuOpen ? "hidden" : "";
    return () => { document.body.style.overflow = ""; };
  }, [mobileMenuOpen]);

  const closeMenu = () => setMobileMenuOpen(false);
  const normalizePath = (value: string) => {
    const [pathOnly = "/"] = value.split(/[?#]/);
    if (pathOnly === "/") return "/";
    return pathOnly.replace(/\/+$/, "") || "/";
  };

  const currentPath = normalizePath(pathname ?? "/");
  const handleHeaderLinkClick = (
    event: ReactMouseEvent<HTMLAnchorElement>,
    href: string,
    closeMobile = false,
  ) => {
    if (closeMobile) closeMenu();

    if (normalizePath(href) !== currentPath) {
      return;
    }

    event.preventDefault();
    window.location.assign(href);
  };

  const handleLogoClick = (event: ReactMouseEvent<HTMLAnchorElement>) => {
    if (pathname !== "/") return;
    event.preventDefault();
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  return (
    <>
      <header className={s.header}>
        <div className={s.inner}>
          <Link href="/" aria-label="На главную" onClick={handleLogoClick}>
            <Image src="/logo.svg" alt="Логотип" width={142} height={40} priority />
          </Link>

          <nav className={s.nav} aria-label="Основная навигация">
            <ul className={s.navList}>
              <ServicesDropdown
                items={serviceMenuItems}
                open={desktopServicesOpen}
                onToggle={() => setDesktopServicesOpen(p => !p)}
                onClose={() => setDesktopServicesOpen(false)}
                onItemClick={handleHeaderLinkClick}
                containerRef={desktopServicesRef}
              />
              {staticNavItems.map((item) => (
                <li key={item.id}>
                  <Link
                    href={item.href}
                    className={s.navLink}
                    onClick={(event) => handleHeaderLinkClick(event, item.href)}
                  >
                    {item.label}
                  </Link>
                </li>
              ))}
            </ul>
          </nav>

          <HeaderActions className={s.actions} />

          <button
            type="button"
            className={s.hamburger}
            aria-label={mobileMenuOpen ? "Закрыть меню" : "Открыть меню"}
            aria-expanded={mobileMenuOpen}
            onClick={() => setMobileMenuOpen(p => !p)}
          >
            <Menu size={18} />
          </button>
        </div>
      </header>

      {/* Fullscreen mobile overlay */}
      {mobileMenuOpen && (
        <div className={s.mobileOverlay} role="dialog" aria-modal="true" aria-label="Навигация">
          {/* Top bar */}
          <div className={s.mobileOverlayTop}>
            <Link
              href="/"
              onClick={(event) => {
                closeMenu();
                handleLogoClick(event);
              }}
              aria-label="На главную"
            >
              <Image src="/logo.svg" alt="Логотип" width={120} height={34} priority />
            </Link>
            <button type="button" className={s.mobileCloseBtn} onClick={closeMenu} aria-label="Закрыть меню">
              <X size={24} />
            </button>
          </div>

          {/* Nav content */}
          <nav className={s.mobileOverlayNav}>
            <div className={s.mobileSection}>
              <p className={s.mobileSectionHeading}>Услуги</p>
              <ul className={s.mobileSectionList}>
                {serviceMenuItems.map((item) => (
                  <li key={item.id} className={s.mobileSectionItem}>
                    <Link
                      href={item.href}
                      className={s.mobileSectionLink}
                      onClick={(event) => handleHeaderLinkClick(event, item.href, true)}
                    >
                      {item.title}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>

            <div className={s.mobileSection}>
              <p className={s.mobileSectionHeading}>Информация</p>
              <ul className={s.mobileSectionList}>
                {staticNavItems.map((item) => (
                  <li key={item.id} className={s.mobileSectionItem}>
                    <Link
                      href={item.href}
                      className={s.mobileSectionLink}
                      onClick={(event) => handleHeaderLinkClick(event, item.href, true)}
                    >
                      {item.label}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          </nav>

          {/* Bottom CTA */}
          <div className={s.mobileOverlayBottom}>
            <DiagnosticTriggerButton className={s.mobileCtaBtn}>
              Начать диагностику
            </DiagnosticTriggerButton>
          </div>
        </div>
      )}
    </>
  );
}
