import type { Metadata } from "next";
import { Golos_Text } from "next/font/google";
import Script from "next/script";
import { ScrollToTopButton } from "@/components/shared/scroll-to-top-button";
import { CookieConsentBanner } from "@/components/shared/cookie-consent-banner";
import { getSiteSettings, toInlineScriptCode } from "@/lib/strapi/site-settings";
import { getSiteUrl } from "@/lib/strapi/seo";
import "./globals.css";

const golosText = Golos_Text({
  subsets: ["cyrillic", "latin"],
  variable: "--font-golos",
  display: "swap",
});

export const metadata: Metadata = {
  metadataBase: new URL(getSiteUrl()),
  applicationName: "BasisThree",
  title: "Диагностика | Главная",
  description: "Сайт компании: услуги, о компании, контакты",
  openGraph: {
    siteName: "BasisThree",
    locale: "ru_RU",
    type: "website",
    images: [{ url: "/Rectangle 23.png", width: 1200, height: 500, alt: "BasisThree" }],
  },
  twitter: {
    card: "summary_large_image",
    images: ["/Rectangle 23.png"],
  },
};

export default async function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const siteSettings = await getSiteSettings();
  const headScriptCode = toInlineScriptCode(siteSettings.customHeadScript);
  const bodyScriptCode = toInlineScriptCode(siteSettings.customBodyScript);
  const faviconHref = siteSettings.faviconUrl;

  return (
    <html lang="ru" className={`h-full antialiased ${golosText.variable}`}>
      <head>
        {faviconHref ? <link rel="icon" href={faviconHref} sizes="any" /> : null}
        {siteSettings.gtmContainerId ? (
          <Script
            id="gtm-loader"
            strategy="beforeInteractive"
            dangerouslySetInnerHTML={{
              __html: `(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode&&f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','${siteSettings.gtmContainerId}');`,
            }}
          />
        ) : null}
        {headScriptCode ? (
          <Script
            id="custom-head-script"
            strategy="beforeInteractive"
            dangerouslySetInnerHTML={{ __html: headScriptCode }}
          />
        ) : null}
      </head>
      <body className="min-h-full flex flex-col">
        {siteSettings.gtmContainerId ? (
          <noscript>
            <iframe
              title="Google Tag Manager"
              src={`https://www.googletagmanager.com/ns.html?id=${siteSettings.gtmContainerId}`}
              height="0"
              width="0"
              style={{ display: "none", visibility: "hidden" }}
            />
          </noscript>
        ) : null}
        {siteSettings.yandexMetrikaId ? (
          <>
            <Script
              id="yandex-metrika"
              strategy="afterInteractive"
              dangerouslySetInnerHTML={{
                __html: `(function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};m[i].l=1*new Date();for(var j=0;j<document.scripts.length;j++){if(document.scripts[j].src===r){return;}}k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode&&a.parentNode.insertBefore(k,a)})(window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");ym(${siteSettings.yandexMetrikaId}, "init", {clickmap:true,trackLinks:true,accurateTrackBounce:true,webvisor:true});`,
              }}
            />
            <noscript>
              <div>
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img
                  src={`https://mc.yandex.ru/watch/${siteSettings.yandexMetrikaId}`}
                  style={{ position: "absolute", left: "-9999px" }}
                  alt=""
                />
              </div>
            </noscript>
          </>
        ) : null}
        {bodyScriptCode ? (
          <Script
            id="custom-body-script"
            strategy="afterInteractive"
            dangerouslySetInnerHTML={{ __html: bodyScriptCode }}
          />
        ) : null}
        {children}
        <CookieConsentBanner
          text={siteSettings.cookieBannerText}
          policyUrl={siteSettings.cookiePolicyUrl}
          acceptButtonLabel={siteSettings.cookieAcceptButtonLabel}
        />
        <ScrollToTopButton />
      </body>
    </html>
  );
}
