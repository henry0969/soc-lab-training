# Phase 0 — Connectivity Matrix

This matrix records **observed** connectivity. Do not mark a path as
"expected" merely because it is technically possible.

## Legend

- `YES` — verified
- `NO` — tested and failed
- `NOT TESTED` — no evidence yet
- `EXPECTED` — matches the intended lab design
- `UNEXPECTED` — observed but not part of the intended design
- `REVIEW` — evidence is insufficient

## Matrix

| Source           | Destination    | Network/path | Result | Intended? | Evidence |
|------------------|----------------|--------------|--------|-----------|----------|
| win10-victim     | 192.168.50.1   | soc-monitor  |        |           |          |
| win10-victim     | 192.168.50.20  | soc-monitor  |        |           |          |
| win10-victim     | 192.168.50.29  | soc-monitor  |        |           |          |
| win10-victim     | 192.168.200.1  | soc-victim   |        |           |          |
| win10-victim     | 192.168.200.73 | soc-victim   |        |           |          |
| win10-victim     | 192.168.122.1  | default      |        |           |          |
| win10-victim     | 192.168.122.26 | default      |        |           |          |
| win10-victim     | 192.168.122.91 | default      |        |           |          |
| parrot-attack-v2 | 192.168.100.1  | soc-attack   |        |           |          |
| parrot-attack-v2 | 192.168.50.1   | soc-monitor  |        |           |          |
| parrot-attack-v2 | 192.168.200.1  | soc-victim   |        |           |          |
| parrot-attack-v2 | 10.0.0.1       | soc-router   |        |           |          |

Add further rows as the lab design develops.

## Phase 0 decision log

| Observation | Expected behaviour | Decision | Evidence |
|-------------|--------------------|----------|----------|
|             |                    |          |          |
