# AppSec Report Format

```markdown
# Trust the Diff Security Review

**Target:** [repository, branch, or service]
**Mode:** Audit | Review | Verify | Fix | Hardening
**Scope:** [included paths, environments, assumptions]
**Date:** [YYYY-MM-DD]

## Threat Model

- **Assets:**
- **Entry points:**
- **Trust boundaries:**
- **Security invariants:**

## Confirmed Findings

### [Severity] Finding title

- **Location:** `path/to/file.ext:line`
- **Attack path:** [input -> missing control -> impact]
- **Impact:** [concrete confidentiality, integrity, availability, or financial effect]
- **Prerequisites:** [attacker capabilities]
- **Evidence:** [code/config/test result]
- **Safe validation:** [local/test steps]
- **Remediation:** [root-cause fix]
- **Verification:** [test/check]

## Needs Validation

[Candidates lacking sufficient proof.]

## Hardening Opportunities

[Non-vulnerability improvements and tradeoffs.]

## Checks Performed

[Commands, tests, and coverage limitations.]
```
