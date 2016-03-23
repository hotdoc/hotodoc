## General

ACLOCAL_AMFLAGS = -I m4

PACKAGE = libhotodoc

EXTRA_DIST = \
	autogen.sh\
	TODO\
	$(INTLTOOL_FILES)\
	m4/introspection.m4\
	$(NULL)

DISTCHECK_CONFIGURE_FLAGS = --enable-documentation --enable-introspection

includesdir = $(includedir)/hotodoc
includes_HEADERS = $(NULL)

## pkg-config

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libhotodoc.pc

## libhotodoc

includes_HEADERS += hotodoc/hotodoc.h

lib_LTLIBRARIES = libhotodoc.la

libhotodoc_la_SOURCES = \
			hotodoc/hotodoc.c \
			$(NULL)

libhotodoc_la_LIBADD = \
		       $(GLIB_LIBS) \
		       $(AM_LIBADD) \
		       $(NULL)

libhotodoc_la_LDFLAGS = \
  			-no-undefined \
			$(AM_LDFLAGS) \
			$(NULL)

libhotodoc_la_CFLAGS = \
		       $(GLIB_CFLAGS) \
		       $(AM_CFLAGS) \
		       $(NULL)

### libhotodoc introspection
