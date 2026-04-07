import { factories } from "@strapi/strapi";

export default factories.createCoreRouter("api::hero-block.hero-block", {
  config: {
    find: {
      auth: false,
    },
  },
});
