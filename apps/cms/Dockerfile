FROM node:22-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM node:22-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ARG STRAPI_ADMIN_BACKEND_URL=https://cms.basis.devdenis.ru
ARG ADMIN_PATH=/admin
ENV STRAPI_ADMIN_BACKEND_URL=${STRAPI_ADMIN_BACKEND_URL}
ENV ADMIN_PATH=${ADMIN_PATH}
ENV NODE_OPTIONS=--max-old-space-size=4096
RUN npm run build

FROM node:22-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/config ./config
COPY --from=builder /app/database ./database
COPY --from=builder /app/public ./public
COPY --from=builder /app/src ./src
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/tsconfig.json ./tsconfig.json
COPY --from=builder /app/favicon.png ./favicon.png
EXPOSE 1337
CMD ["npm", "run", "start"]
