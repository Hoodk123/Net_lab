# Net_lab

<p>
<img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"/>
<img src="https://img.shields.io/badge/YAML-CB171E?style=for-the-badge&logo=yaml&logoColor=white"/>
<img src="https://img.shields.io/badge/Networking-4285F4?style=for-the-badge"/>
</p>

## About

A hands-on lab exploring how Docker containers communicate with each other over a **private network** — the same way physical machines do on a LAN.

## Why it exists

Curiosity, mostly. Containers *feel* isolated, but they're not actually cut off from each other — Docker gives each one a virtual network interface, and containers on the same custom network can reach each other by name, resolve DNS, and route traffic just like real machines plugged into the same switch.

This project was built purely for learning: to actually see that behavior happen, not just read about it. Using `Dockerfile`s and Docker Compose (`.yml`), it sets up multiple containers on a shared private network and tests how they discover and talk to one another — service-to-service communication, container DNS resolution, and network isolation boundaries.

## What it covers

- Creating custom Docker networks (bridge networks)
- Multiple containers joining the same private network
- Container-to-container communication by service name
- Verifying isolation from containers *outside* the network

## Status

Learning project — expanding as I explore more networking scenarios (multi-network setups, exposing selective ports, etc.).
