import { STATIC_NAV_ITEMS } from "@/lib/navigation";
import { getServiceMenuItems } from "@/lib/strapi/menu-services";

import { SiteHeaderClient } from "./site-header.client";

export async function SiteHeader() {
  const serviceMenuItems = await getServiceMenuItems();

  return <SiteHeaderClient staticNavItems={STATIC_NAV_ITEMS} serviceMenuItems={serviceMenuItems} />;
}
