# Development History

DevKit keeps its own development artifacts under `dev/`.

These files are useful for contributors and maintainers. They are not required for normal usage.

## Layout

```text
dev/
  plans/    Version plans and decision notes
  specs/    Dogfood specs, plans, and tasks
  reports/  Dogfood artifact checks, coverage matrices, and review gates
```

## Why Keep This

The `dev/` directory shows how DevKit was built using its own workflow:

- requirements are captured as specs
- work is broken into plans and tasks
- quality gates are recorded as reports
- version scope is traceable over time

## When To Read It

Read `dev/` when:

- contributing a behavior-changing update
- checking why a version decision was made
- preparing a new release
- reviewing whether a change violates previous scope boundaries

Normal users can start with:

- `README.md`
- `docs/getting-started.md`
- `docs/install.md`
- `docs/workflows.md`
- `docs/skills.md`
