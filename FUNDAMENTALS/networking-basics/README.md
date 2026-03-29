# 🌐 Networking Fundamentals

This directory covers the essential networking concepts you need before diving into security tools.

## 📁 Structure

```
networking-basics/
├── TCP_IP_Model.md      # TCP/IP protocol suite
├── OSI_Model.md         # 7-layer OSI model
├── Common_Ports.md      # Well-known ports reference
├── Network_Protocols.md # Common protocols explained
└── Subnetting.md        # IP subnetting basics
```

## 📖 Topics Covered

### 1. TCP/IP Model
The foundational protocol suite of the internet.

**Layers:**
- Application Layer
- Transport Layer
- Internet Layer
- Network Access Layer

### 2. OSI Model
The 7-layer reference model for network communication.

| Layer | Number | Protocols | Function |
|-------|--------|-----------|----------|
| Application | 7 | HTTP, FTP, SMTP | User interface |
| Presentation | 6 | SSL, TLS | Data formatting |
| Session | 5 | NetBIOS | Session management |
| Transport | 4 | TCP, UDP | Reliability |
| Network | 3 | IP, ICMP | Routing |
| Data Link | 2 | Ethernet | MAC addressing |
| Physical | 1 | Bits, signals | Physical transmission |

### 3. Common Ports

| Port | Service | Security Note |
|------|---------|---------------|
| 21 | FTP | Unencrypted, use SFTP |
| 22 | SSH | Secure, but brute force target |
| 23 | Telnet | Unencrypted, avoid |
| 25 | SMTP | Email relay risks |
| 53 | DNS | Cache poisoning attacks |
| 80 | HTTP | Use HTTPS instead |
| 443 | HTTPS | Encrypted web traffic |
| 445 | SMB | EternalBlue vulnerability |
| 3306 | MySQL | Database exposure risk |
| 3389 | RDP | BlueKeep vulnerability |

### 4. Key Protocols

**TCP (Transmission Control Protocol)**
- Connection-oriented
- Reliable delivery
- Three-way handshake: SYN → SYN-ACK → ACK

**UDP (User Datagram Protocol)**
- Connectionless
- Fast but unreliable
- Used for DNS, VoIP, Gaming

**HTTP/HTTPS**
- Web traffic protocols
- HTTPS uses TLS encryption

**DNS (Domain Name System)**
- Translates domain names to IPs
- Attack vector: DNS spoofing, cache poisoning

## 🔍 Security Considerations

### Ports to Monitor
- 21, 23, 445: Legacy services often exploited
- 3389, 5900: Remote access targets
- 1433, 3306, 5432: Database ports

### Firewall Best Practices
```bash
# List open ports
sudo netstat -tuln

# Check listening services
sudo lsof -i -P -n

# iptables basics
sudo iptables -L -n
```

## 📝 Quick Quiz

1. What layer is IP on in the OSI model?
2. What is the difference between TCP and UDP?
3. Why is Telnet considered insecure?
4. What port does DNS typically use?

*Answers in answers.md*

---

[← Back to main README](../README.md) | [Next: Getting Started →](../getting-started/Setting_Up_Lab.md)
