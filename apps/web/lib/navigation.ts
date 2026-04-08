export type NavItem = {
  id: string;
  label: string;
  href: string;
};

export const STATIC_NAV_ITEMS: NavItem[] = [
  { id: "about", label: "О компании", href: "/about" },
  { id: "contacts", label: "Контакты", href: "/about#contact" },
];
