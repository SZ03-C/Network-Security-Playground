# 🔒 Network Security Playground

> A comprehensive guide to network security tools and techniques - from fundamentals to advanced penetration testing

## 📚 Repository Structure

```
Network-Security-Playground/
├── README.md
├── FUNDAMENTALS/
│   ├── networking-basics/
│   │   ├── TCP_IP_Model.md
│   │   ├── OSI_Model.md
│   │   ├── Common_Ports.md
│   │   └── Network_Protocols.md
│   └── getting-started/
│       └── Setting_Up_Lab.md
├── TOOLS/
│   ├── nmap/
│   │   ├── basics/
│   │   │   ├── port-scanning-basics.sh
│   │   │   └── service-detection.sh
│   │   ├── intermediate/
│   │   │   ├── os-fingerprinting.sh
│   │   │   └── vulnerability-scanning.sh
│   │   └── advanced/
│   │       ├── nse-scripts.md
│   │       └── stealth-scanning.md
│   ├── wireshark/
│   │   ├── basics/
│   │   │   ├── packet-capture-basics.md
│   │   │   └── filtering-expressions.md
│   │   ├── intermediate/
│   │   │   ├── protocol-analysis.md
│   │   │   └── traffic-patterns.md
│   │   └── advanced/
│   │       ├── malware-traffic-analysis.md
│   │       └──VoIP-analysis.md
│   ├── kali-linux/
│   │   ├── setup/
│   │   │   └── vm-setup.md
│   │   ├── tools-overview/
│   │   │   └── essential-tools.md
│   │   └── cheatsheet.md
│   ├── ettercap/
│   │   ├── man-in-the-middle.md
│   │   └── arp-spoofing-lab.md
│   └── burp-suite/
│       ├── setup.md
│       └── web-app-testing.md
├── CTF_CHALLENGES/
│   ├── picoctf/
│   ├── hackthebox/
│   └── tryhackme/
├── LABS/
│   ├── lab-1-network-enumeration.md
│   ├── lab-2-packet-analysis.md
│   └── lab-3-mitn-attack-simulation.md
└── NOTES/
    └── cheatsheets/
```

## 🚀 Quick Start

### Prerequisites
- Kali Linux (or any Linux distro with tools installed)
- VirtualBox/VMware for lab environment
- Basic networking knowledge

### Recommended Learning Path
1. Start with `FUNDAMENTALS/` - understand networking basics
2. Move to `TOOLS/nmap/basics/` - learn reconnaissance
3. Progress to `TOOLS/wireshark/basics/` - learn packet analysis
4. Practice in `CTF_CHALLENGES/` and `LABS/`

## 📖 Learning Roadmap

###  Networking Fundamentals
- [ ] TCP/IP and OSI Models
- [ ] Common ports and protocols
- [ ] Subnetting basics
- [ ] Lab: Setting up your penetration testing lab

###  Nmap Mastery
- [ ] Basic port scanning
- [ ] Service version detection
- [ ] OS fingerprinting
- [ ] NSE scripts
- [ ] [Lab: Network Enumeration](LABS/lab-1-network-enumeration.md)

###  Wireshark Deep Dive
- [ ] Packet capture and display filters
- [ ] Protocol analysis (HTTP, DNS, TCP)
- [ ] Following streams
- [ ] [Lab: Packet Analysis](LABS/lab-2-packet-analysis.md)

###  Intermediate Attacks
- [ ] ARP spoofing basics
- [ ] Ettercap usage
- [ ] Man-in-the-middle attacks
- [ ] [Lab: MITM Simulation](LABS/lab-3-mitn-attack-simulation.md)

###  Advanced Topics
- [ ] Vulnerability scanning
- [ ] Exploitation frameworks
- [ ] Network traffic analysis for malware detection
- [ ] Defense strategies

## 🛠️ Tool Installation

```bash
# Install on Kali (already included)
sudo apt install nmap wireshark ettercap-text-only

# Install on Ubuntu/Debian
sudo apt update
sudo apt install nmap wireshark ettercap-graphical

# Install on macOS
brew install nmap wireshark
```

## 📝 Nmap Quick Reference

```bash
# Basic scan
nmap 192.168.1.1

# Scan specific ports
nmap -p 80,443 192.168.1.1

# Service version detection
nmap -sV 192.168.1.1

# OS detection
nmap -O 192.168.1.1

# Aggressive scan (OS, version, scripts, traceroute)
nmap -A 192.168.1.1

# Scan all ports
nmap -p- 192.168.1.1

# Stealth scan (SYN scan)
nmap -sS 192.168.1.1
```

## 📝 Wireshark Display Filters

```
# Filter by IP
ip.addr == 192.168.1.1

# Filter by protocol
http

# Filter by port
tcp.port == 80

# Filter HTTP traffic
http.request.method == "GET"

# Filter DNS queries
dns.qry.name contains "example"
```

## 🔗 Resources

### Documentation
- [Nmap Documentation](https://nmap.org/docs.html)
- [Wireshark Wiki](https://wiki.wireshark.org/)
- [Kali Linux Tools](https://tools.kali.org/)

### Practice Platforms
- [TryHackMe](https://tryhackme.com/)
- [HackTheBox](https://hackthebox.eu/)
- [PicoCTF](https://picoctf.org/)
- [CyberSec Labs](https://www.cyberseclabs.co.uk/)

### Books
- "The Web Application Hacker's Handbook"
- "Network Security Essentials" by William Stallings
- "Mastering Kali Linux for Advanced Penetration Testing"

## ⚠️ Disclaimer

> **EDUCATIONAL USE ONLY** - All tools and techniques in this repository are for:
> - Authorized penetration testing
> - Learning in controlled lab environments
> - CTF competitions
> - Academic research
> Always obtain proper authorization before testing any network you don't own.

## 📊 Progress Tracker

| Topics 

| Networking Basics 
| Nmap Basics 
| Nmap Advanced
| Wireshark Basics 
| Wireshark Advanced 
| Ettercap/MITM
| CTF Challenges 

## 🤝 Contributing

Feel free to add your own notes, labs, and challenges! Create a PR or open an issue.

## 📧 Connect

- GitHub: https://github.com/SZ03-C
- LinkedIn: https://www.linkedin.com/in/shaguftha-zabeen-a41371379/

---

*Made with ❤️ for learning network security*
