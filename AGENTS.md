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
