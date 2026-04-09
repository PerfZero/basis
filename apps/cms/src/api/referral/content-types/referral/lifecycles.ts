type RelationValue =
  | number
  | string
  | { id?: number | string; connect?: Array<{ id?: number | string }> }
  | null
  | undefined;

function toNumber(value: unknown): number | null {
  if (typeof value === "number" && Number.isFinite(value)) return value;
  if (typeof value === "string" && /^\d+$/.test(value)) return Number(value);
  return null;
}

function extractRelationId(value: RelationValue): number | null {
  const direct = toNumber(value);
  if (direct !== null) return direct;

  if (!value || typeof value !== "object") return null;
  const obj = value as { id?: unknown; connect?: Array<{ id?: unknown }> };

  const byId = toNumber(obj.id);
  if (byId !== null) return byId;

  if (Array.isArray(obj.connect) && obj.connect.length > 0) {
    const byConnect = toNumber(obj.connect[0]?.id);
    if (byConnect !== null) return byConnect;
  }

  return null;
}

function syncInviterUserId(data: Record<string, unknown>) {
  const inviterRelationId = extractRelationId(data.inviterUser as RelationValue);
  if (inviterRelationId !== null) {
    data.inviterUserId = inviterRelationId;
    return;
  }

  const inviterUserId = toNumber(data.inviterUserId);
  if (inviterUserId !== null && data.inviterUser == null) {
    data.inviterUser = inviterUserId;
  }
}

export default {
  beforeCreate(event: { params?: { data?: Record<string, unknown> } }) {
    const data = event.params?.data;
    if (!data) return;
    syncInviterUserId(data);
  },

  beforeUpdate(event: { params?: { data?: Record<string, unknown> } }) {
    const data = event.params?.data;
    if (!data) return;
    syncInviterUserId(data);
  },
};
