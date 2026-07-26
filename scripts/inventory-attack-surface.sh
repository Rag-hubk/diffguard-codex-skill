#!/usr/bin/env bash
set -euo pipefail

root="${1:-.}"

if [[ ! -d "$root" ]]; then
  echo "Not a directory: $root" >&2
  exit 64
fi

echo "==> Candidate entry points"
find "$root" -type f \
  \( -name '*.ts' -o -name '*.tsx' -o -name '*.js' -o -name '*.py' -o -name '*.go' -o -name '*.rb' -o -name '*.java' \) \
  -not -path '*/node_modules/*' -not -path '*/vendor/*' \
  | sed "s#^$root/##" \
  | grep -E '(^|/)(api|routes|controllers|handlers|webhooks|middleware|server|app)/|route\.' \
  | head -200 || true

echo
echo "==> Security-relevant configuration"
find "$root" -maxdepth 4 -type f \
  \( -name '.env*' -o -name 'Dockerfile*' -o -name 'docker-compose*.yml' -o -name '*.tf' -o -path '*/.github/workflows/*' \) \
  -not -path '*/node_modules/*' \
  | sed "s#^$root/##" \
  | head -200 || true

echo
echo "Review findings manually. This inventory is not a security verdict."
