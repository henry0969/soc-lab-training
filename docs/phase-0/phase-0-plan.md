# Phase 0 — Asset and Network Discovery

## Objective

Create an evidence-backed baseline of the SOC-LAB's assets, networks,
interfaces, addressing, routing and intended communication paths.

## Current lab assets

| Asset | Role | State | Notes |
|---|---|---|---|
| `ubuntu-monitor` | Monitoring / SOC workstation | Running during discovery | Multi-homed |
| `win10-victim` | Victim / endpoint | Running during discovery | Multi-homed |
| `parrot-attack-v2` | Attack / adversary simulation | May be shut off or suspended | Multi-homed |

## Known networks

| Network | Subnet | Libvirt bridge | Purpose |
|---|---|---|---|
| `soc-attack` | `192.168.100.0/24` | `virbr1` | Attack segment |
| `soc-monitor` | `192.168.50.0/24` | `virbr3` | Monitoring segment |
| `soc-victim` | `192.168.200.0/24` | `virbr2` | Victim segment |
| `soc-router` | `10.0.0.0/24` | `virbr4` | Router/NAT training segment |
| `default` | `192.168.122.0/24` | `virbr0` | Libvirt NAT / management access |

## Discovery tasks

- [ ] Inventory VMs
- [ ] Inventory VM interfaces
- [ ] Inventory libvirt networks
- [ ] Record MAC addresses
- [ ] Record IP addresses
- [ ] Record DHCP leases
- [ ] Record routing tables
- [ ] Record neighbour/ARP tables
- [ ] Verify intended connectivity
- [ ] Identify unexpected connectivity
- [ ] Create connectivity matrix
- [ ] Create baseline
- [ ] Review and sign off Phase 0

## Evidence rule

Do not overwrite raw evidence. Capture commands and outputs as dated files.

A baseline should be reproducible from the recorded evidence.
