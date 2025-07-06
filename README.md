# Cerberus v1.0.0AlfaStable

**Transparent proxy through TOR for anonymous web browsing**

Engineered by **0xb0rn3 | 0xbv1**  

## Overview

Cerberus is a transparent proxy tool that routes all system traffic through the TOR network for anonymous web browsing. It's specifically designed and optimized for Arch-based Linux distributions.

## Features

- **System-wide anonymization** through TOR network
- **IPv6 traffic blocking** to prevent leaks
- **DNS leak protection** with secure DNS servers
- **I2P network support** for additional anonymity layers
- **RAM memory cleaning** (Pandora module) on shutdown
- **Iptables traffic routing** with automatic rule management
- **Identity changing** for new TOR exit nodes
- **Minimal and clean interface** without unnecessary UI elements

## Installation

### Method 1: Using the installer script
```bash
git clone https://github.com/0xb0rn3/cerberus
cd cerberus
chmod +x install
sudo ./install
```

### Method 2: Manual installation
```bash
# Install dependencies
sudo pacman -S tor iptables secure-delete curl

# Clone and install
git clone https://github.com/0xb0rn3/cerberus
cd cerberus
sudo cp cerberus /usr/bin/cerberus
sudo cp cerberus-pandora /usr/bin/cerberus-pandora
sudo chmod +x /usr/bin/cerberus /usr/bin/cerberus-pandora

# Install systemd service
sudo cp cerberus-pandora.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable cerberus-pandora.service
```

## Usage

### Basic Commands

```bash
# Start anonymous tunneling
sudo cerberus start

# Stop anonymous tunneling
sudo cerberus stop

# Restart Cerberus
sudo cerberus restart

# Check status
sudo cerberus status

# Show current IP address
sudo cerberus myip

# Change TOR identity (new exit node)
sudo cerberus change
```

### I2P Support

```bash
# Start I2P services
sudo cerberus starti2p

# Stop I2P services
sudo cerberus stopi2p
```

### RAM Cleaning (Pandora Module)

```bash
# Clean RAM memory
sudo cerberus-pandora bomb
```

## Configuration

### TOR Configuration
Cerberus uses a custom TOR configuration located at `/etc/tor/torrc`:

```
VirtualAddrNetwork 10.192.0.0/10
AutomapHostsOnResolve 1
TransPort 9040
SocksPort 9050
DNSPort 53
RunAsDaemon 1
```

### DNS Settings
- Primary DNS: 127.0.0.1 (TOR DNS)
- Fallback DNS: 209.222.18.222, 209.222.18.218 (Private Internet Access DNS)

### Excluded Networks
Local networks are excluded from TOR routing:
- 192.168.0.0/16
- 172.16.0.0/12
- 10.0.0.0/8

## Security Features

### Traffic Routing
- All TCP/UDP traffic routed through TOR (port 9040)
- DNS queries routed through TOR DNS (port 53)
- SOCKS proxy available on port 9050

### IPv6 Protection
- IPv6 completely disabled to prevent leaks
- Configuration stored in `/etc/sysctl.d/98-cerberus.conf`

### Process Termination
Cerberus automatically terminates potentially dangerous applications:
- Web browsers (Chrome, Firefox, Chromium)
- Communication apps (Skype, Telegram, Discord, Signal)
- File sharing (Transmission, Deluge)
- Other applications that might leak information

## System Requirements

- Arch Linux or Arch-based distribution
- Root privileges
- TOR package
- iptables
- secure-delete (for RAM cleaning)

## Troubleshooting

### Common Issues

1. **TOR not starting**
   ```bash
   sudo systemctl start tor
   sudo systemctl enable tor
   ```

2. **DNS resolution issues**
   ```bash
   sudo cerberus stop
   sudo cerberus start
   ```

3. **IP not changing**
   ```bash
   sudo cerberus change
   sudo cerberus myip
   ```

### Checking Status
```bash
# Check if TOR is running
sudo systemctl status tor

# Check iptables rules
sudo iptables -t nat -L

# Check current IP
sudo cerberus myip
```

## Important Security Notes

⚠️ **Always verify your IP address after starting Cerberus**

⚠️ **Be aware that some applications may not work properly through TOR**

⚠️ **This tool is for legitimate privacy and security purposes only**

⚠️ **Use responsibly and in accordance with local laws**

## Differences from Original AnonSurf

- **Arch Linux optimization**: Adapted for Arch-based systems
- **Systemd integration**: Proper systemd service management
- **Cleaner codebase**: Removed unnecessary UI elements
- **Updated dependencies**: Modern package requirements
- **Enhanced security**: Improved IPv6 handling and DNS protection

## License

GNU General Public License v3.0

## Contributing

Contributions are welcome! Please submit pull requests or open issues on the GitHub repository.

## Disclaimer

This tool is provided for educational and legitimate privacy purposes. Users are responsible for complying with all applicable laws and regulations in their jurisdiction. The authors are not responsible for any misuse of this software.

---

**Cerberus v1.0.0AlfaStable** - Engineered by **0xb0rn3 | 0xbv1**
