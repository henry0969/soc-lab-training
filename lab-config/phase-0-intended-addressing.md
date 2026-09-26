# Phase 0 — Intended Addressing

This file is the **design record**, not automatically discovered truth.

Populate and approve it before using it to classify paths as expected or unexpected.

| Asset            | NIC        | Network     | Intended IPv4   | Gateway       | Purpose           |
|------------------|------------|-------------|-----------------|---------------|-------------------|
| parrot-attack-v2 | enp1s0     | soc-attack  | 192.168.100.90  | none          | Attack            |
| parrot-attack-v2 | enp7s0     | soc-monitor | 192.168.50.29   | none          | Monitoring access |
| parrot-attack-v2 | enp8s0     | default     | 192.168.122.91  | 192.168.122.1 | NAT/management    |
| ubuntu-monitor   | enp1s0     | soc-monitor | 192.168.50.20   | none          | Monitoring        |
| ubuntu-monitor   | enp7s0     | soc-victim  | 192.168.200.73  | none          | Victim monitoring |
| ubuntu-monitor   | enp8s0     | default     | 192.168.122.26  | 192.168.122.1 | NAT/management    |
| win10-victim     | Ethernet 3 | default     | 192.168.122.153 | 192.168.122.1 | NAT/management    |
| win10-victim     | Ethernet 4 | soc-monitor | 192.168.50.16   | none          | Monitoring        |
| win10-victim     | Ethernet 5 | soc-victim  | 192.168.200.98  | none          | Victim            |

**Review before treating this table as authoritative.**
