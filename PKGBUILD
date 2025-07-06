# Maintainer: 0xb0rn3 | 0xbv1
# Repository: https://github.com/0xb0rn3/cerberus

pkgname=cerberus
pkgver=1.0.0
pkgrel=1
pkgdesc="Transparent proxy through TOR for anonymous web browsing"
arch=('any')
url="https://github.com/0xb0rn3/cerberus"
license=('GPL3')
depends=('tor' 'iptables' 'secure-delete' 'curl')
optdepends=('i2pd: I2P network support'
            'bleachbit: Browser cache cleaning')
conflicts=('anonsurf' 'kali-anonsurf')
backup=('etc/tor/torrc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/0xb0rn3/cerberus/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install main scripts
    install -Dm755 cerberus "$pkgdir/usr/bin/cerberus"
    install -Dm755 cerberus-pandora "$pkgdir/usr/bin/cerberus-pandora"
    
    # Install configuration files
    install -Dm644 torrc.cerberus "$pkgdir/etc/tor/torrc.cerberus"
    install -Dm644 cerberus.pac "$pkgdir/etc/cerberus/cerberus.pac"
    
    # Install systemd service
    install -Dm644 cerberus-pandora.service "$pkgdir/usr/lib/systemd/system/cerberus-pandora.service"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo "Cerberus v1.0.0AlfaStable installed successfully!"
    echo "Engineered by 0xb0rn3 | 0xbv1"
    echo ""
    echo "To start using Cerberus:"
    echo "  sudo cerberus start    - Start anonymous tunneling"
    echo "  sudo cerberus stop     - Stop anonymous tunneling"
    echo "  sudo cerberus status   - Check status"
    echo "  sudo cerberus myip     - Show current IP"
    echo ""
    echo "Enable Pandora RAM cleaner service:"
    echo "  sudo systemctl enable cerberus-pandora.service"
    echo ""
    echo "WARNING: Always verify your IP after starting Cerberus!"
}

post_upgrade() {
    post_install
}

pre_remove() {
    # Stop services before removal
    systemctl stop cerberus-pandora.service 2>/dev/null || true
    systemctl disable cerberus-pandora.service 2>/dev/null || true
    
    # Stop Cerberus if running
    /usr/bin/cerberus stop 2>/dev/null || true
}

post_remove() {
    # Restore original torrc if backup exists
    if [ -f /etc/tor/torrc.backup ]; then
        mv /etc/tor/torrc.backup /etc/tor/torrc
    fi
    
    # Remove sysctl configuration
    rm -f /etc/sysctl.d/98-cerberus.conf
    
    echo "Cerberus removed. Original configurations restored."
}
