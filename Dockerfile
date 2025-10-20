# ---------- BUILDER ----------
FROM node:24.8.0 AS builder

WORKDIR /app

RUN yarn config set enableTelemetry 0 && \
  yarn config set --home enableTelemetry 0

COPY yarn.lock package.json ./

RUN yarn install --frozen-lockfile

COPY . .

# ---------- RUNNER ----------
FROM nginx:stable-alpine3.21 AS runner

COPY --from=builder /app /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK CMD wget --no-verbose --tries=1 --spider http://localhost/index.html || exit 1

CMD ["nginx", "-g", "daemon off;"]
