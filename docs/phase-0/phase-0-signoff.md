# Phase 0 Sign-Off Report

## SOC Lab Training Project

### Phase Name

Phase 0 – Discovery, Inventory, Baseline and Connectivity Validation

---

## Document Information

| Field       | Value                     |
|-------------|---------------------------|
| Project     | SOC Lab Training          |
| Phase       | Phase 0                   |
| Status      | APPROVED                  |
| Author      | Andrew Crump              |
| Review Date | 02 October 2026           |
| Environment | Debian 13 KVM/libvirt Lab |

---

# Phase Objective

Establish a verified baseline of the laboratory environment through:

- Asset discovery
- Network discovery
- Interface verification
- Routing verification
- Connectivity validation
- Service validation
- Evidence collection
- Documentation

The goal of Phase 0 was to develop a trusted understanding of the environment prior to introducing monitoring, detection, or incident response capabilities. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

---

# Scope

Assets included in validation:

| Asset            | Role                   |
|------------------|------------------------|
| Debian 13 Host   | Hypervisor             |
| ubuntu-monitor   | Monitoring Workstation |
| win10-victim     | Victim Workstation     |
| parrot-attack-v2 | Attack Platform        |

Validated networks:

| Network     | Subnet           |
|-------------|------------------|
| default     | 192.168.122.0/24 |
| soc-monitor | 192.168.50.0/24  |
| soc-victim  | 192.168.200.0/24 |
| soc-attack  | 192.168.100.0/24 |

---

# Completed Deliverables

## Discovery

Completed:

- VM inventory
- Network inventory
- Interface inventory
- DHCP verification
- Gateway verification

Result:

✅ Complete

---

## Documentation

Completed:

- Asset inventory
- Connectivity matrix
- Network topology diagram
- Connectivity validation runbook

Result:

✅ Complete

---

## Connectivity Validation

Completed:

### Gateway Reachability

Verified:

- Ubuntu Monitor
- Windows Victim
- Parrot Attack

All configured gateways responded successfully. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Result:

✅ Pass

---

### Host Reachability

Verified communication between:

- Ubuntu Monitor ↔ Parrot
- Windows Victim ↔ Ubuntu Monitor
- Windows Victim ↔ Parrot

Observed limitations were documented and reviewed. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Result:

✅ Pass

---

### DNS Validation

Validated:

- Local hostname resolution
- Internet DNS resolution
- External name resolution

GitHub resolution was successful from all systems. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Result:

✅ Pass

---

### Route Validation

Validated:

- Local subnet routing
- Default gateway selection
- Internet route selection

Routes matched expected network design. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Result:

✅ Pass

---

### SSH Validation

Validated:

- SSH service state
- Listening socket
- Remote access from Parrot
- Remote access from Debian host

SSH connectivity was verified successfully. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Result:

✅ Pass

---

### HTTP/HTTPS Validation

Validated:

- Ubuntu Internet access
- Parrot Internet access
- Windows Internet access

All systems successfully accessed GitHub via HTTPS. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Result:

✅ Pass

---

# Findings

## Finding 01

### Windows ICMP Echo Requests Blocked

Description:

Ubuntu and Parrot were unable to ping Windows interfaces, while Windows successfully communicated with both systems. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Assessment:

The most likely cause is Windows Defender Firewall blocking inbound ICMP Echo Requests.

Classification:

Informational

Risk:

Low

Action Required:

None

Status:

Accepted Baseline Behaviour

---

## Finding 02

### Remote Desktop Disabled

Description:

Remote Desktop Services were stopped and TCP/3389 was not listening. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Assessment:

RDP is currently unavailable.

Classification:

Informational

Risk:

Low

Action Required:

Enable only if required during future phases.

Status:

Accepted Baseline Behaviour

---

## Finding 03

### SMB Not Externally Reachable

Description:

Windows SMB configuration was present; however, remote TCP/445 validation timed out. 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Assessment:

Likely host-based firewall restriction.

Classification:

Informational

Risk:

Low

Action Required:

Evaluate during future Windows management activities.

Status:

Accepted Baseline Behaviour

---

# Architecture Validation

The following design assumptions were successfully validated:

✅ Multi-network VM architecture implemented correctly

✅ Network segmentation functioning

✅ Gateway assignment functioning

✅ DNS operational

✅ Internet connectivity operational

✅ SSH management access operational

✅ Monitoring network connectivity established

✅ Routing behaves as expected

✅ Asset inventory matches documented design

1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

---

# Evidence References

Primary evidence source:

- 1732_27526 Connectivity Validation_Runbook Results.txt 【1-af52b7】

Supporting evidence:

- Asset Inventory
- Connectivity Matrix
- Network Verification Outputs
- Network Topology Diagram

---

# Phase Outcome

Phase 0 objectives have been achieved.

The lab environment has been:

- Inventoried
- Documented
- Validated
- Baselined

Evidence collected during Phase 0 establishes a trusted reference point for subsequent monitoring and detection activities.

---

# Phase Approval

| Item                   | Status   |
|------------------------|----------|
| Asset Discovery        | Complete |
| Network Discovery      | Complete |
| Interface Verification | Complete |
| Gateway Validation     | Complete |
| Connectivity Testing   | Complete |
| DNS Validation         | Complete |
| Route Validation       | Complete |
| SSH Validation         | Complete |
| Service Validation     | Complete |
| Baseline Established   | Complete |
| Phase 0                | APPROVED |

---

# Author Sign-Off

Name:

Andrew Crump

Role:

Junior NOC/SOC Analyst (Training Lab)

Decision:

✅ PHASE 0 APPROVED

The environment is sufficiently documented, validated, and baselined to commence Phase 1 activities focused on monitoring, telemetry collection, and security visibility.
