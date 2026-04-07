import Link from "next/link";
import type { NavItem } from "@/lib/navigation";
import s from "./header.module.css";

type NavLinksProps = {
  items: NavItem[];
  onNavigate?: () => void;
};

export function NavLinks({ items, onNavigate }: NavLinksProps) {
  return (
    <>
      {items.map((item) => (
        <li key={item.id}>
          <Link href={item.href} className={s.navLink} onClick={() => onNavigate?.()}>
            {item.label}
          </Link>
        </li>
      ))}
    </>
  );
}
