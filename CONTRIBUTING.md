# Contributing

Thank you for improving Trust the Diff: AppSec for Codex.

## Contribution Principles

- Keep the skill framework-agnostic unless a framework-specific security rule is evidence-based.
- Prefer concise instructions and move detailed material into `references/`.
- Do not add unsupported exploit claims, invented attack data, or unverified claims.
- Include a realistic, safe validation or regression scenario for meaningful workflow changes.
- Keep shell scripts portable and non-destructive.

## Pull Requests

1. Explain the user problem.
2. Describe the expected security behavior before and after the change.
3. Update the relevant docs or references.
4. Run `bash -n scripts/*.sh` and the Markdown checks used by the repository.

## Reporting Issues

Use GitHub Issues for reproducible bugs, missing security guidance, and documentation improvements. Do not submit credentials, private URLs, customer data, or exploit details that affect a live system.
