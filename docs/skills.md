# Skill Catalog

DevKit skills are thin workflow wrappers. They do not duplicate Spec Kit, GitNexus, or agent internals.

## Core Flow Skills

| Skill | Purpose |
| --- | --- |
| `devkit-requirement-gate` | Decide whether requirements are clear enough to proceed |
| `devkit-spec-flow` | Guide new feature work through spec, clarify, plan, tasks, and implementation |
| `devkit-brownfield-flow` | Guide changes to existing codebases with context and impact checks |
| `devkit-debug-flow` | Guide bugfix work from failure to root cause to verification |
| `devkit-review-flow` | Guide code review with findings first |

## Quality Gate Skills

| Skill | Purpose |
| --- | --- |
| `devkit-artifact-check` | Check consistency across spec, plan, tasks, and implementation |
| `devkit-coverage-matrix` | Map acceptance criteria to requirements, tasks, and verification |
| `devkit-review-gate` | Decide whether findings or gaps block progress |
| `devkit-reconcile-flow` | Bring artifacts back into sync after drift |

## Terse Skills

| Skill | Purpose |
| --- | --- |
| `devkit-terse-output` | Produce concise answers without losing technical substance |
| `devkit-terse-review` | Produce compact review findings |
| `devkit-commit-message` | Generate concise commit messages |
| `devkit-context-compress` | Compress long context while preserving decisions and next actions |

## How To Use A Skill

1. Open the skill `SKILL.md`.
2. Confirm the "When To Use" section matches the task.
3. Follow the workflow and checklist.
4. Use the output shape from the skill.
5. Update artifacts if behavior or decisions changed.

## Version Boundary

Use only skills present in the active version or earlier. Do not add future-version behavior unless explicitly approved.
