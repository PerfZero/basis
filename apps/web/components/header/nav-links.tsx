import type { NavItem } from "@/lib/navigation";

type NavLinksProps = {
  items: NavItem[];
  linkClassName: string;
  onNavigate?: () => void;
};

export function NavLinks({ items, linkClassName, onNavigate }: NavLinksProps) {
  return (
    <>
      {items.map((item) => (
        <li key={item.id}>
          <a
            href={item.href}
            className={linkClassName}
            onClick={() => {
              onNavigate?.();
            }}
          >
            {item.label}
          </a>
        </li>
      ))}
    </>
  );
}
