# Phase 0 – Asset Inventory

## Document Information

| Field            | Value                                                        |
|------------------|--------------------------------------------------------------|
| Phase            | Phase 0 – Asset and Network Discovery                        |
| Purpose          | Record observed assets and network assignments               |
| Evidence Sources | Ubuntu, Windows 10, and Parrot network verification captures |
| Status           | Verified                                                     |

---

# Hypervisor Host

## Host System

| Attribute  | Value         |
|------------|---------------|
| Host OS    | Debian 13     |
| Hypervisor | KVM / libvirt |

---

# Network Inventory

| Network     | Subnet           | Purpose                      |
|-------------|------------------|------------------------------|
| default     | 192.168.122.0/24 | Management / Internet access |
| soc-monitor | 192.168.50.0/24  | Monitoring network           |
| soc-victim  | 192.168.200.0/24 | Victim network               |
| soc-attack  | 192.168.100.0/24 | Attack network               |

---

# Virtual Machine Inventory

## ubuntu-monitor

### System Information

| Attribute        | Value                  |
|------------------|------------------------|
| Hostname         | ubuntu-monitor         |
| Operating System | Ubuntu 26.04.1 LTS     |
| Virtualisation   | KVM                    |
| Role             | Monitoring Workstation |

### Network Interfaces

| Interface | MAC Address       | IPv4 Address      | Network     |
|-----------|-------------------|-------------------|-------------|
| enp1s0    | 52:54:00:af:4e:a1 | 192.168.50.20/24  | soc-monitor |
| enp7s0    | 52:54:00:91:a2:2e | 192.168.200.73/24 | soc-victim  |
| enp8s0    | 52:54:00:be:ec:8a | 192.168.122.26/24 | default     |

### Routing

| Item                 | Value         |
|----------------------|---------------|
| Default Gateway      | 192.168.122.1 |
| Management Interface | enp8s0        |

### Observed Neighbours

| Address       |
|---------------|
| 192.168.50.16 |
| 192.168.50.1  |
| 192.168.200.1 |
| 192.168.122.1 |

Source: 27126 ubuntu-monitor Network Verified.txt. 【1-dbee35】

---

## win10-victim

### System Information

| Attribute        | Value              |
|------------------|--------------------|
| Hostname         | WIN10-VICTIM       |
| Operating System | Windows 10         |
| Role             | Victim Workstation |

### Network Interfaces

| Interface  | MAC Address       | IPv4 Address    | Network     |
|------------|-------------------|-----------------|-------------|
| Ethernet 3 | 52-54-00-C6-F0-8B | 192.168.122.153 | default     |
| Ethernet 4 | 52-54-00-66-9F-8E | 192.168.50.16   | soc-monitor |
| Ethernet 5 | 52-54-00-54-5E-F9 | 192.168.200.98  | soc-victim  |

### Routing

| Item                    | Value         |
|-------------------------|---------------|
| Active Default Gateway  | 192.168.122.1 |
| Internet Access Network | default       |

### Observed Neighbours

| Address       |
|---------------|
| 192.168.50.1  |
| 192.168.122.1 |
| 192.168.200.1 |

Source: 27226 win10-victim NetWork Verified.txt. 【2-ca6428】

---

## parrot-attack-v2

### System Information

| Attribute        | Value               |
|------------------|---------------------|
| Hostname         | parrot              |
| Operating System | Parrot Security 7.3 |
| Virtualisation   | KVM                 |
| Role             | Attack Platform     |

### Network Interfaces

| Interface | MAC Address       | IPv4 Address   | Network     |
|-----------|-------------------|----------------|-------------|
| enp1s0    | 52:54:00:af:87:bb | 192.168.100.90 | soc-attack  |
| enp7s0    | 52:54:00:e1:e4:11 | 192.168.50.29  | soc-monitor |
| enp8s0    | 52:54:00:90:ef:c2 | 192.168.122.91 | default     |

### Routing

| Item                 | Value         |
|----------------------|---------------|
| Default Gateway      | 192.168.122.1 |
| Management Interface | enp8s0        |

### Observed Neighbours

| Address       |
|---------------|
| 192.168.50.1  |
| 192.168.100.1 |
| 192.168.122.1 |

Source: 27226 Parrot NetWork Verified.txt. 【3-d7ec65】

---

# Current Architecture Summary

| Network     | Connected Assets                               |
|-------------|------------------------------------------------|
| default     | ubuntu-monitor, win10-victim, parrot-attack-v2 |
| soc-monitor | ubuntu-monitor, win10-victim, parrot-attack-v2 |
| soc-victim  | ubuntu-monitor, win10-victim                   |
| soc-attack  | parrot-attack-v2                               |

---

# Phase 0 Verification Findings

## Verified

- All documented virtual machines were successfully identified. 【1-dbee35】【3-d7ec65】【2-ca6428】
- Network addressing matches the documented design. 【1-dbee35】【3-d7ec65】【2-ca6428】
- All systems possess a management interface on the default libvirt network. 【1-dbee35】【3-d7ec65】【2-ca6428】
- Ubuntu monitoring workstation is connected to monitoring and victim networks. 【1-dbee35】
- Windows victim is connected to monitoring and victim networks. 【2-ca6428】
- Parrot attack platform is connected to attack and monitoring networks. 【3-d7ec65】

## Pending Verification

- End-to-end connectivity testing.
- Connectivity matrix completion.
- DHCP lease inventory.
- Network-to-interface mapping validation against libvirt XML.
- Baseline sign-off.
