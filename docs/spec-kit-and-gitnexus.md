# Spec Kit And GitNexus

DevKit is designed to sit above Spec Kit and GitNexus.

It does not vendor or replace either tool.

## Spec Kit Role

Use Spec Kit for:

- project principles
- feature specification
- clarification
- technical planning
- task generation
- implementation artifact flow
- cross-artifact analysis

Typical flow:

```text
specify -> clarify -> plan -> tasks -> analyze -> implement
```

DevKit adds guardrails around this flow. It decides when requirements are too unclear, when coverage should be checked, and when artifacts need reconciliation.

## GitNexus Role

Use GitNexus for:

- repo context
- codebase exploration
- execution flow understanding
- impact analysis
- debugging
- refactor safety
- review support

Typical brownfield flow:

```text
context -> query/explore -> impact -> edit -> detect changes/review
```

DevKit expects brownfield work to inspect existing code and likely impact before editing.

## Boundary

DevKit should not:

- copy Spec Kit source
- copy GitNexus source
- hide external tool behavior behind unclear wrappers
- require either tool for simple documentation-only work

DevKit should:

- document when each tool should be used
- keep artifacts traceable
- make missing requirements and verification gaps visible
- preserve user decisions in specs and reports
