import { factories } from "@strapi/strapi";

export default factories.createCoreController(
  "api::referral.referral",
  ({ strapi }) => ({
    async find(ctx) {
      const user = ctx.state.user;
      if (!user) return ctx.unauthorized();

      const referrals = await strapi.db
        .query("api::referral.referral")
        .findMany({
          where: { inviterUserId: user.id },
          orderBy: { createdAt: "desc" },
        });

      return { data: referrals, meta: {} };
    },

    async findOne(ctx) {
      const user = ctx.state.user;
      if (!user) return ctx.unauthorized();

      const referral = await strapi.db.query("api::referral.referral").findOne({
        where: { id: ctx.params.id, inviterUserId: user.id },
      });

      if (!referral) return ctx.notFound();
      return { data: referral, meta: {} };
    },
  }),
);
