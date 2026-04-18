# Security Policy

## Supported Versions

DevKit is pre-1.0. The active version is documented in `AGENTS.md` and `README.md`.

Security fixes should target the active version first.

## Reporting A Vulnerability

If you find a security issue in DevKit guidance, templates, or workflows, please open a private report through the repository host if available.

If private reporting is not available, open an issue with minimal details and avoid publishing exploit instructions.

## Security Scope

Relevant issues include:

- guidance that encourages unsafe command execution
- templates that leak secrets or sensitive paths
- workflows that skip security-critical verification
- instructions that encourage copying untrusted code without review
- supply-chain risks introduced by future automation

## Out Of Scope

DevKit has no runtime service. v0.5 introduced a local shell installer, so installer safety issues are in scope for this repository.

Runtime vulnerabilities in external tools such as Spec Kit, GitNexus, Codex, or other agents should be reported to those projects.
