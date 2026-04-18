# Feature Spec: DevKit v0.6 Multi-Agent Adapters

## Overview

DevKit v0.6 adds a thin adapter layer so DevKit can be used with Codex, Claude Code, Cursor, Gemini CLI, OpenCode, and Cline without making Codex the default identity.

## Functional Requirements

- FR-001: Installer MUST require an explicit `--agent`.
- FR-002: Installer MUST support `codex`, `claude-code`, `cursor`, `gemini-cli`, `opencode`, `cline`, and `all`.
- FR-003: Installer MUST support `--agent-target` for project-local adapter files.
- FR-004: Cursor, Gemini CLI, OpenCode, Cline, and `all` installs MUST require `--agent-target`.
- FR-005: Codex install MUST keep supporting DevKit skills and docs.
- FR-006: Claude Code install MUST support DevKit skills and `CLAUDE.md`.
- FR-007: Project adapter installs MUST not overwrite existing files without `--force`.
- FR-008: Docs MUST describe supported agents and install commands.
- FR-009: DevKit MUST keep adapters thin and shared workflow behavior centralized.

## Acceptance Criteria

- AC-001: Running installer without `--agent` fails.
- AC-002: `--agent codex` installs skills and docs to the requested targets.
- AC-003: `--agent claude-code` installs skills and Claude memory rules.
- AC-004: `--agent all --agent-target <dir>` installs all project adapter files.
- AC-005: Project adapter conflict preflight leaves no partial files.
- AC-006: Docs list all six supported adapters.
- AC-007: Verification script passes.

## Verification

- Run `scripts/verify.sh`.
- Run `git diff --check`.
- Inspect `README.md`, `docs/install.md`, and `docs/agents.md`.

