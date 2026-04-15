# syntax=docker/dockerfile:1.7

FROM node:22-alpine AS deps
WORKDIR /app

# Cache-friendly deps layer: invalidates only when manifests/lockfile change.
COPY package.json package-lock.json ./
COPY apps/web/package.json apps/web/package.json
COPY apps/cms/package.json apps/cms/package.json
RUN --mount=type=cache,target=/root/.npm npm ci --include=optional
RUN npm --workspace apps/cms install --no-save --os=linux --libc=musl --cpu=x64 sharp

FROM deps AS builder
WORKDIR /app
COPY . .
ARG STRAPI_ADMIN_BACKEND_URL=https://cms.basisthree.ru
ARG ADMIN_PATH=/admin
ENV STRAPI_ADMIN_BACKEND_URL=${STRAPI_ADMIN_BACKEND_URL}
ENV ADMIN_PATH=${ADMIN_PATH}
ENV NODE_OPTIONS=--max-old-space-size=4096
RUN npm --workspace apps/cms run build

FROM node:22-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app /app
EXPOSE 1337
CMD ["npm", "--workspace", "apps/cms", "run", "start"]
