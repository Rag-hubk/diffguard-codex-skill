# SEO Technical Readiness

> A Codex skill for auditing and improving the technical foundations that make websites crawlable, indexable, and understandable by search engines.

`SEO Technical Readiness` turns a vague request such as "check our technical SEO" into an evidence-based workflow: inspect the site and repository, identify the source of a problem, make narrowly scoped fixes when requested, and verify the generated output.

It is built for product teams, agencies, and SaaS teams working with modern JavaScript applications, documentation sites, e-commerce storefronts, and multilingual websites.

## What It Covers

- Crawlability: `robots.txt`, XML sitemaps, internal links, HTTP status codes, redirect chains
- Indexability: canonical tags, `noindex`, duplicate URL patterns, pagination, hreflang
- JavaScript SEO: SSR, SSG, prerendering, client-rendering gaps, HTML parity
- On-page technical signals: titles, descriptions, heading hierarchy, Open Graph, image alt text
- Structured data: JSON-LD discovery, validation, and implementation opportunities
- Performance and usability signals: Core Web Vitals investigation, mobile rendering, accessibility basics
- AI-readable infrastructure: `llms.txt`, content route parity, crawl-policy review
- Release safety: focused verification after routing, metadata, CMS, or framework changes

The skill does not promise rankings, traffic, or inclusion in AI-generated answers. It improves the technical conditions that support discoverability.

## Why This Exists

Technical SEO failures are often created by normal product work: a new router misses a prerendered page, a CMS migration leaves stale canonical URLs, or a JavaScript deployment ships metadata only after hydration.

This skill makes the review repeatable. It starts with the actual route and rendered HTML, then follows evidence back to the source of truth. It avoids generic audit checklists and avoids treating normal Search Console exclusions as defects by default.

## Install

### Codex

Copy this repository into your personal Codex skills directory:

```bash
git clone https://github.com/<your-org>/seo-technical-readiness.git \
  ~/.codex/skills/seo-technical-readiness
```

Restart Codex or start a new task after installation.

### Project-Local Use

For a repository-specific workflow, copy the `SKILL.md`, `references/`, and `scripts/` directories into the location your Codex setup uses for project skills. Keep project commands and deployment rules in `AGENTS.md`; keep the reusable SEO procedure here.

## Example Prompts

```text
Audit the technical SEO of https://example.com. Inspect robots, sitemap,
canonical URLs, indexability, rendered HTML, and structured data. Return
evidence and a prioritized remediation plan. Do not modify the site.
```

```text
Our Next.js migration caused some docs pages to disappear from Google.
Find the route, rendering, sitemap, and canonical mismatch. Fix the source
of truth, add a regression check, and run the relevant build verification.
```

```text
Review this pull request for SEO regressions. Focus on routes, metadata,
redirects, sitemap output, hreflang, and initial HTML. Report only
reproducible issues with file references.
```

## Workflow

1. Establish scope: production URL, repository, changed paths, markets, and intended indexable pages.
2. Inspect the crawl path: final URLs, status codes, redirects, robots, and sitemaps.
3. Compare source routes, generated HTML, canonical tags, and internal links.
4. Verify rendering and metadata in the initial HTML instead of assuming client-side code is visible to crawlers.
5. Classify findings by impact and evidence.
6. When asked to fix: change the smallest source of truth, add a targeted regression test or build check, and re-verify output.

See [the operating model](docs/OPERATING-MODEL.md), [report format](docs/REPORT-FORMAT.md), and the [skill instructions](SKILL.md).

## Repository Layout

```text
.
├── SKILL.md                  # Codex workflow and guardrails
├── references/
│   ├── audit-taxonomy.md     # Technical SEO review matrix
│   └── framework-notes.md    # SSR/SSG and verification patterns
├── scripts/
│   └── inspect-seo-surface.sh
├── docs/
│   ├── OPERATING-MODEL.md
│   └── REPORT-FORMAT.md
└── .github/                  # OSS contribution and CI defaults
```

## Scope and Safety

- Respect `robots.txt`, rate limits, authentication boundaries, and the target's terms.
- Do not crawl private paths, bypass access control, or change production configuration without an explicit request.
- Treat third-party crawler behavior as variable. A technically correct page can still be delayed, excluded, or ranked differently by each search product.
- Keep `llms.txt` factual and aligned with public, canonical pages. It is a discoverability aid, not a guarantee of AI citations.

## Maintained By

Built and maintained by [Lynto Labs](https://lyntolabs.pro/), a product development studio for SaaS platforms, AI integrations, Telegram-first products, and operational software.

## Contributing

Contributions are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request. Please include a realistic failing scenario or a source-backed change when updating the audit logic.

## License

MIT. See [LICENSE](LICENSE).
