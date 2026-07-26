# Framework Notes

## General Rule

Verify the deployed response and the built artifact. Component code is not proof that a crawler receives the same title, canonical, robots directive, JSON-LD, or content.

## Next.js

- Inspect App Router metadata exports and route-level `generateMetadata`.
- Verify `sitemap.ts`, `robots.ts`, redirects, locale middleware, and `notFound()` behavior.
- Check that important content and metadata are available in the initial response for public pages.

## Nuxt

- Inspect route rules, server routes, `useSeoMeta`, `useHead`, and prerender configuration.
- Confirm generated routes and locale alternates match the deployed path format.

## Astro and Static Site Generators

- Inspect generated `dist/` output, route lists, content collections, and adapter redirects.
- Ensure asset or content-page removals also update sitemap and internal links.

## Single-Page Applications

- Determine whether public, indexable routes have SSR, prerendering, or an approved rendering strategy.
- Verify error status codes are emitted by the server. Search engines generally cannot rely on client-rendered error states.
- Keep canonical and robots directives identical between raw HTML and client output.

## Headless CMS

- Trace slugs, publish state, locale fields, redirects, canonical host, and deletion events.
- Check that CMS preview, draft, and production environments cannot leak into sitemap output.
