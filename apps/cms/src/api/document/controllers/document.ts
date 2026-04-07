import { factories } from "@strapi/strapi";

export default factories.createCoreController("api::document.document", ({ strapi }) => ({
  async find(ctx) {
    const user = ctx.state.user;
    if (!user) {
      return ctx.unauthorized();
    }

    const documents = await strapi.db.query("api::document.document").findMany({
      where: { user: { id: user.id } },
      populate: { file: true },
      orderBy: { id: "desc" },
    });

    return { data: documents, meta: {} };
  },
}));
