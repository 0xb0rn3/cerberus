# 🔒 Cerberus

[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/0xb0rn3/cerberus)
[![Arch Linux](https://img.shields.io/badge/Arch%20Linux-supported-1793D1?logo=arch-linux)](https://archlinux.org/)
[![Tor](https://img.shields.io/badge/Tor-integrated-7E4798?logo=tor)](https://www.torproject.org/)
[![License](https://img.shields.io/badge/license-GPL%20v3-green.svg)](LICENSE)
[![Maintained](https://img.shields.io/badge/maintained-yes-brightgreen.svg)](https://github.com/0xb0rn3/cerberus)

> **Advanced Tor transparent proxy with real-time exit node verification and network intelligence for Arch Linux systems**

Cerberus routes all system traffic through the Tor network while providing real-time exit node verification, automated node list updates, and comprehensive network monitoring. Built specifically for Arch-based distributions with a focus on security, performance, and reliability.

## ✨ Features

### 🚀 Core Capabilities
- **System-wide Tor routing** - All TCP/UDP traffic transparently routed through Tor
- **Real-time exit node verification** - DNS-based verification with sub-second response
- **Multi-source node database** - Automated updates from multiple trusted sources
- **IPv6 leak protection** - Complete IPv6 disable with kernel-level blocking
- **DNS leak prevention** - Secure DNS routing through Tor network
- **Identity management** - Change Tor circuits and exit nodes on demand

### 🔍 Advanced Monitoring
- **Live network monitor** - Real-time bandwidth and circuit tracking
- **Exit node intelligence** - Geolocation, ISP, and ASN information
- **Circuit inspection** - View active Tor circuits and their status
- **Node verification** - Check any IP against Tor exit databases

### ⚡ Performance Optimization
- **IPSet integration** - O(1) kernel-level IP lookups
- **Circuit isolation** - Separate circuits for different connections
- **Automated updates** - Systemd timer for 30-minute node refreshes
- **Intelligent caching** - Local node database with validation

### 🛡️ Security Hardening
- **Network hardening** - TCP timestamps disabled, ICMP protection
- **Multi-source validation** - Cross-reference node lists for accuracy
- **RAM cleaning** - Pandora module for memory wiping on shutdown
- **Process termination** - Auto-kill potentially leaking applications

## 📋 Requirements

### System
- **OS**: Arch Linux or Arch-based distributions (Manjaro, EndeavourOS, Archcraft, etc.)
- **Kernel**: Linux 4.9+ with iptables/netfilter support
- **Privileges**: Root access required for system-wide routing

### Dependencies
```bash
# Core requirements
tor iptables ipset curl bind

# Optional but recommended
secure-delete nyx torsocks xxd
htop iftop nethogs vnstat

# I2P support (optional)
i2pd
```

## 🚀 Installation

### Quick Install
```bash
# Clone the repository
git clone https://github.com/0xb0rn3/cerberus
cd cerberus
chmod +x install

# Run installer as root
sudo ./install
```

### Manual Installation
```bash
# Install dependencies
sudo pacman -S tor iptables ipset curl bind xxd secure-delete

# Copy files
sudo cp cerberus cerberus-updater cerberus-verify /usr/bin/
sudo cp cerberus-pandora /usr/bin/
sudo chmod +x /usr/bin/cerberus*

# Set up directories
sudo mkdir -p /var/lib/cerberus/cache
sudo mkdir -p /var/log/cerberus

# Install systemd services
sudo cp systemd/*.service /etc/systemd/system/
sudo cp systemd/*.timer /etc/systemd/system/
sudo systemctl daemon-reload

# Enable automated updates
sudo systemctl enable --now cerberus-updater.timer
```

### AUR Installation (Coming Soon)
```bash
yay -S cerberus-git
```

## 📖 Usage

### Basic Commands

#### Start Anonymous Mode
```bash
sudo cerberus start
```
Routes all system traffic through Tor network with IPv6 protection.

#### Stop Anonymous Mode
```bash
sudo cerberus stop
```
Restores original network configuration and stops Tor routing.

#### Check Status
```bash
sudo cerberus status
```
```
✓ Tor service is running
✓ Cerberus tunnel is active
✓ Tor connection is working
✓ Exit nodes database: 1847 nodes (updated: 2024-01-10 15:30:22)
✓ IPv6 is disabled
```

#### Show Current IP
```bash
sudo cerberus myip
```
```
Real IP (without Tor):
  203.0.113.42

Tor IP (current exit node):
  185.220.101.45
  ✓ Verified Tor exit node

✓ Traffic is being anonymized
```

### Advanced Features

#### 📊 Real-time Monitoring
```bash
sudo cerberus monitor
```
Live dashboard showing:
- Current exit node IP and verification
- Bandwidth usage statistics
- Active circuit count
- Connection status

Press `Ctrl+C` to exit monitor mode.

#### 🌍 Network Information
```bash
sudo cerberus info
```
```
Current Exit Node: 185.220.101.45
✓ Verified Tor exit node
Location/ISP: Amsterdam, Netherlands, AS197540 Neterra Ltd.

Tor Circuits:
  • 521 BUILT $A9C03...~TorExitMoldova 185.220.101.45:9001
  • 522 BUILT $7B3F2...~CalyxInstitute 162.247.74.201:443
  • 523 BUILT $9F4E6...~Unnamed 45.141.215.90:9001

Statistics:
  • Known exit nodes: 1847
  • Total Tor nodes: 6421
  • Last update: 2024-01-10 15:30:22
```

#### 🔄 Change Identity
```bash
sudo cerberus change
```
Forces new Tor circuits and exit node:
```
Changing Tor identity...
Waiting for new identity...
✓ Identity changed successfully
  Old IP: 185.220.101.45
  New IP: 192.42.116.187
```

#### ✅ Verify IP Address
```bash
sudo cerberus verify 185.220.101.45
```
```
✓ 185.220.101.45 is a Tor exit node
```

#### 🔄 Update Node Database
```bash
sudo cerberus update-nodes
```
Manually updates exit node lists from all sources:
```
Updating Tor exit node lists...
✓ Updated from dan.me.uk: 1823 exit nodes
✓ Merged GitHub data: 1847 total nodes
✓ Updated all nodes: 6421 total
✓ Loaded 1847 IPs into ipset
```

### Systemd Service

#### Run as System Service
```bash
# Enable and start
sudo systemctl enable --now cerberus

# Check service status
sudo systemctl status cerberus

# View logs
sudo journalctl -u cerberus -f
```

#### Automated Updates
The `cerberus-updater.timer` runs every 30 minutes:
```bash
# Check timer status
sudo systemctl status cerberus-updater.timer

# View update logs
sudo journalctl -u cerberus-updater
```

### Standalone Verification Tool

#### Basic Verification
```bash
cerberus-verify 185.220.101.45
```

#### Detailed Information
```bash
cerberus-verify --info 185.220.101.45
```
```
Verifying: 185.220.101.45

✓ VERIFIED via Dan.me.uk DNSBL (Exit:1 Fast:1 Guard:1 Stable:1)

Location: Amsterdam, Netherlands
ISP/ASN: Neterra Ltd. (AS197540)

Result: 185.220.101.45 is a Tor exit node
```

#### Batch Verification
```bash
# Create IP list
cat > ips.txt << EOF
185.220.101.45
192.42.116.187
8.8.8.8
EOF

# Verify all
cerberus-verify --batch ips.txt
```
```
[1] 185.220.101.45: ✓ VERIFIED via Dan.me.uk DNSBL
[2] 192.42.116.187: ✓ VERIFIED via Tor Project DNSEL
[3] 8.8.8.8: ✗ NOT A TOR EXIT

Summary:
  Total checked: 3
  Verified: 2
  Not exits: 1
```

### I2P Support

#### Start I2P Services
```bash
sudo cerberus starti2p
```
Starts I2P daemon and configures routing.

#### Stop I2P Services
```bash
sudo cerberus stopi2p
```

### RAM Security

#### Manual RAM Cleaning
```bash
sudo cerberus-pandora bomb
```
Securely wipes RAM contents (automatically runs on shutdown).

## 🏗️ Architecture

### Component Overview
```
cerberus/
├── Core Components
│   ├── cerberus           # Main routing and control script
│   ├── cerberus-updater   # Automated node list updater
│   ├── cerberus-verify    # Standalone verification tool
│   └── cerberus-pandora   # RAM security module
│
├── Configuration
│   ├── /etc/tor/torrc     # Tor daemon configuration
│   └── /etc/cerberus/     # Cerberus settings
│
├── Data Storage
│   ├── /var/lib/cerberus/cache/
│   │   ├── exit-nodes.txt # Current exit node list
│   │   └── all-nodes.txt  # All Tor nodes
│   └── /var/log/cerberus/ # Application logs
│
└── Systemd Integration
    ├── cerberus.service          # Main service
    ├── cerberus-updater.service  # Update service
    ├── cerberus-updater.timer    # Update scheduler
    └── cerberus-pandora.service  # Shutdown hook
```

### Data Sources
- **[dan.me.uk/tornodes](https://www.dan.me.uk/tornodes)** - 30-minute updates with metadata
- **[GitHub/platformbuilds](https://github.com/platformbuilds/Tor-IP-Addresses)** - Hourly automated updates
- **DNS Verification** - Real-time via DNSBL queries

### Network Flow
```
Application → iptables → Tor (9040) → Exit Node → Internet
                ↓
            DNS (5354) → Tor DNS
```

## 🔧 Configuration

### Tor Settings (`/etc/tor/torrc`)
```bash
# Performance tuning
NumCPUs 2                    # CPU cores to use
CircuitBuildTimeout 10       # Faster circuit building
MaxCircuitDirtiness 600      # Circuit lifetime (seconds)

# Security
ExcludeSingleHopRelays 1     # No single-hop circuits
EnforceDistinctSubnets 1     # Path diversity
ClientOnly 1                 # Never be a relay
```

### Network Hardening (`/etc/sysctl.d/98-cerberus.conf`)
```bash
# IPv6 disable
net.ipv6.conf.all.disable_ipv6 = 1

# Security hardening
net.ipv4.tcp_timestamps = 0
net.ipv4.conf.all.rp_filter = 1
net.ipv4.icmp_echo_ignore_broadcasts = 1
```

## 🚨 Troubleshooting

### Common Issues

#### Tor Won't Start
```bash
# Check Tor configuration
sudo -u tor tor --verify-config

# View Tor logs
sudo journalctl -u tor -n 50

# Reset Tor
sudo systemctl stop tor
sudo rm -rf /var/lib/tor/*
sudo systemctl start tor
```

#### No Internet After Starting
```bash
# Verify Tor is running
sudo cerberus status

# Check iptables rules
sudo iptables -t nat -L

# Test Tor connection
curl --socks5-hostname 127.0.0.1:9050 https://check.torproject.org/
```

#### DNS Not Working
```bash
# Check DNS configuration
cat /etc/resolv.conf

# Test DNS through Tor
dig @127.0.0.1 -p 5354 example.com

# Restart DNS
sudo systemctl restart systemd-resolved
```

#### Exit Nodes Not Updating
```bash
# Manual update
sudo cerberus-updater --once

# Check timer
sudo systemctl status cerberus-updater.timer

# View update logs
sudo journalctl -u cerberus-updater --since "1 hour ago"
```

### Reset Everything
```bash
# Complete reset
sudo cerberus stop
sudo systemctl stop cerberus-updater.timer
sudo rm -rf /var/lib/cerberus/cache/*
sudo iptables -F
sudo iptables -t nat -F
sudo ip6tables -P INPUT ACCEPT
sudo ip6tables -P OUTPUT ACCEPT
sudo systemctl restart NetworkManager
```
### Tor service is masked 
```bash
1. Fix the Masked Tor Service
The tor.service is currently masked, which prevents it from starting. Run these commands:
# Unmask the tor service
sudo systemctl unmask tor.service

# Enable the tor service
sudo systemctl enable tor.service

# Check if tor service can start now
sudo systemctl start tor.service

# Verify status
sudo systemctl status tor.service
'''
2. Fix Package Conflicts
# Remove the conflicting package
sudo pacman -R openbsd-netcat

# Install gnu-netcat
sudo pacman -S gnu-netcat

# Re-run the installer if needed
sudo ./install
```

Complete System Reset and Restart
If the above doesn't work, try a complete reset:
```bash
# Stop all cerberus processes
sudo cerberus stop

# Kill any remaining tor processes
sudo pkill -f tor

# Remove any existing tor lock files
sudo rm -f /run/tor/tor.pid
sudo rm -f /var/lib/tor/lock

# Reset tor directories permissions
sudo chown -R tor:tor /var/lib/tor
sudo chown -R tor:tor /var/log/tor  
sudo chown -R tor:tor /run/tor

# Try starting tor manually first
sudo systemctl start tor.service

# If successful, try cerberus
sudo cerberus start
```
## 🔒 Security Considerations

### ⚠️ Important Warnings

1. **Exit Node Trust** - Exit nodes can see unencrypted traffic. Always use HTTPS.
2. **Browser Fingerprinting** - Use Tor Browser for web browsing when possible.
3. **Application Leaks** - Some applications may bypass system proxy settings.
4. **Correlation Attacks** - Long-lived connections increase correlation risk.

### ✅ Best Practices

- **Verify IP regularly** - Always check `cerberus myip` after starting
- **Use HTTPS everywhere** - Install HTTPS Everywhere extension
- **Avoid personal accounts** - Don't log into personal accounts over Tor
- **Regular identity changes** - Use `cerberus change` periodically
- **Monitor connections** - Use `cerberus monitor` to watch traffic
- **Keep updated** - Enable `cerberus-updater.timer` for fresh node lists

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests.

### Development Setup
```bash
# Clone repository
git clone https://github.com/0xb0rn3/cerberus
cd cerberus

# Create branch
git checkout -b feature/your-feature

# Test changes
sudo ./cerberus stop
sudo cp cerberus /usr/bin/cerberus
sudo ./cerberus start

# Submit PR
git add .
git commit -m "Add feature"
git push origin feature/your-feature
```

### Testing
Fully tested on:
- **Archcraft** (primary development platform)
- **Arch Linux** (reference implementation)
- **Manjaro** (confirmed working)
- **EndeavourOS** (confirmed working)

## 📝 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Engineered by 0xb0rn3 | 0xbv1**

- GitHub: [@0xb0rn3](https://github.com/0xb0rn3)
- Repository: [github.com/0xb0rn3/cerberus](https://github.com/0xb0rn3/cerberus)

## 🙏 Acknowledgments

- [Tor Project](https://www.torproject.org/) - For the amazing anonymity network
- [dan.me.uk](https://www.dan.me.uk/tornodes) - For reliable exit node data
- [platformbuilds](https://github.com/platformbuilds/Tor-IP-Addresses) - For automated node lists
- [Parrot Security](https://www.parrotsec.org/) - Original AnonSurf inspiration
- Arch Linux community - For the excellent distribution

## 📊 Stats

- **Active Exit Nodes**: ~1,800-2,000
- **Total Tor Nodes**: ~6,000-7,000
- **Update Frequency**: 30 minutes
- **Verification Speed**: <100ms
- **Database Accuracy**: 99%+

---

<div align="center">

**🔒 Stay Anonymous, Stay Secure**

*Cerberus - Guardian of Your Digital Privacy*

</div>
