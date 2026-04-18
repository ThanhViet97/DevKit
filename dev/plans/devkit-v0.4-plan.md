# DevKit v0.4 Plan

## Goal

DevKit v0.4 makes the repository usable by another developer. It adds open-source hygiene, usage documentation, and dogfood reports using the quality gates introduced in earlier versions.

## Scope v0.4

- Add license, contribution, security, and ignore files.
- Improve the README as an entrypoint.
- Add getting started, workflow, skill catalog, and integration docs.
- Add dogfood reports for artifact consistency, acceptance coverage, and review gate.
- Add v0.4 spec, plan, and tasks.

## Non-Goals v0.4

- Do not add executable install automation.
- Do not add Cavekit integration.
- Do not add automatic parallel build orchestration.
- Do not add plugin marketplace behavior.
- Do not enable terse mode globally.

## New Files

```text
LICENSE
CONTRIBUTING.md
SECURITY.md
.gitignore
docs/getting-started.md
docs/workflows.md
docs/skills.md
docs/spec-kit-and-gitnexus.md
reports/devkit-v0.4-artifact-check.md
reports/devkit-v0.4-coverage-matrix.md
reports/devkit-v0.4-review-gate.md
specs/004-devkit-v0.4/
```

## Success Criteria

- A new developer can understand what DevKit is from the README.
- A new developer can apply DevKit manually from the getting started guide.
- Contributors can understand how to propose changes safely.
- Security reporting expectations are documented.
- Dogfood reports show that v0.4 artifacts are consistent and covered.
