# 🔍 Lab 1: Network Enumeration with Nmap

**Objective:** Learn to discover hosts and enumerate services on a network using Nmap

**Lab Environment:**

- Attacker: Kali Linux (192.168.XX.XXX)
- Target: Metasploitable2 (192.168.XX.XXX) - *If available*
- Network: Host-Only (192.168.XX.XXX/XX)

**Duration:** 30-45 minutes

## 📋 Pre-Lab Setup

1. Start your Kali Linux VM
2. Start your vulnerable target VM (if using)
3. Verify network connectivity:
```bash
ping -c 4 192.168.56.102
```

## 📝 Lab Steps

### Step 1: Host Discovery

**Objective:** Find live hosts on your network

```bash
# Ping sweep to discover active hosts
nmap -sn 192.168.56.0/24

# Alternative: ARP discovery (faster on local network)
sudo nmap -sn -PR 192.168.56.0/24

# Output example:
# Nmap scan report for 192.168.56.101
# Host is up (0.0010s latency).
# Nmap scan report for 192.168.56.102
# Host is up (0.0020s latency).
```

**Questions to Answer:**
- How many hosts are up?
- What are their IP addresses?

---

### Step 2: Basic Port Scanning

**Objective:** Identify open ports on target systems

```bash
# Quick scan - top 100 ports
nmap -F 192.168.56.102

# Scan specific common ports
nmap -p 21,22,23,25,80,443,3306,3389 192.168.56.102

# Scan all TCP ports (may take time)
nmap -p- 192.168.56.102
```

**Questions to Answer:**
- What ports are open?
- What services might be running?

---

### Step 3: Service and Version Detection

**Objective:** Identify service versions to find vulnerabilities

```bash
# Service version detection
nmap -sV 192.168.56.102

# Aggressive scan (OS, services, scripts, traceroute)
nmap -A 192.168.56.102

# Example output:
# PORT     STATE SERVICE  VERSION
# 21/tcp   open  ftp      vsftpd 2.3.4
# 22/tcp   open  ssh      OpenSSH 4.7p1
# 23/tcp   open  telnet   Linux telnetd
# 25/tcp   open  smtp     Postfix smtpd
```

---

### Step 4: OS Fingerprinting

**Objective:** Determine the operating system

```bash
# OS detection (requires root)
sudo nmap -O 192.168.56.102

# OS and service detection combined
sudo nmap -A 192.168.56.102
```

---

### Step 5: NSE Script Scanning

**Objective:** Use NSE scripts for vulnerability detection

```bash
# Run default safe scripts
nmap -sC 192.168.56.102

# Vulnerability scanning
nmap --script vuln 192.168.56.102

# Specific script - enumerate users via SMTP
nmap -p 25 --script smtp-enum-users 192.168.56.102

# Check for specific vulnerabilities
nmap --script smb-vuln-ms17-010 192.168.56.102
```

---

### Step 6: Saving Results

```bash
# Save as normal text
nmap -oN scan_results.txt 192.168.56.102

# Save as XML (for tools)
nmap -oX scan_results.xml 192.168.56.102

# Save all formats
nmap -oA full_scan 192.168.56.102
```


## 🎯 Challenge

**After completing the lab:**

1. Create a script that automates the full scan process:
```bash
#!/bin/bash
# auto_scan.sh - Quick network enumeration script

TARGET=$1
echo "Scanning $TARGET..."

# Host discovery
echo "=== Host Discovery ==="
nmap -sn $TARGET

# Port scan
echo "=== Port Scan ==="
nmap -F $TARGET

# Service detection
echo "=== Service Detection ==="
nmap -sV $TARGET

# Vulnerability check
echo "=== Vulnerability Scan ==="
nmap --script vuln $TARGET

echo "Scan complete!"
```

2. Save results to a organized folder structure

## ⚠️ Important Notes

- Only scan systems you own or have permission to scan
- Document all findings for your portfolio
- Take screenshots for your writeups

## ✅ Verification Checklist

- [ ] Completed ping sweep
- [ ] Documented all open ports
- [ ] Identified service versions
- [ ] Ran at least 3 NSE scripts
- [ ] Saved scan results
- [ ] Completed results template
- [ ] Answered all questions

## 📚 Additional Resources

- [Nmap Cheat Sheet](https://stationx.net/nmap-cheat-sheet/)
- [Nmap Documentation](https://nmap.org/book/man.html)
- [NSE Script Documentation](https://nmap.org/nsedoc/)

## 🔗 Next Lab

- [Lab 2: Packet Analysis with Wireshark](../TOOLS/wireshark/basics/packet-capture-basics.md)

---

[← Back to Labs](../README.md) | [Next: Wireshark Basics →](../TOOLS/wireshark/basics/packet-capture-basics.md)
