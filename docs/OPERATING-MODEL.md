# Operating Model

Trust the Diff uses a five-step evidence loop:

```text
Threat model -> Data-flow trace -> Safe validation -> Root-cause fix -> Regression check
```

The sequence matters. Scanning first without business context creates false positives; patching before validation can hide a defect without proving the security property.

## Definition of Done

A confirmed finding has:

- a clear trust boundary and affected asset;
- a code/configuration location;
- an attack narrative with realistic prerequisites;
- a minimal, safe validation path;
- a remediation and verification plan.

A fixed finding additionally has a targeted test or equivalent repeatable check.
