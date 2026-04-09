import { factories } from "@strapi/strapi";

type ReferralStatus = "in_progress" | "contract_signed";

const STATUS_ALIASES: Record<string, ReferralStatus> = {
  in_progress: "in_progress",
  inprogress: "in_progress",
  "in-progress": "in_progress",
  contract_signed: "contract_signed",
  contractsigned: "contract_signed",
  "contract-signed": "contract_signed",
};

function normalizeReferralBody(body: unknown): { data: Record<string, unknown> } {
  const raw = body && typeof body === "object" ? (body as Record<string, unknown>) : {};
  const candidateData = raw.data;
  const data =
    candidateData && typeof candidateData === "object" && !Array.isArray(candidateData)
      ? { ...(candidateData as Record<string, unknown>) }
      : { ...raw };

  if (typeof raw.status === "string" && typeof data.referralStatus !== "string") {
    data.referralStatus = raw.status;
  }

  if (typeof data.status === "string" && typeof data.referralStatus !== "string") {
    data.referralStatus = data.status;
  }

  if (typeof data.referralStatus === "string") {
    const normalized = STATUS_ALIASES[data.referralStatus.trim().toLowerCase()];
    if (normalized) data.referralStatus = normalized;
  }

  delete data.status;

  if (data.user && typeof data.user === "object" && !Array.isArray(data.user)) {
    const userObj = data.user as Record<string, unknown>;
    const firstConnect = Array.isArray(userObj.connect)
      ? (userObj.connect[0] as Record<string, unknown> | undefined)
      : undefined;

    if (firstConnect && typeof firstConnect.id === "number") {
      data.user = firstConnect.id;
    } else if (typeof userObj.id === "number") {
      data.user = userObj.id;
    }
  } else if (typeof data.user === "string" && /^\d+$/.test(data.user)) {
    data.user = Number(data.user);
  }

  if (data.inviterUser && typeof data.inviterUser === "object" && !Array.isArray(data.inviterUser)) {
    const inviterObj = data.inviterUser as Record<string, unknown>;
    const firstConnect = Array.isArray(inviterObj.connect)
      ? (inviterObj.connect[0] as Record<string, unknown> | undefined)
      : undefined;

    if (firstConnect && typeof firstConnect.id === "number") {
      data.inviterUser = firstConnect.id;
    } else if (typeof inviterObj.id === "number") {
      data.inviterUser = inviterObj.id;
    }
  } else if (typeof data.inviterUser === "string" && /^\d+$/.test(data.inviterUser)) {
    data.inviterUser = Number(data.inviterUser);
  }

  return { data };
}

export default factories.createCoreController(
  "api::referral.referral",
  ({ strapi }) => ({
    async create(ctx) {
      ctx.request.body = normalizeReferralBody(ctx.request.body);
      return await super.create(ctx);
    },

    async update(ctx) {
      ctx.request.body = normalizeReferralBody(ctx.request.body);
      return await super.update(ctx);
    },

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
