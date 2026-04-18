# Changelog

All notable changes to DevKit are documented here.

## v0.6.0 - 2026-04-18

### Added

- Added agent adapters for Codex, Claude Code, Cursor, Gemini CLI, OpenCode, and Cline.
- Added `docs/agents.md` and `adapters/` with per-agent installation notes and templates.
- Added `--agent` and `--agent-target` installer options.
- Added project adapter install support for `--agent all`.

### Changed

- Installer now requires an explicit `--agent` instead of assuming Codex.
- Docs now present DevKit as an agent-neutral workflow kit.
- Verification now covers multi-agent adapter installs and project adapter preflight behavior.

## v0.5.1 - 2026-04-18

### Fixed

- Fixed installer partial-install behavior by adding a preflight conflict check before copying or symlinking files.

### Changed

- Moved development specs, plans, and dogfood reports under `dev/` so the root repo is cleaner for normal users.
- Installer no longer installs development history by default.
- Added `--include-dev` to install development artifacts when needed.
- Added `scripts/verify.sh` for local installer verification.

## v0.5.0 - 2026-04-18

### Added

- Added `scripts/install.sh` with copy/symlink modes, dry-run, custom targets, and force-protected replacement.
- Added `docs/install.md` with install, update, and target repo usage guidance.
- Added examples for new feature, brownfield change, review, and context compression workflows.
- Added v0.5 spec, plan, tasks, and dogfood reports.

### Changed

- Updated active version metadata to v0.5.
- Updated README with install guidance and v0.5 summary.

### Notes

- DevKit remains Markdown-first.
- No package-manager distribution, unapproved external integrations, parallel build orchestration, plugin marketplace behavior, or global terse mode was added.

## v0.4.0 - 2026-04-18

### Added

- Added MIT license, `.gitignore`, contribution guide, and security policy.
- Added getting started, workflow, skill catalog, and Spec Kit/GitNexus integration docs.
- Added dogfood artifact check, coverage matrix, and review gate reports.

## v0.3.0 - 2026-04-18

### Added

- Added optional terse output workflows.
- Added terse review, commit message, and context compression templates.

## v0.2.0 - 2026-04-18

### Added

- Added artifact consistency checks.
- Added acceptance coverage matrix.
- Added review gate and reconcile flow.

## v0.1.0 - 2026-04-18

### Added

- Added base agent rules.
- Added requirement gate, spec flow, brownfield flow, debug flow, and review flow.
- Added first dogfood spec, plan, and tasks.
