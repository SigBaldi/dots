# Define PREFIX and HOMEBREW_CELLAR
PREFIX ?= $(shell brew --prefix)
HOMEBREW_CELLAR := $(shell brew --cellar)/dots

MANPREFIX ?= $(PREFIX)/share/man
SCRIPTSDIR ?= $(HOMEBREW_CELLAR)/src

install:
	# Create necessary directories
	install -d $(PREFIX)/bin
	install -d $(SCRIPTSDIR)
	install -d $(MANPREFIX)/man1
	install -d $(PREFIX)/share/zsh/site-functions

	# Replace placeholder in 'dots' script and install
	sed 's|@SCRIPTSDIR@|$(SCRIPTSDIR)|g' bin/dots > $(PREFIX)/bin/dots
	chmod 755 $(PREFIX)/bin/dots

	# Install the scripts from src/
	install -m755 src/* $(SCRIPTSDIR)/

	# Install the man page
	install -m644 man/dots.1 $(MANPREFIX)/man1/

	# Install zsh completions
	install -m644 completions/_dots $(PREFIX)/share/zsh/site-functions/

uninstall:
	rm -f $(PREFIX)/bin/dots
	rm -rf $(SCRIPTSDIR)
	rm -f $(MANPREFIX)/man1/dots.1
	rm -f $(PREFIX)/share/zsh/site-functions/_dots
