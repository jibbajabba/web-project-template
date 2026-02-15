# [Project Name]

React web app built with Vite. Uses React Router for navigation.

## Development

```bash
npm run dev             # Start Vite dev server
```

For local development, `npm run dev` is all you need.

```bash
npm run build           # Production build (output to dist/)
npm run preview         # Preview production build locally
```

If you deploy via a platform like Vercel, Netlify, or Cloudflare Pages, the platform runs the build for you — so `build` and `preview` are only needed if you want to test the production output manually.

### Environment Variables

Stored in `.env` (gitignored). Copy `.env.example` to get started. Vite exposes variables prefixed with `VITE_` to client code.

## Deploying

Deploy the `dist/` directory to any static hosting, or connect your repo to Vercel, Netlify, or Cloudflare Pages for automatic builds.

## Claude Code Commands

These slash commands maintain project documentation automatically:

| Command | What it does |
|---------|-------------|
| `/update-docs` | Runs all documentation updates in one pass |
| `/update-design-system` | Scans for design tokens, maintains `src/styles/design.ts` |
| `/update-changelog` | Generates changelog entry from git history, outputs release notes |
| `/update-readme` | Regenerates README from actual project config and file structure |
| `/update-memory` | Records patterns, decisions, and gotchas in `.claude/memory/MEMORY.md` |
| `/update-plan` | Tracks roadmap progress in `PLAN.md`, auto-marks completed items from git |

### Usage

- Run `/update-docs` before each release to refresh everything
- Run `/update-changelog` when preparing a deployment
- Run `/update-memory` after solving a tricky bug or making an architecture decision
- Run `/update-design-system check` for a read-only audit of design tokens
- Pass arguments to any command for targeted updates (e.g., `/update-docs just changelog and readme`)

### Project-Local Memory

`.claude/memory/MEMORY.md` is committed to the repo and shared across machines. It stores project-specific patterns, workarounds, and decisions that Claude should remember. This is separate from Claude's auto-memory (which is machine-specific and stored in `~/.claude/`).
