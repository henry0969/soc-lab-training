# SOC-LAB Training Platform

A deliberately structured home SOC/NOC training environment built around
practical operational skills.

## Current phase

**Phase 0 — Asset and Network Discovery**

Phase 0 establishes a known-good baseline of:

- virtual machines
- virtual networks
- interfaces and MAC addresses
- IP addressing
- DHCP information
- routing
- neighbour/ARP information
- connectivity
- intended communication paths
- unexpected communication paths
- evidence and documentation

## Safety boundary

The training scripts in this repository are intended to **observe and document**
the lab.

They should not silently modify:

- libvirt networks
- VM definitions
- VM disks
- firewall rules
- routing
- DNS/DHCP
- operating-system configuration

Changes should be explicit, documented and recoverable.

## Training objective

The lab is being developed as a practical training platform for NOC/SOC
employment skills rather than simply as a collection of virtual machines.

The workflow is:

1. Discover
2. Record
3. Verify
4. Baseline
5. Detect deviation
6. Investigate
7. Respond
8. Document

See `docs/phase-0/phase-0-plan.md`.
