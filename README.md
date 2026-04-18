# DevKit

DevKit is a small workflow kit for AI-assisted software development.

It helps agents:

- clarify requirements before coding
- use specs, plans, and tasks as the source of truth
- inspect existing code before brownfield changes
- check artifact consistency before implementation or merge
- keep output concise when terse mode is requested

DevKit is Markdown-first. It does not vendor Spec Kit, GitNexus, Cavekit, or Caveman source code.

Current active version: v0.5.1.

## What Is Included

```text
AGENTS.md      Agent rules and active version boundary
docs/          Usage and installation docs
skills/        Thin workflow skills
templates/     Reusable report and output templates
scripts/       Lightweight installer and verifier
examples/      Example workflow transcripts and artifacts
dev/           Development history for contributors
```

## Core Tools

- Spec Kit: specification, clarification, planning, tasking, and implementation artifacts
- GitNexus: codebase understanding, impact analysis, debugging, refactor safety, and review
- DevKit: rules and workflow wrappers that decide when to use each tool

## Quick Start

1. Read `AGENTS.md`.
2. Pick the workflow in `docs/workflows.md`.
3. Use the relevant skill from `docs/skills.md`.
4. Track project decisions in your repo's `specs/`.
5. Use templates from `templates/` when checking artifacts or producing review output.

See `docs/getting-started.md` for the full guide.

## Install

Preview install:

```bash
scripts/install.sh --dry-run
```

Install skills and docs to the default Codex locations:

```bash
scripts/install.sh
```

Install to custom locations:

```bash
scripts/install.sh \
  --skills-target "$HOME/.codex/skills" \
  --docs-target "$HOME/.codex/devkit"
```

See `docs/install.md` for options and update guidance.

Development artifacts for DevKit itself live in `dev/`. They are kept for contributors and traceability, but are not required for day-to-day use.

See `docs/development-history.md` for how to read those artifacts.

## Version Summary

### v0.1

- Base agent rules
- Requirement gate
- New feature, brownfield, debug, and review flows
- First dogfood spec, plan, and tasks

### v0.2

- Artifact consistency checks
- Acceptance coverage matrix
- Review gate
- Reconcile flow

### v0.3

- Optional terse output workflows
- Terse review format
- Commit message guidance
- Context compression guidance

### v0.4

- Open-source hygiene files
- Usage documentation
- Integration guidance
- Dogfood reports

### v0.5

- Lightweight installer
- Install and update docs
- Workflow examples
- Changelog and release prep

### v0.5.1

- Installer preflight safety fix
- Development artifacts moved under `dev/`
- Verification script

## Version Rule

v0.5.1 is active. DevKit remains Markdown-first; the installer only copies or symlinks existing Markdown artifacts.

## License

MIT. See `LICENSE`.
