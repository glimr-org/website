# Stage 1: Build frontend assets
FROM node:22-alpine AS frontend
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Build the Gleam application
FROM ghcr.io/gleam-lang/gleam:v1.14.0-erlang-alpine AS builder
RUN apk add --no-cache build-base
WORKDIR /app
COPY gleam.toml manifest.toml ./
COPY src/ src/
COPY config/ config/
COPY --from=frontend /app/priv/ priv/
RUN gleam export erlang-shipment

# Stage 3: Runtime image
FROM erlang:28-alpine AS runtime
WORKDIR /app

RUN apk add --no-cache wget && adduser -D webapp
COPY --from=builder /app/build/erlang-shipment /app
COPY --from=frontend /app/priv/ /app/priv/
COPY config/ /app/config/
COPY healthcheck.sh /app/healthcheck.sh
RUN chown -R webapp:webapp /app

USER webapp
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["run"]
