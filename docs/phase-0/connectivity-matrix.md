# Phase 0 — Connectivity Matrix

## Purpose

This matrix records known and observed communication paths within the SOC-LAB environment.

### Result Definitions

| Value      | Meaning                                                                          |
|------------|----------------------------------------------------------------------------------|
| VERIFIED   | Evidence confirms communication path exists                                      |
| OBSERVED   | Network membership and routing prove path is likely available but not yet tested |
| NOT TESTED | No connectivity evidence collected                                               |
| N/A        | Path should not exist                                                            |

### Intended Classification

| Value      | Meaning                     |
|------------|-----------------------------|
| EXPECTED   | Part of lab design          |
| UNEXPECTED | Not part of intended design |
| REVIEW     | Requires validation         |

---

# Asset Reference

| Asset            | Address         |
|------------------|-----------------|
| ubuntu-monitor   | 192.168.50.20   |
| ubuntu-monitor   | 192.168.200.73  |
| ubuntu-monitor   | 192.168.122.26  |
| win10-victim     | 192.168.50.16   |
| win10-victim     | 192.168.200.98  |
| win10-victim     | 192.168.122.153 |
| parrot-attack-v2 | 192.168.100.90  |
| parrot-attack-v2 | 192.168.50.29   |
| parrot-attack-v2 | 192.168.122.91  |

---

# Gateway Connectivity

## ubuntu-monitor

| Source         | Destination   | Network     | Result   | Intended | Evidence              |
|----------------|---------------|-------------|----------|----------|-----------------------|
| ubuntu-monitor | 192.168.50.1  | soc-monitor | VERIFIED | EXPECTED | ARP neighbour present |
| ubuntu-monitor | 192.168.200.1 | soc-victim  | VERIFIED | EXPECTED | ARP neighbour present |
| ubuntu-monitor | 192.168.122.1 | default     | VERIFIED | EXPECTED | ARP neighbour present |

---

## parrot-attack-v2

| Source           | Destination   | Network     | Result   | Intended | Evidence              |
|------------------|---------------|-------------|----------|----------|-----------------------|
| parrot-attack-v2 | 192.168.100.1 | soc-attack  | VERIFIED | EXPECTED | ARP neighbour present |
| parrot-attack-v2 | 192.168.50.1  | soc-monitor | VERIFIED | EXPECTED | ARP neighbour present |
| parrot-attack-v2 | 192.168.122.1 | default     | VERIFIED | EXPECTED | ARP neighbour present |

---

## win10-victim

| Source       | Destination   | Network     | Result   | Intended | Evidence        |
|--------------|---------------|-------------|----------|----------|-----------------|
| win10-victim | 192.168.50.1  | soc-monitor | VERIFIED | EXPECTED | ARP cache entry |
| win10-victim | 192.168.200.1 | soc-victim  | VERIFIED | EXPECTED | ARP cache entry |
| win10-victim | 192.168.122.1 | default     | VERIFIED | EXPECTED | ARP cache entry |

---

# Asset-to-Asset Connectivity

## Monitoring Network (192.168.50.0/24)

| Source           | Destination      | Network     | Result   | Intended | Evidence                             |
|------------------|------------------|-------------|----------|----------|--------------------------------------|
| ubuntu-monitor   | win10-victim     | soc-monitor | VERIFIED | EXPECTED | ARP neighbour 192.168.50.16 observed |
| win10-victim     | ubuntu-monitor   | soc-monitor | OBSERVED | EXPECTED | Shared subnet                        |
| parrot-attack-v2 | ubuntu-monitor   | soc-monitor | OBSERVED | EXPECTED | Shared subnet                        |
| parrot-attack-v2 | win10-victim     | soc-monitor | OBSERVED | EXPECTED | Shared subnet                        |
| ubuntu-monitor   | parrot-attack-v2 | soc-monitor | OBSERVED | EXPECTED | Shared subnet                        |
| win10-victim     | parrot-attack-v2 | soc-monitor | OBSERVED | EXPECTED | Shared subnet                        |

---

## Victim Network (192.168.200.0/24)

| Source           | Destination    | Network    | Result   | Intended | Evidence                |
|------------------|----------------|------------|----------|----------|-------------------------|
| ubuntu-monitor   | win10-victim   | soc-victim | OBSERVED | EXPECTED | Shared subnet           |
| win10-victim     | ubuntu-monitor | soc-victim | OBSERVED | EXPECTED | Shared subnet           |
| parrot-attack-v2 | win10-victim   | soc-victim | N/A      | REVIEW   | Not connected to subnet |
| parrot-attack-v2 | ubuntu-monitor | soc-victim | N/A      | REVIEW   | Not connected to subnet |

---

## Attack Network (192.168.100.0/24)

| Source           | Destination   | Network    | Result   | Intended     | Evidence      |
|------------------|---------------|------------|----------|--------------|---------------|
| parrot-attack-v2 | 192.168.100.1 | soc-attack | VERIFIED | EXPECTED     | ARP neighbour |
| ubuntu-monitor   | soc-attack    | N/A        | EXPECTED | Not attached |               |
| win10-victim     | soc-attack    | N/A        | EXPECTED | Not attached |               |

---

# Management Network

## default (192.168.122.0/24)

| Source           | Destination      | Network | Result   | Intended | Evidence      |
|------------------|------------------|---------|----------|----------|---------------|
| ubuntu-monitor   | win10-victim     | default | OBSERVED | EXPECTED | Shared subnet |
| ubuntu-monitor   | parrot-attack-v2 | default | OBSERVED | EXPECTED | Shared subnet |
| win10-victim     | parrot-attack-v2 | default | OBSERVED | EXPECTED | Shared subnet |
| parrot-attack-v2 | ubuntu-monitor   | default | OBSERVED | EXPECTED | Shared subnet |
| parrot-attack-v2 | win10-victim     | default | OBSERVED | EXPECTED | Shared subnet |

