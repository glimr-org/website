# Glimr Website ✨

The official [Glimr](https://github.com/glimr-org/glimr) website, built with Glimr itself. This repo serves as both the landing page and a real-world example of a Glimr application.

## Running locally

Prerequisites: [Gleam](https://gleam.run/getting-started/installing/), [Erlang/OTP](https://gleam.run/getting-started/installing/#installing-erlang), and [Node.js](https://nodejs.org/).

```bash
# Install dependencies
gleam build
npm install

# Set up environment
cp .env.example .env

# Run migrations
./glimr migrate

# Start the dev server
./glimr run
```

The site will be available at `http://localhost:8000`.

## Project structure

```
src/
  app/
    http/
      controllers/       # Route handlers
      validators/        # Form validation
    console/
      commands/          # CLI commands
  resources/
    views/               # Loom templates (.loom.html)
      components/        # Reusable components
        icons/           # SVG icon components
        layouts/         # Page layouts
    css/                 # Stylesheets
    ts/                  # TypeScript (Shiki, Alpine)
  database/              # Models, migrations, queries
priv/
  static/
    images/              # Static images
config/                  # App, database, session config
```

## Tech stack

- [Glimr](https://github.com/glimr-org/glimr) + [Gleam](https://gleam.run) on the [BEAM](https://www.erlang.org/)
- [Loom](https://github.com/glimr-org/glimr?tab=readme-ov-file#loom-template-engine) templates
- [Tailwind CSS v4](https://tailwindcss.com/)
- [Vite](https://vite.dev/)
- [Alpine.js](https://alpinejs.dev/) for client-side interactivity
- [Shiki](https://shiki.style/) for syntax highlighting

## License

[MIT](LICENSE.md)
