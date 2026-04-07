## Next.js / Strapi Code Rules

1. Server-first architecture.
- Fetch data in Server Components or server helpers.
- Keep Client Components only for interaction and browser APIs.

2. Composition over monoliths.
- Split UI into small reusable components.
- Use container + presentational pattern:
  - `*.server.tsx` for data composition.
  - `*.client.tsx` for interactive behavior.

3. No hardcoded navigation/data in JSX.
- Keep static navigation in typed arrays/constants.
- Render repeated UI via `map`.
- Content that editors manage must come from Strapi.

4. Strict typing on boundaries.
- Create explicit DTO/domain types for Strapi responses.
- Normalize API responses in `lib/*` helpers.
- Keep fallback data for unavailable API.

5. Keep business logic out of page files.
- `app/page.tsx` should compose sections/components only.
- Data fetching and mapping live in `lib/*` and server containers.

6. Accessibility by default.
- Semantic structure: `header/nav/ul/li/button`.
- Add `aria-*` for toggles and menus.
- Support Escape key and click-outside for dropdowns.

7. One source of truth for styles and tokens.
- Use CSS variables for colors and spacing.
- Keep shared UI styles in common components/utilities.

8. Mobile behavior is first-class.
- Implement mobile nav explicitly.
- Do not duplicate logic between desktop and mobile.

9. Security and config hygiene.
- Never commit real tokens/secrets.
- Use `.env.local` for local secrets, `.env.example` for placeholders.

10. Quality gate before finish.
- Run `npm --workspace apps/web run build`.
- If Strapi schema changed, run `npm --workspace apps/cms run build`.

11. Styling: CSS Modules only — no Tailwind.
- Every component has its own `*.module.css` file.
- Import as `import s from "./component.module.css"` and use `className={s.className}`.
- Global styles and design tokens live in `app/globals.css` only.
- Do NOT install or use Tailwind.

12. Strapi content-manager labels must be in Russian.
- All displayName in schema info and field labels must be in Russian.
- Field labels are set via bootstrap in `apps/cms/src/index.ts` using `strapi.store()`.
- Every new content type must have its labels config added to `src/index.ts` bootstrap.

12. Strapi dynamic zone populate syntax (v5).
- Dynamic zones require the fragment API for nested populate:
  `populate[zone][on][category.component][populate]=*`
- Never use `populate[zone][populate]=field1,field2` — it throws 500 on polymorphic structures.

13. next/image requires external hostnames to be whitelisted in next.config.
- Add Strapi hostname (localhost in dev, production domain in prod) to `images.remotePatterns` in `next.config.ts`.
