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

-include $(INTROSPECTION_MAKEFILE)

INTROSPECTION_GIRS =
INTROSPECTION_SCANNER_ARGS = --add-include-path=$(srcdir)/hotodoc \
			     --warn-all
INTROSPECTION_COMPILER_ARGS = --includedir=$(srcdir)/hotodoc

if HAVE_INTROSPECTION

gir_sources = \
	      hotodoc/hotodoc.h \
	      hotodoc/hotodoc.c

libraries = \
	    libhotodoc.la


Hotodoc-@LIBHOTODOC_MAJOR@.gir: $(libraries)
Hotodoc_@LIBHOTODOC_MAJOR@_gir_INCLUDES = GLib-2.0 GObject-2.0
Hotodoc_@LIBHOTODOC_MAJOR@_gir_LIBS = $(libraries)
Hotodoc_@LIBHOTODOC_MAJOR@_gir_FILES = $(gir_sources)
Hotodoc_@LIBHOTODOC_MAJOR@_gir_SCANNERFLAGS = $(WARN_SCANNERFLAGS)
INTROSPECTION_GIRS += Hotodoc-@LIBHOTODOC_MAJOR@.gir

girdir = $(datadir)/gir-1.0
gir_DATA = $(INTROSPECTION_GIRS)

typelibdir = $(libdir)/girepository-1.0/
typelib_DATA = $(INTROSPECTION_GIRS:.gir=.typelib)

CLEANFILES = $(gir_DATA) $(typelib_DATA)

endif
