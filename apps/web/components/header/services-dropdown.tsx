import Link from "next/link";
import { ChevronDown } from "lucide-react";
import type { RefObject } from "react";

import type { ServiceMenuItem } from "@/lib/strapi/menu-services";

type ServicesDropdownProps = {
  open: boolean;
  onToggle: () => void;
  onClose: () => void;
  items: ServiceMenuItem[];
  containerRef?: RefObject<HTMLLIElement | null>;
};

export function ServicesDropdown({ open, onToggle, onClose, items, containerRef }: ServicesDropdownProps) {
  return (
    <li className="relative" ref={containerRef}>
      <button
        type="button"
        className="inline-flex items-center gap-1 text-center text-base font-normal text-black transition hover:text-[var(--accent)]"
        aria-haspopup="menu"
        aria-expanded={open}
        aria-controls="services-menu-desktop"
        onClick={onToggle}
      >
        Услуги
        <ChevronDown size={16} />
      </button>

      {open && (
        <ul
          id="services-menu-desktop"
          role="menu"
          className="absolute left-0 top-full z-30 mt-3 min-w-[280px] rounded-2xl border border-slate-900/10 bg-white p-2 shadow-xl"
        >
          {items.map((item) => (
            <li key={item.id} role="none">
              <Link
                href={item.href}
                role="menuitem"
                className="block rounded-xl px-3 py-2 text-center text-base font-normal text-black transition hover:bg-[#0b7a6614] hover:text-[var(--accent)]"
                onClick={onClose}
              >
                {item.title}
              </Link>
            </li>
          ))}
        </ul>
      )}
    </li>
  );
}
