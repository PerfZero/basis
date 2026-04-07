import Link from "next/link";
import { ChevronDown } from "lucide-react";
import type { RefObject } from "react";
import type { ServiceMenuItem } from "@/lib/strapi/menu-services";
import s from "./header.module.css";

type ServicesDropdownProps = {
  open: boolean;
  onToggle: () => void;
  onClose: () => void;
  items: ServiceMenuItem[];
  containerRef?: RefObject<HTMLLIElement | null>;
};

export function ServicesDropdown({ open, onToggle, onClose, items, containerRef }: ServicesDropdownProps) {
  return (
    <li className={s.dropdownItem} ref={containerRef}>
      <button type="button" className={s.dropdownTrigger} aria-haspopup="menu" aria-expanded={open} aria-controls="services-menu-desktop" onClick={onToggle}>
        Услуги <ChevronDown size={16} />
      </button>
      {open && (
        <ul id="services-menu-desktop" role="menu" className={s.dropdownMenu}>
          {items.map((item) => (
            <li key={item.id} role="none">
              <Link href={item.href} role="menuitem" className={s.dropdownLink} onClick={onClose}>
                {item.title}
              </Link>
            </li>
          ))}
        </ul>
      )}
    </li>
  );
}
