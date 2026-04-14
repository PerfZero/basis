FROM node:22-alpine AS deps
WORKDIR /app
COPY . .
RUN npm ci

FROM node:22-alpine AS builder
WORKDIR /app
COPY --from=deps /app /app
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
