---
name: seo-technical-readiness
description: Audit, diagnose, and safely improve technical SEO for public websites and codebases. Use for crawlability, indexability, robots.txt, XML sitemaps, redirects, canonical URLs, hreflang, SSR or prerender parity, metadata, structured data, Core Web Vitals investigations, and SEO regression review.
metadata:
  short-description: Evidence-based technical SEO audit and fixes
---

# SEO Technical Readiness

## Purpose

Turn a technical SEO request into a source-backed audit or a verified, narrowly scoped remediation. Optimize for crawlability, index consistency, initial HTML quality, and durable site architecture. Do not make ranking guarantees.

## Operating Modes

- **Audit**: inspect and report. Default when the user does not request changes.
- **Review**: inspect a diff, branch, or pull request for SEO regressions.
- **Fix**: edit the smallest source of truth only after the user requests implementation.
- **Verify**: validate a supplied implementation or release candidate without expanding scope.

## Rules

1. Respect `robots.txt`, rate limits, authentication, and the user's stated scope.
2. Start from observable behavior: final URL, HTTP status, raw HTML, rendered page only when needed, sitemap, and source route.
3. Distinguish intentional exclusions from defects. A `noindex` page or redirect is not a finding unless it conflicts with product intent, sitemaps, or internal links.
4. For JavaScript sites, compare initial response HTML with runtime output. Critical metadata must not depend solely on hydration.
5. Do not claim that a change will guarantee rankings, crawl frequency, indexation, traffic, or AI citations.
6. In fix mode, add a focused regression check whenever the repository has a suitable test or build surface.

## Workflow

### 1. Establish intent

Determine:

- target domain, repository, branch, or pull request
- relevant market and locales
- page types that should be indexable
- known symptoms and their source, if supplied
- whether this is audit, review, fix, or verification

If indexation intent is unknown, state the assumption before classifying exclusions as issues.

### 2. Map the public surface

Inspect:

- `robots.txt`, sitemap index, XML sitemaps, and declared canonical host
- final response and redirect path for representative URLs
- public routes, locale paths, status pages, and content pagination
- server-rendered HTML, titles, meta descriptions, canonical and robots directives
- JSON-LD and internal links

Run `scripts/inspect-seo-surface.sh <url>` for a lightweight HTTP inventory when network access is available. Read [references/audit-taxonomy.md](references/audit-taxonomy.md) for the evaluation matrix.

### 3. Find the source of truth

Trace every confirmed issue to the owning layer:

- router or framework route
- CMS/content model
- metadata helper or template
- deployment redirect configuration
- sitemap generator
- robots policy
- prerender or SSR build configuration

Prefer one root-cause fix over URL-by-URL patches.

### 4. Verify framework behavior

Read [references/framework-notes.md](references/framework-notes.md) when the site uses Next.js, Nuxt, Astro, SvelteKit, React Router, a headless CMS, or another rendering layer. Check final built output, not only component source.

### 5. Report or fix

For an audit or review, use [docs/REPORT-FORMAT.md](docs/REPORT-FORMAT.md).

For a fix:

1. state the root cause and intended change;
2. edit the smallest source of truth;
3. add or update a focused test, static assertion, or build inspection;
4. run relevant project checks;
5. re-check affected URLs or generated HTML;
6. summarize remaining recrawl or third-party processing uncertainty.

## Priority Guide

- **Critical**: important public pages are unavailable, blocked, globally `noindex`, or return incorrect server behavior.
- **High**: sitemap/canonical/redirect conflicts, broken locale alternates, missing initial metadata on major templates.
- **Medium**: duplicate URL paths, weak internal link routes, incomplete schema, repeated metadata defects.
- **Low**: isolated title length, alt text, Open Graph, or non-blocking markup opportunities.

Every finding needs evidence, affected URLs or source locations, user impact, root cause or uncertainty, and a concrete next action.

## Deliverables

Default deliverable: a concise Markdown report with confirmed defects separate from opportunities and normal exclusions. For substantial audits, produce the report in the repository or task workspace only when requested.

## Boundaries

Do not:

- use automated tools against a target without authorization or reasonable rate limiting;
- treat screenshots as proof of crawlability;
- invent Search Console or crawler data;
- remove `noindex`, redirects, or crawler restrictions without confirming intent;
- publish `llms.txt` pages or schema that describe unavailable products or obsolete URLs.
