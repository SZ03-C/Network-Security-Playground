# 🌐 OSI Model Reference

The OSI (Open Systems Interconnection) model is a conceptual framework with 7 layers that standardizes network communication functions.

## 📊 The 7 Layers at a Glance

```
┌────────────────────────────────────────────────────────────┐
│  Layer    │  Number  │  PDU         │  Devices            │
├───────────┼──────────┼──────────────┼─────────────────────┤
│ Application│    7    │  Data        │  Firewalls, Proxies  │
│ Presentation│   6    │  Data        │  Encryption, SSL     │
│ Session     │   5    │  Data        │  Session Mgmt        │
│ Transport   │   4    │  Segments    │  Firewalls          │
│ Network     │   3    │  Packets     │  Routers            │
│ Data Link   │   2    │  Frames      │  Switches, NICs     │
│ Physical    │   1    │  Bits        │  Hubs, Cables       │
└────────────────────────────────────────────────────────────┘
```

## 🔍 Detailed Breakdown

### Layer 7: Application Layer

**What it does:** Interface between user and network services

**Protocols:** HTTP, HTTPS, FTP, SMTP, POP3, IMAP, DNS, DHCP, SSH, Telnet

**Security Concerns:**
- Phishing attacks via HTTP
- Data exfiltration via FTP
- DNS tunneling
- Weak authentication

**PDU:** Data

---

### Layer 6: Presentation Layer

**What it does:** Data formatting, encryption/decryption, compression

**Protocols:** SSL/TLS, JPEG, GIF, MPEG, ASCII, EBCDIC

**Security Concerns:**
- SSL/TLS vulnerabilities (POODLE, BEAST)
- Certificate issues
- Encryption weaknesses

**PDU:** Data

---

### Layer 5: Session Layer

**What it does:** Manages connections between applications, session handling

**Protocols:** NetBIOS, RPC, SQL, NFS, NetWare

**Security Concerns:**
- Session hijacking
- Session fixation
- Man-in-the-middle attacks

**PDU:** Data

---

### Layer 4: Transport Layer

**What it does:** Reliable data delivery, error recovery, flow control

**Protocols:** TCP, UDP, DCCP, SCTP

| Feature | TCP | UDP |
|---------|-----|-----|
| Connection | Connection-oriented | Connectionless |
| Reliability | Reliable | Unreliable |
| Speed | Slower | Faster |
| Use Case | Web, Email | Video, DNS |

**Security Concerns:**
- SYN floods (DoS)
- Port scanning detection
- TCP sequence prediction

**PDU:** Segments

---

### Layer 3: Network Layer

**What it does:** Routing, logical addressing (IP)

**Protocols:** IP (IPv4, IPv6), ICMP, IGMP, OSPF, BGP

**Security Concerns:**
- IP spoofing
- Routing attacks
- ICMP floods
- IP fragmentation attacks

**PDU:** Packets

---

### Layer 2: Data Link Layer

**What it does:** Physical addressing (MAC), framing, error detection

**Protocols:** Ethernet, ARP, PPP, Switches, NICs

**Security Concerns:**
- MAC spoofing
- ARP poisoning
- VLAN hopping
- Switch attacks

**PDU:** Frames

---

### Layer 1: Physical Layer

**What it does:** Physical transmission of bits via cables, signals

**Devices:** Hubs, Repeaters, Cables, Connectors

**Security Concerns:**
- Cable tapping
- Electromagnetic interference
- Physical access

**PDU:** Bits

## 🔄 Data Flow

```
┌─────────┐      ┌─────────┐      ┌─────────┐
│ App     │ Data │ App     │ Enc  │ App     │
│ Layer 7 │ ───▶ │ Layer 7 │ ───▶ │ Layer 7 │
├─────────┤      ├─────────┤      ├─────────┤
│ Pres.   │ Data │ Pres.   │ Enc  │ Pres.   │
│ Layer 6 │ ───▶ │ Layer 6 │ ───▶ │ Layer 6 │
├─────────┤      ├─────────┤      ├─────────┤
│ Session │ Data │ Session │ Data │ Session │
│ Layer 5 │ ───▶ │ Layer 5 │ ───▶ │ Layer 5 │
├─────────┤      ├─────────┤      ├─────────┤
│ Trans.  │ Seg  │ Trans.  │ Seg  │ Trans.  │
│ Layer 4 │ ───▶ │ Layer 4 │ ───▶ │ Layer 4 │
├─────────┤      ├─────────┤      ├─────────┤
│ Network │ Pkts │ Network │ Pkts │ Network │
│ Layer 3 │ ───▶ │ Layer 3 │ ───▶ │ Layer 3 │
├─────────┤      ├─────────┤      ├─────────┤
│ Data    │ Frame│ Data    │ Frame│ Data    │
│ Link 2  │ ───▶ │ Link 2  │ ───▶ │ Link 2  │
├─────────┤      ├─────────┤      ├─────────┤
│ Physical│ Bits │ Physical│ Bits │ Physical│
│ Layer 1 │ ───▶ │ Layer 1 │ ───▶ │ Layer 1 │
└─────────┘      └─────────┘      └─────────┘
 Sender          Encapsulation     Receiver
```

## 🎯 Security Mapping

| Layer | Attack Type | Example |
|-------|-------------|---------|
| 7 | Application attacks | SQL Injection, XSS |
| 6 | Encoding attacks | Character encoding bypass |
| 5 | Session attacks | Session hijacking |
| 4 | Protocol attacks | SYN flood, TCP reset |
| 3 | Routing attacks | IP spoofing, route injection |
| 2 | Switch attacks | ARP spoofing, MAC flooding |
| 1 | Physical attacks | Cable tapping |

## 🛡️ Defense by Layer

| Layer | Defense Tools |
|-------|---------------|
| 7 | WAF, Application Firewalls |
| 6 | TLS/SSL, Certificate Management |
| 5 | Session tokens, CSRF tokens |
| 4 | Stateful Firewalls, TCP flags |
| 3 | Routers with ACLs, IPSec |
| 2 | 802.1X, Port Security, VLANs |
| 1 | Locked racks, Secure cables |

## 📝 Memory Trick

**A**ll **P**eople **S**eem **T**o **N**eed **D**ata **P**rocessing

| A | P | S | T | N | D | P |
|---|---|---|---|---|---|---|
| Application | Presentation | Session | Transport | Network | Data | Physical |

## 🔗 Related Topics

- [TCP/IP Model](TCP_IP_Model.md)
- [Common Ports](Common_Ports.md)
- [Network Protocols](Network_Protocols.md)

---

[← Back to Networking Basics](../README.md) | [Common Ports →](Common_Ports.md)
