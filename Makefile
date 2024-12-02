PREFIX ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man
SCRIPTSDIR ?= $(PREFIX)/share/dots/src

install:
	install -d $(PREFIX)/bin
	install -d $(SCRIPTSDIR)
	install -m755 bin/dots $(PREFIX)/bin/
	install -m755 src/*.zsh $(SCRIPTSDIR)/
	install -d $(MANPREFIX)/man1
	install -m644 man/dots.1 $(MANPREFIX)/man1/
	install -d $(PREFIX)/share/zsh/site-functions
	install -m644 completions/_dots $(PREFIX)/share/zsh/site-functions/

uninstall:
	rm -f $(PREFIX)/bin/dots
	rm -rf $(SCRIPTSDIR)
	rm -f $(MANPREFIX)/man1/dots.1
	rm -f $(PREFIX)/share/zsh/site-functions/_dots
