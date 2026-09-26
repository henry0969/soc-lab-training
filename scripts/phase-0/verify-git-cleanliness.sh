#!/usr/bin/env bash
#
# Review what Git is about to track.
#

set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

git status --short

printf '\nPotentially sensitive files:\n'
find . -type f \
    \( -name '*.key' -o -name '*.pem' -o -name '*.p12' -o -name '*.pfx' -o -name '.env' \) \
    -print
