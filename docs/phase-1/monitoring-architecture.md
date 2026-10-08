# Phase 1 Monitoring Architecture

## Status

PLANNED

## Purpose

This document defines the monitoring architecture for Phase 1 of the
SOC-LAB Training Platform.

Phase 1 focuses on establishing visibility across the lab environment.
The purpose is to ensure network activity can be observed, captured,
stored, and reviewed before introducing more advanced detection,
investigation, or response capabilities.

This phase prioritises telemetry collection and validation.

## Architectural Context

Phase 0 validation confirmed that the current SOC-LAB architecture is
multi-homed rather than router-centric.

Current monitoring targets participate in multiple network segments:

- ubuntu-monitor
- win10-victim
- parrot-attack-v2

Phase 0 evidence also confirmed:

- soc-monitor is active and in use
- soc-victim is active and in use
- soc-attack is active and in use
- default NAT is active and in use
- soc-router exists but currently has no attached systems

As a result, Phase 1 visibility activities focus on:

- Interface identification
- Interface-to-network mapping
- Packet observation
- Traffic source validation
- Telemetry collection

rather than inter-network routing analysis.

The primary monitoring challenge is determining which interfaces
provide visibility into relevant traffic flows within the multi-homed
lab environment.

---

# Monitoring Objectives

The monitoring platform must be capable of:

- Observing network communications
- Capturing packet-level evidence
- Recording telemetry from monitored assets
- Retaining evidence for later analysis
- Supporting future detection capabilities
- Providing repeatable validation procedures

Primary Question:

> Can normal and abnormal network activity be observed, captured and
> retained for analysis?

---

# Lab Scope

## Monitored Systems

| System           | Role                                   |
|------------------|----------------------------------------|
| ubuntu-monitor   | Monitoring and packet capture platform |
| win10-victim     | Simulated user workstation             |
| parrot-attack-v2 | Simulated attacker workstation         |

### Monitored Networks

| Network     | Subnet           | Purpose                           |
|-------------|------------------|-----------------------------------|
| soc-monitor | 192.168.50.0/24  | Monitoring and management traffic |
| soc-victim  | 192.168.200.0/24 | Victim workstation traffic        |
| soc-attack  | 192.168.100.0/24 | Attack traffic                    |
| default     | 192.168.122.0/24 | Internet access via NAT           |
| soc-router  | 10.0.0.0/24      | Reserved future infrastructure    |

---

## Reserved Infrastructure

### soc-router Network

The SOC-LAB environment contains a provisioned libvirt network named
`soc-router`.

Network Details:

```text
Network: 10.0.0.0/24
Bridge: virbr4
```

Phase 0 validation identified the following characteristics:

- Network exists and is active in libvirt
- No virtual machines are currently attached
- No DHCP leases were observed
- Bridge interface `virbr4` is currently DOWN

Current Status:

```text
Provisioned but not actively used
```

The network is reserved for future architecture expansion, including:

- Routing experiments
- Gateway deployment
- Network segmentation exercises
- Firewall testing
- Traffic inspection architecture

Phase 1 monitoring activities focus on the active lab networks:

- soc-monitor
- soc-victim
- soc-attack
- default (NAT)

---


## Monitoring Considerations

Traffic visibility depends on where monitoring tools are deployed.

During interface visibility validation, special attention should be paid
to determining whether observed traffic is:

- Local network traffic
- Multi-homed host traffic
- Cross-network communications
- NAT-based communications

Understanding these paths is required before deploying Suricata or
collecting baseline packet captures.

---

# Monitoring Strategy

Monitoring is implemented using a layered approach.

## Current Phase 1 Topology

Phase 0 validation observed the following address assignments.

ubuntu-monitor

- soc-monitor (192.168.50.20)
- soc-victim (192.168.200.73)
- default (192.168.122.26)

win10-victim

- soc-monitor (192.168.50.16)
- soc-victim (192.168.200.98)
- default (192.168.122.153)

parrot-attack-v2

- soc-monitor (192.168.50.29)
- soc-attack (192.168.100.90)
- default (192.168.122.91)

---

### Layer 1 Assumption Validation

Phase 0 demonstrated that all monitored systems are multi-homed.

Before packet capture tooling is deployed, the following questions must
be answered:

- Which interface carries target traffic?
- Which interface carries management traffic?
- Which interface carries attack traffic?
- Which interface provides the most useful monitoring visibility?

Interface selection must be validated before Suricata deployment.

---

## Layer 1 - Interface Visibility

Objective:

Verify that traffic can be observed from the expected ubuntu-monitor
interfaces before packet capture or security tooling is deployed.

Activities:

- Identify interfaces
- Map interfaces to networks
- Validate packet visibility
- Confirm monitoring coverage

Deliverable:

- Interface visibility validation evidence

---

## Layer 2 - Packet Visibility

Tools:

- tcpdump
- tshark

Purpose:

- Capture raw traffic
- Establish traffic baselines
- Validate communication paths
- Generate evidence PCAPs

Outputs:

- PCAP files
- Protocol observations
- Traffic summaries

Storage:

```text
evidence/phase-1/raw/
```

---

## Layer 3 - Host Monitoring

