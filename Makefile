# Cerberus v1.0.0AlfaStable Makefile
# Engineered by 0xb0rn3 | 0xbv1
# Repository: https://github.com/0xb0rn3/cerberus

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
SYSCONFDIR = /etc
SYSTEMDDIR = $(PREFIX)/lib/systemd/system
DOCDIR = $(PREFIX)/share/doc/cerberus
LICENSEDIR = $(PREFIX)/share/licenses/cerberus

.PHONY: all install uninstall clean

all:
	@echo "Cerberus v1.0.0AlfaStable"
	@echo "Engineered by 0xb0rn3 | 0xbv1"
	@echo ""
	@echo "Available targets:"
	@echo "  install   - Install Cerberus"
	@echo "  uninstall - Remove Cerberus"
	@echo "  clean     - Clean build files"

install:
	@echo "Installing Cerberus v1.0.0AlfaStable..."
	
	# Create directories
	install -d $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(SYSCONFDIR)/cerberus
	install -d $(DESTDIR)$(SYSTEMDDIR)
	install -d $(DESTDIR)$(DOCDIR)
	install -d $(DESTDIR)$(LICENSEDIR)
	
	# Install executables
	install -m 755 cerberus $(DESTDIR)$(BINDIR)/cerberus
	install -m 755 cerberus-pandora $(DESTDIR)$(BINDIR)/cerberus-pandora
	
	# Install configuration files
	install -m 644 torrc.cerberus $(DESTDIR)$(SYSCONFDIR)/tor/torrc.cerberus
	install -m 644 cerberus.pac $(DESTDIR)$(SYSCONFDIR)/cerberus/cerberus.pac
	
	# Install systemd service
	install -m 644 cerberus-pandora.service $(DESTDIR)$(SYSTEMDDIR)/cerberus-pandora.service
	
	# Install documentation
	install -m 644 README.md $(DESTDIR)$(DOCDIR)/README.md
	install -m 644 LICENSE $(DESTDIR)$(LICENSEDIR)/LICENSE
	
	@echo "Installation completed!"
	@echo "Run 'sudo cerberus start' to begin anonymous browsing"

uninstall:
	@echo "Removing Cerberus..."
	
	# Stop and disable services
	-systemctl stop cerberus-pandora.service 2>/dev/null
	-systemctl disable cerberus-pandora.service 2>/dev/null
	
	# Stop Cerberus if running
	-$(DESTDIR)$(BINDIR)/cerberus stop 2>/dev/null
	
	# Remove files
	rm -f $(DESTDIR)$(BINDIR)/cerberus
	rm -f $(DESTDIR)$(BINDIR)/cerberus-pandora
	rm -f $(DESTDIR)$(SYSCONFDIR)/tor/torrc.cerberus
	rm -f $(DESTDIR)$(SYSCONFDIR)/cerberus/cerberus.pac
	rm -f $(DESTDIR)$(SYSTEMDDIR)/cerberus-pandora.service
	rm -rf $(DESTDIR)$(DOCDIR)
	rm -rf $(DESTDIR)$(LICENSEDIR)
	
	# Remove configuration directory if empty
	-rmdir $(DESTDIR)$(SYSCONFDIR)/cerberus 2>/dev/null
	
	# Clean up system configuration
	rm -f /etc/sysctl.d/98-cerberus.conf
	
	@echo "Cerberus removed successfully"

clean:
	@echo "Nothing to clean"
