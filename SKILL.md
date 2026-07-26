---
name: trust-the-diff-appsec-codex
description: Evidence-first application security audit, remediation, and regression verification for Codex. Use for threat modeling, security code review, authentication and authorization flaws, IDOR/BOLA, injection, webhooks, SSRF, uploads, secrets, dependencies, cloud/IaC, race conditions, and AI application security.
metadata:
  short-description: AppSec audit, fixes, and verification for Codex
---

# Trust the Diff: AppSec for Codex

## Purpose

Find and remediate real application security defects without converting assumptions into findings. Every reportable issue must identify a source location, attack path, security impact, and safe validation method.

## Modes

- **Audit**: read-only threat model and finding report. Default.
- **Review**: inspect a change set for security regressions.
- **Verify**: reproduce or disprove a suspected issue safely.
- **Fix**: implement a confirmed remediation with a regression test.
- **Hardening**: propose architectural options without code changes.

## Non-Negotiable Rules

1. Build or update the threat model before broad scanning.
2. Follow data flow from an untrusted source to a sensitive sink or authorization decision.
3. Treat UI restrictions as irrelevant unless the server/API enforces the same policy.
4. Do not target production, bypass access controls, perform credential attacks, or access data outside explicit authorization.
5. Do not log or reproduce real secrets. Redact identifiers and tokens in every artifact.
6. A weak pattern is not automatically a vulnerability. Mark missing proof as `Needs validation`.
7. In fix mode, patch the root cause and add a focused regression test whenever the repository supports one.

## Workflow

### 1. Model the system

Identify:

- externally reachable entry points and untrusted inputs;
- assets: user data, credentials, money, permissions, tenant boundaries, infrastructure;
- identities, auth/session mechanisms, and privileged roles;
- data stores, queues, webhooks, external APIs, file/object storage, cloud services;
- invariants that must never break.

### 2. Inventory the attack surface

Use `scripts/inventory-attack-surface.sh` as a lightweight starting point. Then read [references/appsec-taxonomy.md](references/appsec-taxonomy.md) and select relevant risk classes based on architecture.

### 3. Trace and validate

For each candidate, establish:

1. attacker-controlled source;
2. code path and trust-boundary crossing;
3. missing or bypassable control;
4. realistic impact;
5. safe local/test verification.

Read [references/validation-playbook.md](references/validation-playbook.md) before creating a test or proof of concept.

### 4. Report or remediate

For audits and reviews, use [docs/REPORT-FORMAT.md](docs/REPORT-FORMAT.md).

For fixes:

1. write a regression test or minimal reproduction;
2. implement the smallest root-cause fix;
3. test success and denial paths;
4. run relevant repository checks;
5. explain what remains outside the patch's scope.

## Severity

- **Critical**: likely unauthorized access to high-value data, control, or funds at broad scale.
- **High**: material unauthorized access, execution, or integrity loss with realistic prerequisites.
- **Medium**: constrained exposure, abuse, or defense-in-depth gap with meaningful impact.
- **Low**: limited impact or hard-to-exploit weakness.
- **Informational**: design observation; never phrase it as an exploitable vulnerability.

Severity depends on impact, exposure, prerequisites, and compensating controls, not the vulnerability label alone.

## Deliverables

Return concise, evidence-backed findings separated from hypotheses and hardening opportunities. For substantial work, produce a threat model and report only when the user requests files.

## Do Not

- run destructive commands, persistence, scanners against third-party targets, or production exploit payloads;
- claim compliance, penetration-test coverage, or absence of vulnerabilities;
- use generated examples that include working credentials or real target URLs;
- fix unrelated code while remediating a finding.
