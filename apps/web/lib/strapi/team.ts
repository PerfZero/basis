import { resolveStrapiMediaUrl } from "./media-url";

export type TeamMember = {
  id: number;
  name: string;
  role: string;
  description: string;
  phone: string;
  email: string;
  contactHandle: string;
  photoUrl: string | null;
  qrCodeUrl: string | null;
};

export type TeamSectionData = {
  heading: string;
  subheading: string;
  members: TeamMember[];
};

const fallback: TeamSectionData = {
  heading: "Три экспертизы — одна команда",
  subheading:
    "За каждым проектом стоят три направления: стратегия продаж, инженерная архитектура и полевое внедрение. Мы работаем как единый механизм — без разрывов между консалтингом и реализацией.",
  members: [],
};

const fallbackContacts = [
  {
    phone: "+7 981 286 39 09",
    email: "dmitriev@basisthree.ru",
    contactHandle: "@ddvworks",
  },
  {
    phone: "+7 921 286 39 09",
    email: "nazarenko@basisthree.ru",
    contactHandle: "@vladimir_n",
  },
  {
    phone: "+7 931 286 39 09",
    email: "pal@basisthree.ru",
    contactHandle: "@vladimir_pal",
  },
] as const;

export async function getTeamSection(): Promise<TeamSectionData> {
  const baseUrl = process.env.STRAPI_URL ?? "http://localhost:1337";
  const token = process.env.STRAPI_API_TOKEN;
  const headers: Record<string, string> = token ? { Authorization: `Bearer ${token}` } : {};

  try {
    const [sectionRes, membersRes] = await Promise.all([
      fetch(`${baseUrl}/api/team-section`, { headers, next: { revalidate: 60 } }),
      fetch(`${baseUrl}/api/team-members?populate[0]=photo&populate[1]=qrCode&sort=sortOrder:asc&pagination[pageSize]=20`, { headers, next: { revalidate: 60 } }),
    ]);

    const sectionJson = sectionRes.ok ? await sectionRes.json() : {};
    const membersJson = membersRes.ok ? await membersRes.json() : {};

    const s = sectionJson?.data ?? {};
    const membersRaw: TeamMember[] = (membersJson?.data ?? []).map((m: Record<string, unknown>) => ({
      id: m.id as number,
      name: (m.name as string) || "",
      role: (m.role as string) || "",
      description: (m.description as string) || "",
      phone: (m.phone as string) || "",
      email: (m.email as string) || "",
      contactHandle: (m.contactHandle as string) || "",
      photoUrl: resolveStrapiMediaUrl((m.photo as Record<string, unknown>)?.url as string),
      qrCodeUrl: resolveStrapiMediaUrl((m.qrCode as Record<string, unknown>)?.url as string),
    }));

    const members: TeamMember[] = membersRaw.map((member: TeamMember, index: number) => {
      const contact = fallbackContacts[index % fallbackContacts.length];
      return {
        ...member,
        phone: member.phone || contact.phone,
        email: member.email || contact.email,
        contactHandle: member.contactHandle || contact.contactHandle,
      };
    });

    return {
      heading: (s.heading as string) || fallback.heading,
      subheading: (s.subheading as string) || fallback.subheading,
      members,
    };
  } catch {
    return fallback;
  }
}
