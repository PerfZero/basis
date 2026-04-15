FROM node:22-alpine AS deps
WORKDIR /app
COPY . .
RUN npm ci

FROM deps AS builder
WORKDIR /app
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
