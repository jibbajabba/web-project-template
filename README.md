# [Project Name]

> React + TypeScript web app built with Vite.

## Tech Stack

- [React 19](https://react.dev)
- [TypeScript 5.7](https://www.typescriptlang.org)
- [Vite 6](https://vitejs.dev)
- [React Router 7](https://reactrouter.com)

## Prerequisites

- Node.js >= 18

## Getting Started

```bash
# Install dependencies
npm install

# Copy environment variables
cp .env.example .env

# Start development server
npm run dev
```

App runs at `http://localhost:5173`.

## Development

```bash
npm run dev      # Start Vite dev server
npm run build    # Type-check + production build (output to dist/)
npm run preview  # Preview production build locally
```

## Environment Variables

Defined in `.env` (gitignored). Copy `.env.example` to get started. Variables prefixed with `VITE_` are exposed to client code.

## Documentation

- `CLAUDE.md` — Dev workflow, Claude Code commands, and coding principles
- `CHANGELOG.md` — Release history
- `PLAN.md` — Roadmap and completed work

## Claude Code Commands

| Command | Description |
|---------|-------------|
| `/update-docs` | Run all documentation updates |
| `/update-design-system` | Scan and maintain design tokens |
| `/update-changelog` | Generate changelog from git history |
| `/update-readme` | Update this README from project config |
| `/update-memory` | Record patterns, decisions, gotchas |
| `/update-plan` | Track roadmap and completed work |
