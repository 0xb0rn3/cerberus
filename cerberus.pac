// Cerberus PAC (Proxy Auto-Configuration) File
// Engineered by 0xb0rn3 | 0xbv1
// Repository: https://github.com/0xb0rn3/cerberus

function FindProxyForURL(url, host) {
    // Route .onion domains through Tor SOCKS proxy
    if (shExpMatch(host, "*.onion")) {
        return "SOCKS 127.0.0.1:9050";
    }
    
    // Route .i2p domains through I2P HTTP proxy
    if (shExpMatch(host, "*.i2p")) {
        return "HTTP 127.0.0.1:4444";
    }
    
    // Direct connection for everything else
    return "DIRECT";
}
