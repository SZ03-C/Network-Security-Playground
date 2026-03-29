# 📡 Setting Up Your Security Lab

A proper lab environment is essential for safe, legal practice of network security skills.

## 🏗️ Recommended Lab Setup

### Option 1: Virtual Machines (Recommended)

```
┌─────────────────────────────────────────────────┐
│                  Host Machine                     │
│  ┌─────────────┐ ┌─────────────┐ ┌────────────┐ │
│  │ Kali Linux  │ │ Metasploitable│ │ Windows   │ │
│  │ (Attacker)  │ │ (Victim)     │ │ Target    │ │
│  │             │ │              │ │           │ │
│  └─────────────┘ └─────────────┘ └────────────┘ │
│         ↑              ↑                        │
│         └──────────────┴───────────────         │
│              VirtualBox/VMware                   │
└─────────────────────────────────────────────────┘
```

### Option 2: Home Lab Network

```
┌──────────────┐     ┌──────────────┐
│   Router     │────▶│  Switch      │
│  (NAT)       │     │              │
└──────────────┘     └──────────────┘
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                 │
    ┌────┴────┐      ┌─────┴────┐      ┌────┴────┐
    │ Kali    │      │ Victim   │      │ Network │
    │ Linux   │      │ VM       │      │ Monitor │
    └─────────┘      └──────────┘      └─────────┘
```

## 🛠️ Installing Kali Linux

### Download
1. Get Kali Linux from: https://www.kali.org/get-kali/
2. Choose VirtualBox/VMware pre-built image OR ISO

### VM Setup (VirtualBox)
```bash
# Install VirtualBox
# Download from: https://www.virtualbox.org/

# Create new VM:
# - Name: Kali Linux
# - Type: Linux
# - Version: Debian (64-bit)
# - RAM: 4096 MB minimum
# - HDD: 50 GB minimum
# - Network: Host-Only Adapter
```

### Post-Installation Setup
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install common tools (if using minimal image)
sudo apt install -y nmap wireshark ettercap-text-only
sudo apt install -y metasploit-framework burpsuite
sudo apt install -y aircack-ng hydra john

# Verify installations
nmap --version
wireshark --version
```

## 🐞 Setting Up Vulnerable Targets

### Metasploitable2 (Linux)
```bash
# Download
wget https://information.rapid7.com/metasploitable-download.html

# VM Settings:
# - Network: Host-Only
# - Same subnet as Kali
# - Credentials: msfadmin/msfadmin
```

### OWASP WebGoat
```bash
# Using Docker
docker run -d -p 5000:5000 \
  -e WEBGOAT_PORT=5000 \
  webgoat/webgoat
```

### DVWA (Damn Vulnerable Web App)
```bash
# Install on separate VM or container
git clone https://github.com/digininja/DVWA.git
```

## 🌐 Network Configuration

### Kali Network Settings
```bash
# Check current IP
ip addr

# Set static IP (edit /etc/network/interfaces)
# or use Network Manager GUI

# Recommended Lab IP Range:
# 192.168.56.0/24 (VirtualBox Host-Only)
```

### Testing Connectivity
```bash
# Ping between VMs
ping 192.168.56.101  # Kali
ping 192.168.56.102  # Victim

# Check network interfaces
ip link show
```

## 📋 Pre-Lab Checklist

- [ ] VirtualBox/VMware installed
- [ ] Kali Linux VM created and updated
- [ ] Victim VM(s) set up
- [ ] Host-only networking configured
- [ ] VMs can communicate
- [ ] Tools verified working
- [ ] Snapshots taken (before experiments!)

## 🔒 Important Safety Rules

### DO ✅
- Keep VMs on isolated networks
- Take snapshots before testing
- Use only your own lab environment
- Document your learning process

### DON'T ❌
- Scan networks you don't own
- Test exploits on production systems
- Share lab configurations that could harm others
- Skip the legal/ethical considerations

## 📚 Practice Networks

For legal, hands-on practice:
- [TryHackMe](https://tryhackme.com/) - Guided learning
- [HackTheBox](https://hackthebox.eu/) - Advanced challenges
- [PicoCTF](https://picoctf.org/) - Beginner-friendly
- [VulnHub](https://www.vulnhub.com/) - Downloadable VMs

## 📝 Lab Documentation Template

```markdown
# Lab: [Lab Name]
## Date: [Date]
## Objective: [What you learned]

## Environment
- Attacker: [IP]
- Target: [IP]
- Tools: [Tools used]

## Steps
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Findings
- [Key discovery 1]
- [Key discovery 2]

## Notes
- [Additional observations]
```

## 🚀 Next Steps

Ready to start? Head to:
- [Nmap Basics](../TOOLS/nmap/basics/port-scanning-basics.sh)
- [TCP/IP Fundamentals](../networking-basics/TCP_IP_Model.md)

---

[← Back to Fundamentals](../README.md) | [Networking Basics →](../networking-basics/README.md)
