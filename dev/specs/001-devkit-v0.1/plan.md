# Implementation Plan: DevKit v0.1

## Technical Context

- Repository type: lightweight workflow/documentation kit
- Primary artifacts: Markdown rules, skills, specs, and tasks
- Runtime code: none in v0.1
- External tools: Spec Kit and GitNexus remain external

## Architecture

DevKit v0.1 is organized as:

```text
AGENTS.md
docs/
  devkit-v0.1-plan.md
skills/
  devkit-requirement-gate/
  devkit-spec-flow/
  devkit-brownfield-flow/
  devkit-debug-flow/
  devkit-review-flow/
specs/
  001-devkit-v0.1/
```

## Design Decisions

- Use Markdown artifacts only for v0.1.
- Keep skills as thin workflow wrappers.
- Keep external tools decoupled.
- Encode the user approval boundary in `AGENTS.md`.
- Use ASCII in repository files unless there is a strong reason to add non-ASCII content.

## Risk Management

- Risk: Workflow becomes too complex.
  Decision: Keep v0.1 to rules and five workflow skills.

- Risk: DevKit duplicates Spec Kit or GitNexus.
  Decision: Reference those tools by role only; do not copy internals.

- Risk: Later versions are implemented too early.
  Decision: Add explicit version boundary in `AGENTS.md`.

## Verification Plan

- List files with `rg --files`.
- Validate each skill has `name` and `description` frontmatter.
- Confirm v0.1 artifacts exist.
- Confirm no v0.2/v0.3 directories are created.
