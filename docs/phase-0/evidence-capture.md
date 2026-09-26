# Phase 0 — Evidence Capture

## Principle

Raw evidence should be captured before interpretation.

Suggested naming convention:

`YYYYMMDD-HHMMSS_<host>_<command>.txt`

Examples:

- `20260916-143000_debian_virsh-list.txt`
- `20260916-143100_debian_networks.txt`
- `20260916-143200_ubuntu-ip-route.txt`
- `20260916-143300_windows-ipconfig.txt`

## Host-side discovery

Useful commands include:

```bash
sudo virsh list --all
sudo virsh dominfo <vm>
sudo virsh domiflist <vm>
sudo virsh dumpxml <vm>
sudo virsh net-list --all
sudo virsh net-info <network>
sudo virsh net-dumpxml <network>
sudo virsh net-dhcp-leases <network>
ip -br addr
ip route
ip addr show virbr0
ip addr show virbr1
ip addr show virbr2
ip addr show virbr3
ip addr show virbr4
```

## Linux guest discovery

```bash
ip -br addr
ip route
ip neigh
cat /etc/resolv.conf
ip route get <destination>
```

## Windows guest discovery

```text
ipconfig /all
netsh interface ipv4 show addresses
netsh interface ipv4 show config
arp -a
route print
```

## Connectivity tests

Record:

- source
- destination
- protocol
- command
- timestamp
- result
- packet loss
- latency where relevant
- interpretation

Do not treat a successful ping as proof that every service or protocol is
reachable.
