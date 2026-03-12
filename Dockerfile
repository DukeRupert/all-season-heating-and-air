# Stage 1: Build Hugo static site
FROM hugomods/hugo:exts AS hugo-builder

WORKDIR /src
COPY . .

RUN hugo --gc --minify --environment production

# Stage 2: Serve with Caddy
FROM caddy:2-alpine

COPY --from=hugo-builder /src/public /srv
COPY Caddyfile /etc/caddy/Caddyfile

ENV PORT=80

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://127.0.0.1:${PORT:-80}/ || exit 1