Target:

```text
ubuntu-monitor
```

Validation Areas:

- SSH accessibility
- Time synchronisation
- Service status
- Logging configuration
- Package updates

Purpose:

Ensure monitoring infrastructure is operational and stable.

---

## Layer 4 - Network Detection

Tool:

```text
Suricata
```

Purpose:

- Inspect network traffic
- Generate alerts
- Validate detection capability
- Provide security telemetry

Expected Outputs:

- eve.json
- fast.log
- stats.log

Storage:

```text
evidence/phase-1/processed/
```

---

# Monitoring Collection Point

## Primary Collection Host

System:

```text
ubuntu-monitor
```

Responsibilities:

- Packet capture
- Traffic observation
- Telemetry collection
- Alert generation
- Evidence retention

Rationale:

ubuntu-monitor functions as the central monitoring platform for the SOC
lab environment.

---

# Interface Visibility Validation

## Purpose

Before deploying packet capture or detection tooling, interface
visibility must be validated.

This activity confirms which interfaces provide visibility into
monitored traffic flows and prevents incorrect interface selection
during packet capture and Suricata deployment.

---

## Visibility Objectives

Confirm visibility of:

- ICMP
- DNS
- HTTP
- HTTPS
- SSH

Traffic Sources:

- ubuntu-monitor
- win10-victim
- parrot-attack-v2

---

## Interface Inventory

Identify active interfaces.

Example command:

```bash
ip -br address
```

Record:

- Interface name
- MAC address
- Assigned IP address
- Connected network
- Interface state

Example:

```text
enp1s0 -> soc-victim
enp7s0 -> soc-attack
enp8s0 -> default (NAT)
```

Actual interface mappings must be validated and recorded during Phase 1.

---

## Visibility Testing

### Verify Interface Inventory

```bash
ip -br address
```

Evidence:

```text
evidence/phase-1/raw/
```

---

### Observe All Traffic

Capture traffic from all interfaces.

```bash
sudo tcpdump -ni any
```

Generate validation traffic:

```bash
ping
nslookup
curl
ssh
```

Confirm traffic is visible.

---

### Validate Individual Interfaces

Capture traffic separately on each active interface.

Example:

```bash
sudo tcpdump -ni enp1s0
sudo tcpdump -ni enp7s0
sudo tcpdump -ni enp8s0
```

Record:

- Source host
- Destination host
- Protocol observed
- Interface receiving traffic

---

### Generate Validation PCAPs

Create and retain packet captures.

Examples:

```bash
sudo tcpdump -ni enp1s0 -w victim-network-validation.pcap
sudo tcpdump -ni enp7s0 -w attack-network-validation.pcap
```

Storage:

```text
evidence/phase-1/raw/
```

---

## Success Criteria

Interface visibility is considered validated when:

- Active interfaces are identified
- Interface-to-network mappings are documented
- Expected traffic is observable
- PCAP files are successfully collected
- Monitoring coverage is understood
- Evidence is retained

---

# Data Sources

## Network Traffic

Expected protocols:

- ICMP
- DNS
- HTTP
- HTTPS
- SSH

Traffic Sources:

- ubuntu-monitor
- win10-victim
- parrot-attack-v2

---

## System Logs

Source:

```text
ubuntu-monitor
```

Examples:

- systemd journal
- authentication logs
- service logs
- Suricata logs

---

## Alert Data

Generated by:

```text
Suricata
```

Examples:

- Test alerts
- Network discovery alerts
- Port scan alerts

---

# Evidence Management

## Directory Structure

```text
evidence/
└── phase-1/
    ├── raw/
    ├── processed/
    ├── screenshots/
    └── notes/
```

---

## Raw Evidence

Contents:

- PCAP files
- Packet captures
- Command outputs

Location:

```text
evidence/phase-1/raw/
```

---

## Processed Evidence

Contents:

- Alert data
- Analysis results
- Parsed outputs

Location:

```text
evidence/phase-1/processed/
```

---

## Screenshots

Contents:

- Validation screenshots
- Monitoring screenshots
- Service status screenshots

Location:

```text
evidence/phase-1/screenshots/
```

---

## Notes

Contents:

- Analyst observations
- Troubleshooting notes
- Validation records

Location:

```text
evidence/phase-1/notes/
```

---

# Success Criteria

Phase 1 monitoring architecture is considered validated when:

- Monitoring host is operational
- Interface visibility is confirmed
- Network traffic can be observed
- Packet captures can be retained
- Suricata is operational
- Test traffic is visible
- Test alerts are generated
- Evidence is collected according to project standards

---

# Analyst Note

Phase 0 established a known-good baseline for assets, networks,
connectivity, routing, and communication paths.

Phase 1 builds upon that baseline by validating traffic visibility,
capturing telemetry, and establishing the monitoring foundation required
for future detection and analysis workflows.

---

# Future Expansion

The following capabilities are intentionally deferred to later phases:

- Zeek
- Wazuh
- OpenSearch
- Elastic Stack
- AI-assisted alert summarisation
- Incident response automation
- SOAR workflows

Phase 1 establishes the monitoring foundation required to support these future capabilities.
