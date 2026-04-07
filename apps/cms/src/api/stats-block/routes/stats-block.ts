import { factories } from "@strapi/strapi";
export default factories.createCoreRouter("api::stats-block.stats-block", {
  config: {
    find: { auth: false },
  },
});
