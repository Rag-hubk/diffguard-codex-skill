#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 https://example.com" >&2
  exit 64
fi

base_url="${1%/}"

inspect() {
  local url="$1"
  echo
  echo "==> $url"
  curl --location --silent --show-error --max-time 20 \
    --user-agent "SEO-Technical-Readiness/1.0 (+https://github.com/<your-org>/seo-technical-readiness)" \
    --dump-header - --output /dev/null "$url" \
    | awk 'BEGIN { IGNORECASE=1 } /^HTTP\// || /^location:/ || /^content-type:/ || /^x-robots-tag:/ { print }'
}

inspect "$base_url/"
inspect "$base_url/robots.txt"
inspect "$base_url/sitemap.xml"
inspect "$base_url/sitemap_index.xml"
