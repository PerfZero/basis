/**
 * menu-service router
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreRouter("api::menu-service.menu-service", {
  config: {
    find: {
      auth: false,
    },
    findOne: {
      auth: false,
    },
  },
});