---

# Security Review Notes

## Confirmed

- All assets are attached to the default management network.
- All assets possess a default route via 192.168.122.1.
- Monitoring network connectivity exists between all three VMs.
- Victim network connectivity exists between ubuntu-monitor and win10-victim.
- Attack network currently contains only parrot-attack-v2.

## Requires Validation

The following tests should be executed and recorded:

- Ping tests
- SSH tests
- RDP tests
- SMB tests
- DNS resolution tests
- Internet access validation
- Cross-subnet routing verification

Evidence from those tests should replace OBSERVED entries with VERIFIED or FAILED.

---

# Connectivity Validation Commands

## Test Methodology

Connectivity testing should proceed in layers:

1. Interface and gateway reachability
2. Host-to-host reachability
3. Name resolution
4. Service availability
5. Application testing

Record all results in evidence files before updating the matrix.

---

# Ubuntu Monitor Tests

## Gateway Tests

```bash
ping -c 4 192.168.50.1
ping -c 4 192.168.200.1
ping -c 4 192.168.122.1
```

Expected Result:

```text
SUCCESS
```

---

## Host Reachability Tests

### Windows

```bash
ping -c 4 192.168.50.16
ping -c 4 192.168.200.98
ping -c 4 192.168.122.153
```

### Parrot

```bash
ping -c 4 192.168.50.29
ping -c 4 192.168.122.91
```

---

# Parrot Tests

## Gateway Tests

```bash
ping -c 4 192.168.100.1
ping -c 4 192.168.50.1
ping -c 4 192.168.122.1
```

---

## Host Reachability Tests

### Ubuntu

```bash
ping -c 4 192.168.50.20
ping -c 4 192.168.200.73
ping -c 4 192.168.122.26
```

### Windows

```bash
ping -c 4 192.168.50.16
ping -c 4 192.168.200.98
ping -c 4 192.168.122.153
```

---

# Windows Tests

## Gateway Tests

```powershell
ping 192.168.50.1
ping 192.168.200.1
ping 192.168.122.1
```

---

## Host Reachability Tests

### Ubuntu

```powershell
ping 192.168.50.20
ping 192.168.200.73
ping 192.168.122.26
```

### Parrot

```powershell
ping 192.168.50.29
ping 192.168.122.91
```

---

# DNS Validation

## Ubuntu

```bash
resolvectl query debian
resolvectl query ubuntu-monitor
```

```bash
host github.com
```

---

## Parrot

```bash
getent hosts github.com
```

```bash
nslookup github.com
```

---

## Windows

```powershell
nslookup github.com
```

```powershell
nslookup ubuntu-monitor
```

---

# SSH Service Validation

## Ubuntu

Verify SSH daemon:

```bash
sudo systemctl status ssh
```

Verify listening socket:

```bash
sudo ss -tlnp | grep :22
```

Remote test from Parrot:

```bash
ssh ahc@192.168.122.26
```

Remote test from Debian host:

```bash
ssh ahc@192.168.122.26
```

Expected:

```text
TCP 22 reachable
SSH login prompt displayed
```

---

# RDP Validation (Windows)

Verify service:

```powershell
Get-Service TermService
```

Verify listening socket:

```powershell
netstat -ano | findstr :3389
```

Test from Ubuntu:

```bash
nc -zv 192.168.122.153 3389
```

Test from Parrot:

```bash
nc -zv 192.168.122.153 3389
```

Expected:

```text
TCP connection succeeded
```

---

# SMB Validation (Windows)

Verify SMB listener:

```powershell
Get-SmbServerConfiguration
```

Test from Ubuntu:

```bash
nc -zv 192.168.122.153 445
```

Optional:

```bash
smbclient -L //192.168.122.153 -N
```

Expected:

```text
TCP/445 reachable
```

---

# HTTP/HTTPS Validation

## Internet Reachability

Ubuntu:

```bash
curl -I https://github.com
```

Parrot:

```bash
curl -I https://github.com
```

Windows:

```powershell
curl.exe -I https://github.com
```

Expected:

```text
HTTP/1.1 200 OK
or
HTTP/2 200
```

---

# Route Validation

Ubuntu:

```bash
ip route get 192.168.50.16
ip route get 192.168.122.153
ip route get 8.8.8.8
```

Parrot:

```bash
ip route get 192.168.50.20
ip route get 192.168.122.26
ip route get 8.8.8.8
```

Windows:

```powershell
pathping 192.168.122.1
```

```powershell
tracert 8.8.8.8
```

---

# Evidence Collection

Save outputs using:

```text
evidence/phase-0/raw/
```

Filename format:

```text
YYYYMMDD-HHMMSS_<host>_<test>.txt
```

Examples:

```text
20260929-150000_ubuntu_ping-tests.txt
20260929-150500_parrot_service-tests.txt
20260929-151000_windows_rdp-validation.txt
```

---

# Matrix Update Rules

| Test Result        | Matrix Status |
|--------------------|---------------|
| Ping succeeds      | VERIFIED      |
| Service reachable  | VERIFIED      |
| Connection refused | FAILED        |
| Timeout            | FAILED        |
| Not performed      | NOT TESTED    |

Do not mark a path VERIFIED until evidence has been captured and stored.


---

# Phase 0 Status

| Activity               | Status   |
|------------------------|----------|
| Asset Discovery        | Complete |
| Interface Verification | Complete |
| Address Verification   | Complete |
| Routing Verification   | Complete |
| Connectivity Testing   | Pending  |
| Service Validation     | Pending  |
| Baseline Sign-Off      | Pending  |
