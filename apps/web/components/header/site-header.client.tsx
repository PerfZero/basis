"use client";

import { useEffect, useRef, useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { ChevronDown, Menu, X } from "lucide-react";

import type { NavItem } from "@/lib/navigation";
import type { ServiceMenuItem } from "@/lib/strapi/menu-services";

import { HeaderActions } from "./header-actions";
import { NavLinks } from "./nav-links";
import { ServicesDropdown } from "./services-dropdown";
import s from "./header.module.css";

type SiteHeaderClientProps = {
  staticNavItems: NavItem[];
  serviceMenuItems: ServiceMenuItem[];
};

export function SiteHeaderClient({ staticNavItems, serviceMenuItems }: SiteHeaderClientProps) {
  const [desktopServicesOpen, setDesktopServicesOpen] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [mobileServicesOpen, setMobileServicesOpen] = useState(false);
  const desktopServicesRef = useRef<HTMLLIElement>(null);

  useEffect(() => {
    function onPointerDown(e: MouseEvent) {
      if (!desktopServicesRef.current?.contains(e.target as Node)) setDesktopServicesOpen(false);
    }
    function onKeyDown(e: KeyboardEvent) {
      if (e.key === "Escape") { setDesktopServicesOpen(false); setMobileMenuOpen(false); setMobileServicesOpen(false); }
    }
    window.addEventListener("mousedown", onPointerDown);
    window.addEventListener("keydown", onKeyDown);
    return () => { window.removeEventListener("mousedown", onPointerDown); window.removeEventListener("keydown", onKeyDown); };
  }, []);

  return (
    <header className={s.header}>
      <div className={s.inner}>
        <Link href="/" aria-label="На главную">
          <Image src="/logo.svg" alt="Логотип" width={142} height={40} priority />
        </Link>

        <nav className={s.nav} aria-label="Основная навигация">
          <ul className={s.navList}>
            <ServicesDropdown
              items={serviceMenuItems}
              open={desktopServicesOpen}
              onToggle={() => setDesktopServicesOpen(p => !p)}
              onClose={() => setDesktopServicesOpen(false)}
              containerRef={desktopServicesRef}
            />
            <NavLinks items={staticNavItems} />
          </ul>
        </nav>

        <HeaderActions className={s.actions} />

        <button
          type="button"
          className={s.hamburger}
          aria-label={mobileMenuOpen ? "Закрыть меню" : "Открыть меню"}
          aria-expanded={mobileMenuOpen}
          aria-controls="mobile-nav"
          onClick={() => setMobileMenuOpen(p => !p)}
        >
          {mobileMenuOpen ? <X size={18} /> : <Menu size={18} />}
        </button>

        {mobileMenuOpen && (
          <nav id="mobile-nav" className={s.mobileNav} aria-label="Мобильная навигация">
            <ul className={s.mobileNavList}>
              <li>
                <button
                  type="button"
                  className={s.mobileServicesTrigger}
                  aria-expanded={mobileServicesOpen}
                  onClick={() => setMobileServicesOpen(p => !p)}
                >
                  Услуги <ChevronDown size={14} />
                </button>
                {mobileServicesOpen && (
                  <ul className={s.mobileServicesMenu}>
                    {serviceMenuItems.map((item) => (
                      <li key={item.id}>
                        <Link
                          href={item.href}
                          className={s.mobileServicesLink}
                          onClick={() => { setMobileServicesOpen(false); setMobileMenuOpen(false); }}
                        >
                          {item.title}
                        </Link>
                      </li>
                    ))}
                  </ul>
                )}
              </li>
              <NavLinks items={staticNavItems} onNavigate={() => { setMobileMenuOpen(false); setMobileServicesOpen(false); }} />
            </ul>
            <HeaderActions className={s.mobileActionsWrap} mobile />
          </nav>
        )}
      </div>
    </header>
  );
}
