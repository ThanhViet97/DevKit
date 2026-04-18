# Prerequisites

DevKit coordinates three tools: Spec Kit, GitNexus, and Caveman-inspired terse mode. This document describes what each tool does, how to verify it is available, and what to do if it is not.

## Spec Kit

### Role

Spec Kit provides the specification and planning artifacts that DevKit uses as the source of truth.

Used by: `devkit-spec-flow`, `devkit-artifact-check`, `devkit-coverage-matrix`, `devkit-reconcile-flow`.

### How To Verify

Spec Kit is available as an MCP server. Check that it appears in your agent's MCP configuration:

- **Codex / Gemini CLI / OpenCode**: check your MCP config for a `spec-kit` entry.
- **Claude Code**: check `.claude/settings.json` or your global `~/.claude/settings.json`.
- **Cursor**: check `.cursor/mcp.json` or the Cursor settings UI under MCP.
- **Cline**: check `cline_mcp_settings.json` in your VSCode config.

In a session, try invoking `/speckit.specify`. If it runs, Spec Kit is available.

### If Spec Kit Is Unavailable

Use the manual fallback:

1. Create `specs/<feature-name>/spec.md` in your project.
2. Document: goal, actors, behavior, acceptance criteria, assumptions.
3. Use `templates/artifact-consistency-check.md` to check coverage before implementation.

---

## GitNexus

### Role

GitNexus provides codebase understanding, execution flow exploration, and impact analysis.

Used by: `devkit-brownfield-flow`, `devkit-debug-flow`, `devkit-review-flow`.

### How To Verify

GitNexus is available as an MCP server. Check that it appears in your agent's MCP configuration (same locations as Spec Kit above).

In a session, try `mcp_gitnexus_list_repos`. If it returns indexed repos, GitNexus is available.

A repository must be indexed before GitNexus can serve context for it. To index a repo, run the GitNexus indexing command for your setup. Check the GitNexus documentation for your version.

### If GitNexus Is Unavailable

Each skill that uses GitNexus has a fallback in its `## Tool Requirements` section. The general fallback is:

- Use local `grep`, file reads, and test output to understand existing behavior.
- Identify likely callers and contracts manually before editing.
- Inspect execution paths through focused file reads.

This is slower and less complete than GitNexus, but sufficient for localized changes.

---

## Caveman Terse Mode

### Role

Caveman-inspired terse mode is a token-efficient output style built into DevKit. It is not an external tool.

Used by: all skills when terse mode is active.

### Setup

No setup required. Caveman terse mode is activated per-request:

- User asks for "short answer", "terse", "compact output", or "token-efficient".
- A template or workflow explicitly calls for compact output.

Use `devkit-terse-output` for general terse answers, `devkit-terse-review` for compact review findings.

Terse mode is **opt-in**. It is never the default output style.

---

## Summary

| Tool | Type | Setup required | Fallback available |
| --- | --- | --- | --- |
| Spec Kit | MCP server | Yes — add to MCP config | Yes — manual spec template |
| GitNexus | MCP server | Yes — add to MCP config + index repo | Yes — grep + file reads |
| Caveman terse mode | Built-in DevKit | No | n/a — opt-in only |
