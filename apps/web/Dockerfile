# syntax=docker/dockerfile:1.7

FROM node:22-alpine AS deps
WORKDIR /app

# Install deps in a cache-friendly layer:
# this step is invalidated only when lockfile/package manifests change.
COPY package.json package-lock.json ./
COPY apps/web/package.json apps/web/package.json
COPY apps/cms/package.json apps/cms/package.json
RUN --mount=type=cache,target=/root/.npm npm ci --include=optional

FROM deps AS builder
WORKDIR /app
COPY . .
ARG STRAPI_URL=http://cms:1337
ENV STRAPI_URL=${STRAPI_URL}
ENV NODE_OPTIONS=--max-old-space-size=4096
RUN npm --workspace apps/web run build

FROM node:22-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app /app
EXPOSE 3000
CMD ["npm", "--workspace", "apps/web", "run", "start", "--", "-p", "3000", "-H", "0.0.0.0"]
