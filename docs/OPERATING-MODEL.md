# Operating Model

## Design Goal

Technical SEO work should be reproducible engineering work. This skill uses a small evidence loop:

```text
Intent -> Observe -> Trace -> Change -> Verify
```

The loop prevents two common failures:

- diagnosing source code without checking the public response;
- changing a crawler-facing artifact without testing the build or final URL.

## What "Ready" Means

A page is technically ready when its intended public URL resolves correctly, its critical metadata is present in initial HTML, its crawl directives do not contradict intent, and internal/sitemap references point to the same canonical destination.

Readiness is not a claim about ranking position. Search systems make their own crawl, indexing, and ranking decisions.

## Recommended Team Setup

- Keep app-specific commands, environments, release steps, and URL policy in `AGENTS.md`.
- Keep the skill reusable and independent of any one framework.
- Add a lightweight release check for sitemap URLs, `noindex`, canonical host, and representative rendered pages.
- Treat SEO regressions as release regressions when they affect revenue, acquisition, documentation, or support surfaces.
