import type { Metadata } from "next";
import { Golos_Text } from "next/font/google";
import "./globals.css";

const golosText = Golos_Text({
  subsets: ["cyrillic", "latin"],
  variable: "--font-golos",
  display: "swap",
});

export const metadata: Metadata = {
  title: "Диагностика | Главная",
  description: "Сайт компании: услуги, о компании, контакты",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ru" className={`h-full antialiased ${golosText.variable}`}>
      <body className="min-h-full flex flex-col">{children}</body>
    </html>
  );
}
