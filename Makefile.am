ACLOCAL_AMFLAGS = -I m4

PACKAGE = libhotodoc

DIST_SUBDIRS = $(NULL)

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libhotodoc.pc


EXTRA_DIST = \
	autogen.sh\
	TODO\
	$(INTLTOOL_FILES)\
	m4/introspection.m4\
	$(NULL)

DISTCHECK_CONFIGURE_FLAGS = --enable-documentation --enable-introspection
