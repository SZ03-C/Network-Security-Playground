# 📡 Wireshark Basics - Packet Capture & Analysis

Wireshark is the world's foremost network protocol analyzer.

## 📖 What is Wireshark?

A tool that lets you capture and interactively browse network traffic.

```
┌─────────────────────────────────────────────────────┐
│                    WIRESHARK                        │
├─────────────────────────────────────────────────────┤
│                                                     │
│  Capture Filters    │    Display Filters           │
│  ─────────────     │    ───────────────           │
│  tcp port 80       │    ip.addr == 192.168.1.1    │
│  udp               │    http.request.method        │
│  host 192.168.1.1  │    tcp.port == 443           │
│                                                     │
├─────────────────────────────────────────────────────┤
│  Packet List      │  Packet Details                │
│  ───────────      │  ────────────────              │
│  #  Time    Info  │  ▼ Frame 1                    │
│  1  0.000  SYN    │    ▼ Ethernet II              │
│  2  0.001  SYN/ACK│      Src: Dell_xx:xx:xx       │
│  3  0.002  ACK    │      Dst: Intel_xx:xx:xx      │
│                    │    ▼ Internet Protocol       │
└─────────────────────────────────────────────────────┘
```

## 🔧 Installation

```bash
# Linux
sudo apt install wireshark

# macOS
brew install --cask wireshark

# Windows
# Download from https://www.wireshark.org/download.html
```

## 🎯 Basic Capture

### Start Capture
```bash
# Capture on specific interface
sudo wireshark -i eth0

# Capture with filter
sudo wireshark -i eth0 -f "port 80"

# Capture to file
sudo wireshark -i eth0 -w capture.pcap

# Open existing capture
wireshark capture.pcap
```

### GUI Capture Options
1. Select Interface (eth0, wlan0, etc.)
2. Click "Start" or press Ctrl+E
3. Stop capture with red button or Ctrl+E

## 📝 Display Filters

### Comparison Operators
| Operator | Meaning |
|----------|---------|
| `==` | Equals |
| `!=` | Not equals |
| `>` `<` | Greater/Less than |
| `>=` `<=` | And more |
| `contains` | Contains string |
| `matches` | Regex match |

### Logical Operators
| Operator | Meaning |
|----------|---------|
| `and` / `&&` | Both conditions |
| `or` / `||` | Either condition |
| `not` / `!` | Negation |

### Common Filters

```wireshark
# Filter by IP
ip.addr == 192.168.1.1
ip.src == 192.168.1.1
ip.dst == 192.168.1.1

# Filter by Protocol
http
dns
tcp
udp
arp

# Filter by Port
tcp.port == 80
udp.port == 53
tcp.port > 80

# HTTP Traffic
http.request.method == "GET"
http.request.uri contains "/login"
http.host == "example.com"

# TCP Analysis
tcp.flags.syn == 1
tcp.flags.fin == 1
tcp.stream eq 0

# DNS Queries
dns.qry.name contains "google"
dns.flags.response == 0

# Filter by String
frame contains "password"
```

## 🔍 Analyzing Packets

### TCP Three-Way Handshake
```
┌──────────────────────────────────────────────────────┐
│              TCP THREE-WAY HANDSHAKE                  │
├──────────────────────────────────────────────────────┤
│                                                      │
│  Client                    Server                     │
│    │                          │                       │
│    │─────── SYN ────────────▶│  Seq=100              │
│    │                          │                       │
│    │◀────── SYN/ACK ─────────│  Seq=200, Ack=101     │
│    │                          │                       │
│    │─────── ACK ────────────▶│  Ack=201              │
│    │                          │                       │
│  Connection Established!                            │
│                                                      │
└──────────────────────────────────────────────────────┘
```

### Follow TCP Stream
1. Right-click a packet → "Follow" → "TCP Stream"
2. See full conversation between client/server

### Packet Details
```
Frame 1: 74 bytes on wire, 74 bytes captured
└── Ethernet II, Src: aa:bb:cc:dd:ee:ff, Dst: 11:22:33:44:55:66
    └── Internet Protocol Version 4, Src: 192.168.1.1, Dst: 8.8.8.8
        └── Transmission Control Protocol, Src Port: 54321, Dst Port: 80
            └── Hypertext Transfer Protocol
                └── GET / HTTP/1.1
```

## 📊 Statistics Menu

| Option | Use |
|--------|-----|
| Protocol Hierarchy | See % of each protocol |
| Conversations | See who talks to whom |
| Endpoints | List of IPs/MACs |
| Packet Lengths | Distribution of packet sizes |
| Flow Graph | Visual of TCP flows |

## 🎯 Lab Exercise

### Task 1: Capture HTTP Traffic
```bash
# Start capture, filter for http
sudo wireshark -i eth0 -f "port 80"
```
Visit a website and observe:
- GET requests
- HTTP response codes
- Request/Response headers

### Task 2: Analyze DNS
```bash
# Filter DNS traffic
dns
```
Visit a website and observe:
- DNS query for the domain
- DNS response with IP

### Task 3: TCP Retransmissions
Look for:
- Duplicate ACKs
- Retransmissions
- Out-of-order packets

## 💡 Tips

1. **Color Coding:**
   - Green = TCP traffic
   - Blue = HTTP traffic
   - Black = Errors
   - Red = Malformed packets

2. **Save Often:** Ctrl+S saves capture file

3. **Expert Info:** View → Expert Information (problems/warnings)

4. **Merge Captures:** File → Merge

## 📚 Next Steps

- [Filtering Expressions](filtering-expressions.md)
- [Protocol Analysis](protocol-analysis.md)
- [Following Streams](following-streams.md)

---

[← Back to Tools](../README.md) | [Lab: Packet Analysis →](../../LABS/lab-2-packet-analysis.md)
