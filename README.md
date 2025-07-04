# Cerberus 🛡️

**Advanced System-Wide Anonymity Tool for Arch Linux**

[![Version](https://img.shields.io/badge/version-0.0.1%20Alfa-red.svg)](https://github.com/0xb0rn3/cerberus)
[![License](https://img.shields.io/badge/license-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Platform](https://img.shields.io/badge/platform-Arch%20Linux-brightgreen.svg)](https://archlinux.org/)
[![Tor](https://img.shields.io/badge/powered%20by-Tor-purple.svg)](https://www.torproject.org/)

```
  ██████╗███████╗██████╗ ██████╗ ███████╗██████╗ ██╗   ██╗███████╗
 ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝
 ██║     █████╗  ██████╔╝██████╔╝█████╗  ██████╔╝██║   ██║███████╗
 ██║     ██╔══╝  ██╔══██╗██╔══██╗██╔══╝  ██╔══██╗██║   ██║╚════██║
 ╚██████╗███████╗██║  ██║██████╔╝███████╗██║  ██║╚██████╔╝███████║
  ╚═════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
```

**The Ultimate Anonymity Solution - Designed by 0xb0rn3**

---

## 🚀 Overview

Cerberus is a next-generation, system-wide anonymity tool specifically designed for Arch Linux. It provides military-grade privacy protection by routing all network traffic through Tor while implementing advanced anti-surveillance measures including MAC address randomization, DNS leak protection, and comprehensive system hardening.

Unlike basic proxy tools, Cerberus offers **complete system anonymization** with professional-grade features and an intuitive interface that makes advanced privacy accessible to everyone.

## ✨ Key Features

### 🛡️ **Advanced Anonymity Protection**
- **Transparent Tor Proxy** - All traffic automatically routed through Tor
- **MAC Address Randomization** - Randomizes all network interface MAC addresses
- **DNS Leak Protection** - Multiple layers of DNS protection with fallback servers
- **IPv6 Complete Blocking** - Prevents IPv6 leaks entirely
- **Anti-Traffic Analysis** - Advanced circuit management and path selection

### 🔧 **System-Wide Security**
- **Advanced Iptables Rules** - Multi-table firewall configuration (nat, mangle, raw, filter)
- **Kernel Hardening** - System parameters optimized for security
- **Process Isolation** - Tor runs with proper user isolation
- **Memory Protection** - Prevents information leaks through kernel hardening
- **Connection Tracking** - Intelligent connection state management

### 🎯 **Professional Features**
- **Single Binary Script** - Everything in one self-contained executable
- **Auto-Setup** - Automatically installs dependencies and configures system
- **Real-time Status** - Live monitoring of protection level and IP changes
- **Comprehensive Logging** - Detailed activity logs with timestamps
- **Graceful Cleanup** - Automatic restoration of original settings

### 💻 **User Experience**
- **Stunning Visual Interface** - Professional ASCII art and color-coded status
- **Clear Status Messages** - "LOCKDOWN SUCCESSFUL" / "LOCKDOWN FAILED" indicators
- **IP Monitoring** - Shows before/after IP addresses
- **Protection Overview** - Real-time display of active security measures
- **Error Recovery** - Automatic cleanup and rollback on failures

## 📋 Requirements

### **System Requirements**
- **Operating System**: Arch Linux (primary), compatible with most Linux distributions
- **Privileges**: Root access required for system-wide configuration
- **Architecture**: x86_64 (amd64)
- **Memory**: Minimum 512MB RAM
- **Storage**: 100MB free space for logs and backups

### **Dependencies**
Cerberus automatically installs these dependencies if missing:
- `tor` - The Tor anonymity network client
- `iptables` - Advanced firewall management
- `curl` - HTTP client for connectivity testing
- `wget` - File download utility
- `dnsutils` - DNS lookup utilities
- `macchanger` - MAC address randomization tool

## 🔧 Installation

### **Quick Installation**
```bash
# Download Cerberus
wget https://raw.githubusercontent.com/0xb0rn3/cerberus/main/cerberus

# Make executable
chmod +x cerberus

# Run with root privileges
sudo ./cerberus start
```

### **Manual Installation**
```bash
# Clone repository
git clone https://github.com/0xb0rn3/cerberus.git
cd cerberus

# Make executable
chmod +x cerberus

# Install (optional - for system-wide access)
sudo cp cerberus /usr/local/bin/
```

## 🎮 Usage

### **Basic Commands**
```bash
# Start anonymity protection
sudo ./cerberus start

# Check current status
sudo ./cerberus status

# Restart for new IP
sudo ./cerberus restart

# Stop protection
sudo ./cerberus stop

# Show help
sudo ./cerberus help
```

### **Command Details**

#### **Start Protection**
```bash
sudo ./cerberus start
```
**What it does:**
- Checks system requirements and installs missing packages
- Randomizes MAC addresses for all network interfaces
- Configures Tor with advanced anonymity settings
- Applies strict iptables rules for traffic isolation
- Enables DNS protection and IPv6 blocking
- Applies system hardening measures
- Verifies Tor connectivity and displays status

**Example Output:**
```
╔════════════════════════════════════════════════════════════════════════╗
║                         🛡️  LOCKDOWN SUCCESSFUL 🛡️                         ║
╚════════════════════════════════════════════════════════════════════════╝

[NETWORK STATUS]
  Previous IP: 192.168.1.100
  Current IP:  185.220.101.45
  Tor Status:  Connected
  Anonymity:   High

[ACTIVE PROTECTIONS]
  ✓ Tor Transparent Proxy
  ✓ Advanced Iptables Rules
  ✓ MAC Address Randomization
  ✓ DNS Protection
  ✓ IPv6 Disabled
  ✓ System Hardening
```

#### **Check Status**
```bash
sudo ./cerberus status
```
Shows current protection level, IP address, and active security measures.

#### **Restart Protection**
```bash
sudo ./cerberus restart
```
Restarts Tor service to get a new circuit and IP address while maintaining all protections.

#### **Stop Protection**
```bash
sudo ./cerberus stop
```
Safely disables all protections and restores original system configuration.

## 🔒 Security Features

### **Network Layer Protection**
- **Transparent Proxy**: All TCP traffic automatically routed through Tor
- **DNS Interception**: All DNS queries routed through Tor DNS port
- **IPv6 Blocking**: Complete IPv6 stack disabled to prevent leaks
- **MAC Randomization**: Network interface identifiers randomized

### **Firewall Configuration**
- **Multi-table Rules**: Comprehensive iptables rules across all tables
- **Connection Tracking**: Intelligent state-based filtering
- **Owner-based Filtering**: Process-level network access control
- **Anti-leak Protection**: Prevents direct connections outside Tor

### **System Hardening**
- **Kernel Parameters**: Security-focused system configuration
- **Process Isolation**: Tor runs with minimal privileges
- **Memory Protection**: Prevents information disclosure
- **File Permissions**: Strict access controls on configuration files

### **Tor Optimization**
- **Circuit Management**: Optimized circuit building and refresh
- **Entry Guards**: Enhanced guard selection for better anonymity
- **Path Selection**: Diverse routing for traffic analysis resistance
- **Performance Tuning**: Balanced security and connection speed

## 📊 Technical Specifications

### **Network Configuration**
- **Tor SOCKS Port**: 9050
- **Tor DNS Port**: 5353
- **Tor Transparent Port**: 9040
- **Tor Control Port**: 9051

### **File Locations**
- **Main Script**: `./cerberus`
- **Configuration**: `/etc/cerberus/`
- **Data Directory**: `/usr/share/cerberus/`
- **Backup Directory**: `/var/lib/cerberus/backups/`
- **Log Directory**: `/var/log/cerberus/`
- **Lock File**: `/var/run/cerberus.lock`

### **Process Management**
- **PID File**: `/var/run/cerberus.pid`
- **Service User**: `tor`
- **Log Rotation**: Automatic log management
- **Cleanup**: Graceful shutdown and restoration

## 🛠️ Advanced Usage

### **Environment Variables**
```bash
# Enable debug mode
export CERBERUS_DEBUG=1
sudo ./cerberus start

# Custom log level
export CERBERUS_LOG_LEVEL=verbose
sudo ./cerberus start
```

### **Custom Configuration**
Cerberus automatically creates optimal configurations, but advanced users can modify:
- `/etc/cerberus/cerberus.conf` - Main configuration
- `/etc/tor/torrc` - Tor configuration (backed up automatically)
- `/etc/iptables/iptables.rules` - Firewall rules

### **Monitoring and Logging**
```bash
# View real-time logs
sudo tail -f /var/log/cerberus/cerberus.log

# Check system status
sudo ./cerberus status

# View Tor logs
sudo journalctl -u tor -f
```

## 🔍 Troubleshooting

### **Common Issues**

#### **"LOCKDOWN FAILED" Error**
```bash
# Check Tor service status
sudo systemctl status tor

# Verify network connectivity
ping -c 4 8.8.8.8

# Check firewall rules
sudo iptables -L -n
```

#### **Dependencies Not Installing**
```bash
# Manual package installation
sudo pacman -S tor iptables curl wget dnsutils macchanger

# Update package database
sudo pacman -Syu
```

#### **Permission Errors**
```bash
# Ensure running as root
sudo ./cerberus start

# Check file permissions
ls -la cerberus
```

#### **Network Interface Issues**
```bash
# List network interfaces
ip link show

# Check interface status
sudo ip addr show
```

### **Debug Mode**
```bash
# Run in debug mode for verbose output
export CERBERUS_DEBUG=1
sudo ./cerberus start
```

### **Recovery Mode**
If Cerberus fails to start or stop properly:
```bash
# Force cleanup
sudo systemctl stop tor
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X

# Restore backups manually
sudo cp /var/lib/cerberus/backups/resolv.conf.backup /etc/resolv.conf
sudo cp /var/lib/cerberus/backups/torrc.backup /etc/tor/torrc
```

## 📈 Performance

### **System Impact**
- **CPU Usage**: < 5% during normal operation
- **Memory Usage**: ~50MB additional RAM
- **Network Latency**: +100-500ms (typical for Tor)
- **Bandwidth**: Depends on Tor circuit quality

### **Optimization Tips**
1. **Restart periodically** to get faster circuits
2. **Use for sensitive activities only** to minimize latency impact
3. **Monitor logs** for performance issues
4. **Keep system updated** for best compatibility

## 🔐 Security Considerations

### **What Cerberus Protects Against**
- ✅ **IP Address Tracking**
- ✅ **DNS Surveillance**
- ✅ **Traffic Analysis**
- ✅ **MAC Address Tracking**
- ✅ **IPv6 Leaks**
- ✅ **Deep Packet Inspection**
- ✅ **Network Fingerprinting**

### **What Cerberus Cannot Protect Against**
- ❌ **Browser Fingerprinting** (use Tor Browser)
- ❌ **Application-level Tracking** (cookies, sessions)
- ❌ **Malware/Keyloggers**
- ❌ **Social Engineering**
- ❌ **Physical Access**
- ❌ **Compromised Exit Nodes** (inherent Tor limitation)

### **Best Practices**
1. **Use with Tor Browser** for complete web anonymity
2. **Avoid logging into personal accounts** while protected
3. **Use VPN + Cerberus** for enhanced protection
4. **Regular IP rotation** with restart command
5. **Monitor for DNS leaks** using online tools

## 🤝 Contributing

### **How to Contribute**
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

### **Development Setup**
```bash
# Clone repository
git clone https://github.com/0xb0rn3/cerberus.git
cd cerberus

# Create test environment
sudo ./cerberus start
# Test your changes
sudo ./cerberus stop
```

### **Reporting Issues**
- **GitHub Issues**: [https://github.com/0xb0rn3/cerberus/issues](https://github.com/0xb0rn3/cerberus/issues)
- **Email**: 0xb0rn3@proton.me
- **Include**: System details, error messages, and steps to reproduce

## 📜 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

```
Copyright (C) 2024 0xb0rn3

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
```

## 🎯 Roadmap

### **Version 0.0.2 (Upcoming)**
- [ ] Web-based GUI interface
- [ ] VPN integration support
- [ ] Multiple Tor instance support
- [ ] Advanced circuit selection
- [ ] Steganography features

### **Version 0.1.0 (Future)**
- [ ] Mobile device support
- [ ] Cryptocurrency integration
- [ ] Distributed anonymity network
- [ ] AI-powered traffic analysis resistance
- [ ] Plugin system for extensions

## 👨‍💻 Author

**0xb0rn3**
- **GitHub**: [github.com/0xb0rn3](https://github.com/0xb0rn3)
- **Email**: 0xb0rn3@proton.me
- **Instagram**: theehiv3
- **Specialization**: Advanced cybersecurity, anonymity tools, privacy research

## 🙏 Acknowledgments

- **Tor Project** - For providing the anonymity network
- **Arch Linux Community** - For the excellent distribution
- **Privacy Advocates** - For fighting for digital rights
- **Security Researchers** - For continuous improvement of anonymity tools

## ⚠️ Disclaimer

This tool is for educational and legitimate privacy purposes only. Users are responsible for complying with all applicable laws and regulations in their jurisdiction. The author assumes no responsibility for misuse of this software.

**Use responsibly and ethically.**

---

**Made with ❤️ for privacy advocates and security researchers**

[![Follow on GitHub](https://img.shields.io/github/followers/0xb0rn3?style=social)](https://github.com/0xb0rn3)
[![Star this repo](https://img.shields.io/github/stars/0xb0rn3/cerberus?style=social)](https://github.com/0xb0rn3/cerberus)
