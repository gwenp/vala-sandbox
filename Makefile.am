include $(top_srcdir)/Makefile.common

ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

SUBDIRS = \
	data \
	lib \
	man \
	po \
	vapi \
	src \
	$(NULL)
#	tests

if HAVE_VALADOC
SUBDIRS += docs
endif

DISTCHECK_CONFIGURE_FLAGS = \
	--disable-docs \
	$(NULL)

EXTRA_DIST = \
	COPYRIGHT \
	.version \
	build-aux/bzr-version-gen \
	$(NULL)

BUILT_SOURCES = \
	$(top_srcdir)/.version \
	$(NULL)

$(top_srcdir)/.version:
	echo $(VERSION) > $@-t && mv $@-t $@

dist-hook:
	echo $(VERSION) > $(distdir)/.tarball-version

distclean-local:
	if test "x$(srcdir)" = "x."; then :; else \
		rm -f ChangeLog; \
	fi

ChangeLog:
	@echo Creating $@
	@if test -d "$(srcdir)/.bzr"; then \
		(bzr log --gnu) | fmt --split-only > $@.tmp \
		&& mv -f $@.tmp $@ \
		|| ($(RM) $@.tmp; \
			echo Failed to generate ChangeLog, your ChangeLog may be outdated >&2; \
			(test -f $@ || echo bzr is required to generate this file >> $@)); \
	else \
		test -f $@ || \
		(echo A bzr checkout and bzr is required to generate ChangeLog >&2 && \
		echo A bzr checkout and bzr is required to generate this file >> $@); \
	fi

.PHONY: ChangeLog

