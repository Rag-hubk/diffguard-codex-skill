# Trust the Diff: AppSec for Codex

> An evidence-first application security skill for Codex: find real attack paths, make narrow fixes, and verify them with regression tests.

Trust the Diff helps product teams turn security review into normal engineering work. It inventories a codebase, builds a threat model, traces untrusted input to sensitive operations, validates likely findings safely, and implements the smallest durable remediation when asked.

It is designed for SaaS products, APIs, dashboards, payments, webhooks, multi-tenant systems, file pipelines, cloud integrations, and AI-enabled applications.

## Why "Trust the Diff"?

Security findings should be tied to a concrete data flow, source location, security boundary, and verification path. A long checklist without evidence is noise. A patch without a regression test is a future incident waiting to happen.

## What It Reviews

- Authentication, sessions, OAuth/OIDC, MFA, password recovery, rate limits
- Authorization, BOLA/IDOR, RBAC/ABAC, tenant isolation, mass assignment
- Injection: SQL/NoSQL, command, template, path traversal, deserialization
- Webhooks, payments, idempotency, replay defense, race conditions
- SSRF, URL fetchers, file uploads, egress, cloud metadata access
- Secrets, logging, CI/CD, dependencies, lockfiles, IaC, third-party integrations
- Browser security: CSRF, CORS, cookies, XSS, security headers
- AI application surfaces: prompt injection, tool permissions, RAG data boundaries, output handling

## Install

```bash
git clone https://github.com/<your-org>/trust-the-diff-appsec-codex.git \
  ~/.codex/skills/trust-the-diff-appsec-codex
```

Restart Codex or start a new task after installation.

## Example Prompts

```text
Use Trust the Diff to review this repository for application security issues.
Build a threat model first. Report only evidence-backed findings with source
locations, attack paths, severity, and safe validation steps. Do not modify code.
```

```text
Audit the payment webhook and entitlement flow. Check signature validation,
replay protection, idempotency, authorization, and concurrent requests.
Implement only confirmed fixes with regression tests.
```

```text
Review this pull request for security regressions. Focus on changed trust
boundaries, authentication, authorization, untrusted input, secrets, and
external requests. Do not report hypothetical style concerns.
```

## Modes

| Mode | Purpose |
|---|---|
| `audit` | Threat model and source-backed findings. Default. |
| `review` | Security regression review for a diff, branch, or pull request. |
| `verify` | Safely confirm a supplied finding or remediation. |
| `fix` | Apply a minimal confirmed remediation and regression test. |
| `hardening` | Propose architecture-level improvements without changing code. |

## Workflow

1. Map entry points, assets, identities, trust boundaries, and security invariants.
2. Trace user-controlled input and privileged actions through code and configuration.
3. Classify candidates using the AppSec taxonomy.
4. Validate exploitability safely in local, test, or explicitly authorized environments.
5. Report findings with evidence, impact, prerequisites, and a targeted remediation.
6. In `fix` mode, add a regression test, patch the root cause, and verify relevant checks.

See [the operating model](docs/OPERATING-MODEL.md), [report format](docs/REPORT-FORMAT.md), and the [skill instructions](SKILL.md).

## Repository Layout

```text
.
├── SKILL.md
├── references/
│   ├── appsec-taxonomy.md
│   └── validation-playbook.md
├── scripts/
│   └── inventory-attack-surface.sh
├── docs/
│   ├── OPERATING-MODEL.md
│   └── REPORT-FORMAT.md
└── .github/
```

## Safety Boundaries

- Do not attack production, use real credentials, exfiltrate data, or bypass authorization.
- Keep proof-of-concepts minimal, local, and non-destructive.
- Mark unverified hypotheses as `Needs validation`; do not present them as vulnerabilities.
- Never print, commit, or reproduce secrets in reports, tests, or issue trackers.

## Maintained By

Built and maintained by [Lynto Labs](https://lyntolabs.pro/), a product development studio for SaaS platforms, AI integrations, Telegram-first products, and operational software.

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md). Contributions should include a reproducible, safe scenario and must not contain exploit code that can target real systems.

## License

MIT. See [LICENSE](LICENSE).
