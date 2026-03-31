import { SiteHeader } from "@/components/header/site-header.server";

export default async function Home() {
  return (
    <div className="relative flex min-h-screen flex-col overflow-hidden">
        <SiteHeader />
    </div>
  );
}
