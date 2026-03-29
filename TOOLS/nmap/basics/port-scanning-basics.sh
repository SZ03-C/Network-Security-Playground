# 🔍 Nmap Basics - Port Scanning Fundamentals

Nmap ("Network Mapper") is the industry-standard network scanner used for network discovery and security auditing.

## 📖 What You'll Learn
- Basic port scanning techniques
- Service detection
- Common Nmap options

## 🔧 Installation

```bash
# Linux/macOS
sudo apt install nmap    # Debian/Ubuntu
brew install nmap        # macOS

# Windows - Download from https://nmap.org/download.html
```

## 📝 Basic Syntax

```bash
nmap [Scan Type] [Options] [Target]
```

## 🎯 Scan Types

### 1. TCP Connect Scan (-sT)
Complete TCP handshake (requires full connection)

```bash
nmap -sT target.com
```

### 2. SYN Scan (-sS) - Stealth
Half-open scan, doesn't complete handshake (requires root)

```bash
sudo nmap -sS target.com
```

### 3. UDP Scan (-sU)
Scans UDP services (slow)

```bash
sudo nmap -sU target.com
```

### 4. Version Detection (-sV)
Detect service versions

```bash
nmap -sV target.com
```

## 📋 Port Selection Options

| Option | Description | Example |
|--------|-------------|---------|
| `-p 80` | Single port | `nmap -p 80 192.168.1.1` |
| `-p 80,443` | Multiple ports | `nmap -p 80,443 192.168.1.1` |
| `-p 1-1000` | Port range | `nmap -p 1-1000 192.168.1.1` |
| `-p-` | All 65535 ports | `nmap -p- 192.168.1.1` |
| `-F` | Top 100 ports | `nmap -F 192.168.1.1` |

## 🚀 Common Examples

```bash
# Scan a single IP
nmap 192.168.1.1

# Scan multiple IPs
nmap 192.168.1.1 192.168.1.2 192.168.1.3

# Scan a range
nmap 192.168.1.1-254

# Scan a subnet
nmap 192.168.1.0/24

# Scan from list
nmap -iL targets.txt

# Scan specific ports
nmap -p 22,80,443,3389 192.168.1.1

# Quick scan (top 100 ports)
nmap -F 192.168.1.1

# Fast scan with service detection
nmap -sV -F 192.168.1.1
```

## 📊 Output Options

| Option | Description |
|--------|-------------|
| `-oN file.txt` | Normal output to file |
| `-oX file.xml` | XML output |
| `-oG file.gnmap` | Grepable format |
| `-oA basename` | All formats |

```bash
# Save all output formats
nmap -oA scan_results 192.168.1.1
```

## 🎛️ Timing & Performance

| Option | Speed | Use Case |
|--------|-------|----------|
| `-T0` | Paranoid | IDS evasion (slow) |
| `-T1` | Sneaky | IDS evasion |
| `-T2` | Polite | Lower bandwidth |
| `-T3` | Normal | Default |
| `-T4` | Aggressive | Faster scan |
| `-T5` | Insane | Very fast (may miss) |

```bash
# Fast aggressive scan
nmap -T4 -A 192.168.1.1
```

## 🔍 Service & OS Detection

```bash
# Service version detection
nmap -sV 192.168.1.1

# OS detection (requires root)
sudo nmap -O 192.168.1.1

# Both combined (aggressive scan)
sudo nmap -A 192.168.1.1

# Enable script scanning
sudo nmap -sC 192.168.1.1
```

## 🎯 Targeting Options

```bash
# Exclude IP from scan
nmap 192.168.1.0/24 --exclude 192.168.1.1

# Random targets (testing)
nmap -iR 10 -p 80

# IPv6 scanning
nmap -6 fe80::1/64
```

## 📝 Lab Exercise

### Task 1: Basic Network Scan
```bash
# Scan your local network (replace with your subnet)
nmap -sn 192.168.56.0/24

# Identify active hosts
# Note their IPs for further scanning
```

### Task 2: Port Scan
```bash
# Scan for common ports on discovered hosts
nmap -p 22,80,443,3389 192.168.56.0/24

# Or scan top 20 ports
nmap --top-ports 20 192.168.56.0/24
```

### Task 3: Service Detection
```bash
# Identify services on port 80
nmap -sV -p 80 192.168.56.0/24

# Check all ports with services
nmap -sV -p- 192.168.56.101
```

## 📖 Understanding Results

### Sample Output
```
Starting Nmap 7.94 ( https://nmap.org )
Nmap scan report for 192.168.1.1
Host is up (0.0010s latency).

PORT     STATE  SERVICE  VERSION
22/tcp   open   ssh      OpenSSH 7.4
80/tcp   open   http     Apache httpd 2.4.6
443/tcp  open   https    Apache httpd (SSL)
3306/tcp closed mysql

Service detection performed.
```

### State Meanings
| State | Meaning |
|-------|---------|
| `open` | Service accepting connections |
| `closed` | No service detected |
| `filtered` | Firewall blocking probes |
| `unfiltered` | Port accessible, can't determine state |

## ⚠️ Legal Considerations

> **Only scan networks you own or have written permission to scan.**

Unauthorized scanning may violate:
- Computer Fraud and Abuse Act (US)
- Computer Misuse Act (UK)
- Similar laws in your country

## 📚 Next Steps

- [Service Detection](service-detection.sh)
- [OS Fingerprinting](../intermediate/os-fingerprinting.sh)
- [NSE Scripts](../advanced/nse-scripts.md)

---

[← Nmap Overview](../README.md) | [Next: Service Detection →](service-detection.sh)
