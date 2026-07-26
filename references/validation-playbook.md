# Safe Validation Playbook

## Standard

Validate only in local, test, sandbox, or explicitly authorized environments. Favor negative tests and observability over exploit automation.

## Authorization

- Create two test principals in different roles or tenants.
- Attempt the same object/action through the server/API.
- Assert denial, non-disclosure, and audit behavior where applicable.

## Webhooks

- Use synthetic payloads and test keys.
- Test invalid signatures, stale timestamps, replayed event IDs, duplicate delivery, and out-of-order events.
- Assert no entitlement, balance, or state change occurs on rejection.

## SSRF

- Stub the HTTP client or use a local controlled endpoint.
- Test private/reserved IP literals, redirects, DNS rebinding-resistant validation, and allowlist behavior.
- Never request cloud metadata endpoints in a real environment.

## File Uploads

- Use harmless sample files.
- Test MIME/content mismatch, dangerous extensions, size limits, storage isolation, and download headers.
- Confirm uploaded content is not executable by the application origin.

## Secrets

- Use known fake marker tokens in test fixtures.
- Verify redaction at log and error boundaries.
- Never include an actual secret in a regression test.
