all:

install:
	mkdir -p $(DESTDIR)/usr/share/cockpit/zfs
	cp -r zfs/* $(DESTDIR)/usr/share/cockpit/zfs

uninstall:
	rm -rf $(DESTDIR)/usr/share/cockpit/zfs
	rm -rf $(DESTDIR)/etc/cockpit/zfs
