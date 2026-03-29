# 🎯 Nmap Scripting Engine (NSE) - Advanced Techniques

NSE is one of Nmap's most powerful features, allowing users to write scripts in Lua for advanced discovery and vulnerability detection.

## 📚 Prerequisites
- Nmap installed
- Basic Nmap knowledge
- Lua basics (optional)

## 📖 What is NSE?

NSE scripts can:
- Detect vulnerabilities
- Automate exploitation detection
- Perform advanced version detection
- Gather additional information

## 🔧 Script Categories

| Category | Description |
|----------|-------------|
| `auth` | Bypass authentication |
| `broadcast` | Discover hosts via broadcast |
| `brute` | Guess passwords |
| `default` | Default scripts (safe) |
| `discovery` | Advanced host discovery |
| `dos` | Denial of service tests |
| `exploit` | Actively exploit vulnerabilities |
| `external` | External resources |
| `fuzzer` | Send unexpected data |
| `intrusive` | May crash services |
| `malware` | Detect malware |
| `safe` | Won't crash services |
| `version` | Version detection |
| `vuln` | Vulnerability detection |

## 🚀 Basic Usage

```bash
# Run default scripts
nmap -sC target.com

# Run specific category
nmap --script vuln target.com

# Run specific scripts
nmap --script http-enum,http-title target.com

# Run by expression
nmap --script "http-*" target.com

# Run multiple categories
nmap --script "discovery,safe" target.com
```

## 🎯 Essential Scripts

### HTTP Enumeration

```bash
# Directory/file enumeration
nmap --script http-enum target.com

# Extract page titles
nmap --script http-title target.com

# Find interesting files
nmap --script http-robots.txt target.com

# Crawl websites
nmap --script http-crawl target.com

# Find backup files
nmap --script http-backup-finder target.com
```

### Vulnerability Scanning

```bash
# Scan for common vulnerabilities
nmap --script vuln target.com

# Check specific CVEs
nmap --script "http-cve-*" target.com

# Heartbleed detection
nmap -p 443 --script ssl-heartbleed target.com

# POODLE detection
nmap -p 443 --script ssl-poodle target.com
```

### SMB Scripts

```bash
# SMB enumeration
nmap --script smb-enum-users target.com
nmap --script smb-enum-shares target.com
nmap --script smb-enum-services target.com

# SMB vulnerability scan
nmap --script smb-vuln-* target.com

# Check for EternalBlue
nmap --script smb-vuln-ms17-010 target.com
```

### DNS Scripts

```bash
# DNS zone transfer
nmap --script dns-zone-transfer -p 53 target.com

# DNS enumeration
nmap --script dns-enum target.com

# Reverse DNS lookup
nmap --script dns-reverse-lookup target.com
```

### SSL/TLS Analysis

```bash
# SSL certificate info
nmap --script ssl-cert target.com

# SSL cipher suites
nmap --script ssl-enum-ciphers target.com

# Test for vulnerabilities
nmap -p 443 --script ssl-heartbleed target.com
nmap -p 443 --script ssl-ccs-injection target.com
nmap -p 443 --script ssl-dh-params target.com
```

## 📝 Practical Examples

### Web Server Audit

```bash
# Comprehensive web scan
nmap -p 80,443 --script http-enum,http-title,http-headers,http-server-header,ssl-cert,vuln target.com
```

### Network Vulnerability Assessment

```bash
# Scan for common vulnerabilities
nmap --script vuln -sV target.com
```

### Password Audit

```bash
# Brute force SSH
nmap -p 22 --script ssh-brute --script-args userdb=users.txt,passdb=passwords.txt target.com
```

### Finding Open Proxies

```bash
nmap --script http-open-proxy target.com
```

## 🔍 Script Arguments

```bash
# Pass arguments to scripts
nmap --script http-headers --script-args http.url.path='/admin' target.com

# Multiple arguments
nmap --script http-brute --script-args http-brute.hostname=target.com,userdb=users.txt target.com
```

### Common Arguments

| Argument | Description | Example |
|----------|-------------|---------|
| `http.useragent` | Custom user agent | `"Mozilla/5.0"` |
| `http.url.path` | Target path | `"/admin"` |
| `userdb` | Username list | `"users.txt"` |
| `passdb` | Password list | `"passwords.txt"` |
| `dns-brute.domain` | Target domain | `"target.com"` |

## 📂 Script Locations

Scripts are stored in:
```bash
# Linux/macOS
/usr/share/nmap/scripts/

# Windows (Nmap install dir)
C:\Program Files\Nmap\scripts\
```

### Update Scripts

```bash
# Update Nmap script database
nmap --script-updatedb

# Or update Nmap itself
sudo apt update && sudo apt install nmap
```

## 🎯 Useful Script Combinations

### Quick Vulnerability Scan
```bash
nmap -sV --script vuln target.com
```

### Comprehensive Scan
```bash
nmap -A -sV --script "default or discovery" target.com
```

### Aggressive Web Scan
```bash
nmap -p 80,443,8080 --script http-enum,http-title,http-headers,http-xssed target.com
```

## ⚠️ Legal Considerations

- Only use `exploit` scripts on systems you have permission to test
- Some scripts can crash services (`intrusive`, `dos`)
- Always check script documentation first

## 📚 Resources

- [NSE Documentation](https://nmap.org/book/nse.html)
- [NSE Script Database](https://nmap.org/nsedoc/)
- [Lua 5.3 Reference](https://www.lua.org/manual/5.3/)

## 📝 Lab Exercise

### Task 1: Scan Your Lab Environment
```bash
# Use http-enum on your test web server
nmap -p 80 --script http-enum 192.168.56.102
```

### Task 2: Vulnerability Check
```bash
# Check for SMB vulnerabilities on Windows target
sudo nmap -p 445 --script smb-vuln-ms17-010 192.168.56.103
```

### Task 3: SSL Analysis
```bash
# Analyze SSL configuration
nmap -p 443 --script ssl-cert,ssl-enum-ciphers 192.168.56.102
```

---

[← Nmap Intermediate](../README.md) | [Home →](../../README.md)
