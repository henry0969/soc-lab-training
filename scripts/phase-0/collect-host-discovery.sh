#!/usr/bin/env bash
#
# Collect read-only Phase 0 host/libvirt discovery evidence.
#
# Usage:
#   ./scripts/phase-0/collect-host-discovery.sh
#

set -Eeuo pipefail
IFS=$'\n\t'

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
STAMP="$(date '+%Y%m%d-%H%M%S')"
OUT="$ROOT/evidence/phase-0/raw/${STAMP}_debian_host-discovery.txt"

mkdir -p "$(dirname "$OUT")"

{
    echo "SOC-LAB Phase 0 — Host Discovery"
    echo "Timestamp: $(date --iso-8601=seconds)"
    echo "Host: $(hostname)"
    echo

    echo "===== virsh list --all ====="
    sudo virsh list --all
    echo

    echo "===== virsh net-list --all ====="
    sudo virsh net-list --all
    echo

    for vm in parrot-attack-v2 ubuntu-monitor win10-victim; do
        echo "===== dominfo $vm ====="
        sudo virsh dominfo "$vm" || true
        echo
        echo "===== domiflist $vm ====="
        sudo virsh domiflist "$vm" || true
        echo
    done

    for net in default soc-attack soc-monitor soc-victim soc-router; do
        echo "===== net-info $net ====="
        sudo virsh net-info "$net" || true
        echo
        echo "===== net-dumpxml $net ====="
        sudo virsh net-dumpxml "$net" || true
        echo
        echo "===== net-dhcp-leases $net ====="
        sudo virsh net-dhcp-leases "$net" || true
        echo
    done

    echo "===== ip -br addr ====="
    ip -br addr
    echo

    echo "===== ip route ====="
    ip route
    echo

    for bridge in virbr0 virbr1 virbr2 virbr3 virbr4; do
        echo "===== ip addr show $bridge ====="
        ip addr show "$bridge" || true
        echo
    done
} | tee "$OUT"

printf '\nEvidence written to:\n%s\n' "$OUT"
