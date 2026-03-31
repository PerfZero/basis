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
    function onPointerDown(event: MouseEvent) {
      if (!desktopServicesRef.current) return;
      if (!desktopServicesRef.current.contains(event.target as Node)) {
        setDesktopServicesOpen(false);
      }
    }

    function onKeyDown(event: KeyboardEvent) {
      if (event.key === "Escape") {
        setDesktopServicesOpen(false);
        setMobileMenuOpen(false);
        setMobileServicesOpen(false);
      }
    }

    window.addEventListener("mousedown", onPointerDown);
    window.addEventListener("keydown", onKeyDown);
    return () => {
      window.removeEventListener("mousedown", onPointerDown);
      window.removeEventListener("keydown", onKeyDown);
    };
  }, []);

  return (
    <header className="sticky top-0 z-20">
      <div className="mx-auto flex w-full max-w-[1200px] flex-wrap items-center justify-between gap-4 px-5 py-3 md:px-8">
        <Link href="/" className="shrink-0" aria-label="На главную">
          <Image src="/logo.svg" alt="Логотип компании" width={142} height={40} priority />
        </Link>

        <nav aria-label="Основная навигация" className="hidden md:block">
          <ul className="flex items-center gap-8">
            <ServicesDropdown
              items={serviceMenuItems}
              open={desktopServicesOpen}
              onToggle={() => setDesktopServicesOpen((prev) => !prev)}
              onClose={() => setDesktopServicesOpen(false)}
              containerRef={desktopServicesRef}
            />
            <NavLinks
              items={staticNavItems}
              linkClassName="text-center text-base font-normal text-black transition hover:text-[var(--accent)]"
            />
          </ul>
        </nav>

        <HeaderActions className="hidden items-center gap-2 md:flex" />

        <button
          type="button"
          className="grid h-10 w-10 place-items-center rounded-full border border-slate-900/15 bg-white text-slate-900 md:hidden"
          aria-label={mobileMenuOpen ? "Закрыть меню" : "Открыть меню"}
          aria-expanded={mobileMenuOpen}
          aria-controls="mobile-nav"
          onClick={() => setMobileMenuOpen((prev) => !prev)}
        >
          {mobileMenuOpen ? <X size={18} /> : <Menu size={18} />}
        </button>

        {mobileMenuOpen && (
          <nav
            id="mobile-nav"
            aria-label="Мобильная навигация"
            className="order-3 w-full rounded-2xl border border-slate-900/10 bg-white p-3 md:hidden"
          >
            <ul className="flex flex-col gap-1">
              <li>
                <button
                  type="button"
                  className="flex w-full items-center justify-between py-1 text-center text-base font-normal text-black"
                  aria-expanded={mobileServicesOpen}
                  aria-controls="mobile-services-menu"
                  onClick={() => setMobileServicesOpen((prev) => !prev)}
                >
                  Услуги
                  <ChevronDown size={14} />
                </button>
                {mobileServicesOpen && (
                  <ul id="mobile-services-menu" className="mt-2 flex flex-col gap-1 pb-1 pl-2">
                    {serviceMenuItems.map((item) => (
                      <li key={item.id}>
                        <Link
                          href={item.href}
                          className="block rounded-md px-2 py-1 text-center text-base font-normal text-black transition hover:bg-[#0b7a6614] hover:text-[var(--accent)]"
                          onClick={() => {
                            setMobileServicesOpen(false);
                            setMobileMenuOpen(false);
                          }}
                        >
                          {item.title}
                        </Link>
                      </li>
                    ))}
                  </ul>
                )}
              </li>

              <NavLinks
                items={staticNavItems}
                linkClassName="block py-1 text-center text-base font-normal text-black transition hover:text-[var(--accent)]"
                onNavigate={() => {
                  setMobileMenuOpen(false);
                  setMobileServicesOpen(false);
                }}
              />
            </ul>

            <HeaderActions className="mt-2 flex items-center gap-2 border-t border-slate-900/10 pt-3" mobile />
          </nav>
        )}
      </div>
    </header>
  );
}
