# Technical SEO Audit Taxonomy

Use this reference when performing a full audit. Select the relevant rows rather than mechanically reporting every category.

| Area | Verify | Common root causes |
|---|---|---|
| Crawlability | `robots.txt`, sitemap reachability, HTTP status, crawl paths | accidental disallow, stale deploy config, private origin |
| Indexability | `noindex`, canonical, duplicate URLs, pagination | template defaults, parameters, inconsistent slash/host rules |
| Routing | real route, final URL, redirects, error handling | client-only routes, missing rewrites, redirect chains |
| Initial HTML | title, description, canonical, robots, primary content | client-side metadata, hydration-only rendering |
| Sitemaps | only canonical, indexable 200 URLs | static lists, CMS deletions, locale drift |
| Internal links | final canonical URLs, descriptive anchors, depth | old links, locale fallback, client navigation mismatch |
| International SEO | language/region equivalents and hreflang targets | nonexistent alternates, self-reference errors, locale redirects |
| Structured data | valid JSON-LD that matches visible content | generic templates, stale product data, invalid nesting |
| Performance | field/lab evidence, render-blocking causes | image payload, JavaScript, fonts, server latency |
| AI-readable surface | public facts, crawl policy, `llms.txt` consistency | unsupported claims, dead links, undocumented services |

## Evidence Standard

Use direct evidence in descending order:

1. final HTTP response and raw HTML
2. deployed configuration or generated build artifact
3. source files that clearly control behavior
4. verified platform data supplied by the user
5. reasonable hypothesis, explicitly marked as unverified

Do not convert category-level best practices into confirmed findings without evidence.

## Common False Positives

- An intentionally private, staged, or thank-you page with `noindex`.
- A redirect from `http` to `https`, or from a legacy path to a final canonical URL.
- A URL excluded because a canonical equivalent is indexable.
- A sparse page whose purpose is transactional rather than informational.
- A crawler-specific policy intentionally chosen by the site owner.
