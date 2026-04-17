# Example: Brownfield Change

## Request

Change the existing login flow to require email verification before allowing access.

## Workflow

```text
request
-> requirement gate
-> code context
-> impact analysis
-> update spec
-> plan/tasks
-> artifact check
-> edit
-> test
-> reconcile
```

## Requirement Gate

Status: `blocked`

Need clarification:

1. Should existing unverified users be logged out immediately?
2. Which routes remain accessible before verification?

## Code Context

Inspect:

- auth middleware
- login controller
- user model
- route guards
- existing auth tests

## Impact Analysis

Likely affected:

- session creation
- route authorization
- onboarding flow
- email verification state
- tests for login and protected routes

## Artifact Check

Status: `blocked`

Blocker:

- Acceptance criteria do not state how existing unverified users are handled.

## Reconcile

Update `spec.md`:

- Existing unverified users keep current sessions until next login.
- Billing and account settings routes require verification.

Add task:

- Add regression tests for existing unverified users.
