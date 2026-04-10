import { factories } from "@strapi/strapi";

type ReferralStatus = "in_progress" | "contract_signed";

const STATUS_ALIASES: Record<string, ReferralStatus> = {
  in_progress: "in_progress",
  inprogress: "in_progress",
  "in-progress": "in_progress",
  "in progress": "in_progress",
  progress: "in_progress",
  "в работе": "in_progress",
  "в процессе": "in_progress",
  contract_signed: "contract_signed",
  contractsigned: "contract_signed",
  "contract-signed": "contract_signed",
  "contract signed": "contract_signed",
  signed: "contract_signed",
  "договор подписан": "contract_signed",
};

function normalizeStatus(value: unknown): ReferralStatus | null {
  if (typeof value !== "string") return null;
  return STATUS_ALIASES[value.trim().toLowerCase()] ?? null;
}

function normalizeReferralBody(body: unknown): { data: Record<string, unknown> } {
  const raw = body && typeof body === "object" ? (body as Record<string, unknown>) : {};
  const candidateData = raw.data;
  const data =
    candidateData && typeof candidateData === "object" && !Array.isArray(candidateData)
      ? { ...(candidateData as Record<string, unknown>) }
      : { ...raw };

  if (typeof data.referralStatus !== "string") {
    const normalizedRawStatus = normalizeStatus(raw.status);
    if (normalizedRawStatus) {
      data.referralStatus = normalizedRawStatus;
    }
  }

  if (typeof data.referralStatus !== "string") {
    const normalizedDataStatus = normalizeStatus(data.status);
    if (normalizedDataStatus) {
      data.referralStatus = normalizedDataStatus;
    }
  }

  const normalizedReferralStatus = normalizeStatus(data.referralStatus);
  if (normalizedReferralStatus) {
    data.referralStatus = normalizedReferralStatus;
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
