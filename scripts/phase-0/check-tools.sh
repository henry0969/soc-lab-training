#!/usr/bin/env bash
#
# Check for useful Phase 0 host-side tools.
# This script does not install anything.
#

set -u

tools=(
    virsh
    ip
    awk
    sed
    grep
    sha256sum
    git
)

printf '%-15s %s\n' "COMMAND" "STATUS"
printf '%-15s %s\n' "---------------" "------"

missing=0

for tool in "${tools[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        printf '%-15s %s\n' "$tool" "OK"
    else
        printf '%-15s %s\n' "$tool" "MISSING"
        missing=1
    fi
done

exit "$missing"
