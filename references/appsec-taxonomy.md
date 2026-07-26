# Application Security Taxonomy

Select relevant classes after understanding the architecture. Do not mechanically report every row.

| Area | Core question | Typical evidence |
|---|---|---|
| Authentication | Can identity be forged, reused, recovered, or brute-forced? | session issuance, OAuth callbacks, rate limits, reset tokens |
| Authorization | Is every object/action authorized server-side for this actor and tenant? | ID-to-query path, policy checks, role enforcement |
| Injection | Can untrusted input alter a command, query, path, template, or interpreter? | source-to-sink flow, encoding, parameterization |
| Browser boundary | Can another origin act as a user or read sensitive data? | CORS, CSRF, cookie flags, XSS sinks |
| Webhooks/payments | Are sender authenticity, freshness, replay, and idempotency enforced? | signature verification, timestamp, event store, transaction logic |
| SSRF/uploads | Can input reach private services or execute/serve dangerous files? | URL validation, DNS/IP controls, storage/serving pipeline |
| Concurrency | Can concurrent requests violate a money, inventory, or entitlement invariant? | transactions, locks, unique constraints, idempotency keys |
| Secrets/logging | Can credentials, PII, or tokens leak through source, logs, CI, or errors? | config, log calls, traces, artifact settings |
| Supply chain | Can a dependency, CI action, package source, or build step execute untrusted code? | lockfiles, provenance, version pinning, CI workflow |
| Cloud/IaC | Are public exposure and identity permissions deliberately constrained? | IAM, storage, metadata access, network rules |
| AI application | Can untrusted model input cross data/tool boundaries? | prompt assembly, tool allowlists, RAG ACLs, output validation |

## Common False Positives

- A UUID does not replace authorization, but an opaque ID alone is not evidence of IDOR.
- A missing browser header is not always exploitable without a relevant flow.
- A dependency version is not automatically vulnerable unless it is affected and reachable.
- A secret-looking string may be a test fixture; establish provenance before reporting.
