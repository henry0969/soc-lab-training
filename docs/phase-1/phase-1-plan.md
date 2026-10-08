# Phase 1 – Monitoring and Visibility

## Status

PLANNED

---

# Objective

Establish monitoring visibility across the SOC Lab environment.

Phase 0 validation confirmed that the current SOC-LAB architecture is multi-homed rather than dependent on a dedicated routing network.

Traffic visibility in Phase 1 therefore focuses on interface selection, network membership, and packet observation rather than inter-network routing analysis.

The objective is to answer:

"Can normal and abnormal network activity be observed, captured, and retained for analysis?"

---

# Prerequisites

Completed during Phase 0:

- Asset inventory
- Network inventory
- Connectivity validation
- Baseline establishment
- Network documentation
- Evidence collection workflow

Status:

COMPLETE

---

# Scope

Assets:

- ubuntu-monitor
- win10-victim
- parrot-attack-v2

Networks:

- soc-monitor (192.168.50.0/24)
- soc-victim  (192.168.200.0/24)
- soc-attack  (192.168.100.0/24)
- default NAT (192.168.122.0/24)

Reserved Infrastructure:

- soc-router (10.0.0.0/24)

---

# Phase Deliverables

## D1 - Monitoring Architecture

Create:

docs/phase-1/monitoring-architecture.md

Document:

- Monitoring objectives
- Data sources
- Traffic visibility
- Collection points
- Storage locations

Success Criteria:

- Monitoring design approved

---

### D1.5 - Interface Mapping and Visibility Validation

Objective:

Document how traffic flows through the current multi-homed lab
architecture.

Tasks:

- Identify ubuntu-monitor interfaces
- Map interfaces to networks
- Map IP addresses to network segments
- Validate visible traffic sources
- Record interface inventory

Tools:

- ip address
- ip route
- tcpdump
- virsh

Success Criteria:

- Interface-to-network mapping documented
- Traffic visibility validated
- Evidence stored

Evidence:

evidence/phase-1/raw/

---

## D2 - Packet Capture Validation

Capture traffic from:

- soc-monitor
- soc-victim
- soc-attack
- default (NAT)

Validate:

- Which interfaces receive traffic
- Which interfaces receive management traffic
- Which interfaces receive attack traffic
- Which interfaces receive NAT traffic

Tools:

- tcpdump
- tshark

Success Criteria:

- Traffic successfully captured
- PCAP files stored as evidence

Evidence:

evidence/phase-1/raw/

---

## D3 - Ubuntu Monitor Hardening

Verify:

- SSH access
- Time synchronization
- Package updates
- Logging configuration

Success Criteria:

- Monitor host operational and stable

---

## D4 - Suricata Deployment

Install:

- Suricata

Location:

ubuntu-monitor

Validate:

- Service starts
- Configuration loads
- Test rules execute

Success Criteria:

- Alert generated from test traffic

Evidence:

evidence/phase-1/raw/

---

## D5 - Telemetry Validation

Generate benign activity:

- ICMP
- DNS
- HTTP
- HTTPS

Confirm:

- Activity observable
- Logs generated
- PCAP available

Success Criteria:

- Activity visible in monitoring outputs

---

## D6 - Detection Demonstration

Generate controlled test traffic from parrot-attack-v2.

Examples:

- Port scan
- Network discovery

Confirm:

- Telemetry collected
- Suricata alert generated

Success Criteria:

- Detection documented

---

# Evidence Requirements

All outputs stored under:

evidence/phase-1/

Structure:

evidence/
└── phase-1/
    ├── raw/
    ├── processed/
    ├── screenshots/
    └── notes/

---

# Expected Outputs

## Documentation

- monitoring-architecture.md
- suricata-installation.md
- telemetry-validation.md

## Evidence

- Packet captures
- Alert logs
- Screenshots
- Validation output

## Reports

- phase-1-monitoring-report.md

---

# Success Criteria

Phase 1 is considered complete when:

- Monitor host captures network activity
- Suricata operational
- Test traffic observed
- Test alert generated
- Evidence collected
- Monitoring architecture documented

---

# Out of Scope

The following are deferred:

- Zeek
- Elastic/OpenSearch
- Wazuh
- AI alert summarisation
- Automated incident response
- SOAR workflows

These activities belong to later phases.

---

# Phase Approval Requirement

Before Phase 1 sign-off:

- All deliverables completed
- Evidence collected
- Monitoring validated
- Detection demonstrated
- Report written

Status:

PENDING
