# Stage 1: Build frontend assets
FROM node:22-alpine AS frontend
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Runtime image with full Gleam toolchain
FROM ghcr.io/gleam-lang/gleam:v1.14.0-erlang-alpine
RUN apk add --no-cache build-base wget bash
WORKDIR /app

COPY gleam.toml manifest.toml ./
COPY src/ src/
COPY config/ config/
COPY glimr ./glimr
COPY --from=frontend /app/priv/ priv/
COPY healthcheck.sh /app/healthcheck.sh

RUN gleam build
RUN chmod +x /app/glimr /app/healthcheck.sh

EXPOSE 8000
CMD ["gleam", "run"]
