m4_define([libhotodoc_major], [0])
m4_define([libhotodoc_minor], [1])
m4_define([libhotodoc_micro], [0])
m4_define([libhotodoc_nano], [1])

m4_define([libhotodoc_version], [libhotodoc_major.libhotodoc_minor.libhotodoc_micro])

m4_define([libhotodoc_lt_version], [0:1:0])

AC_PREREQ(2.62)
AC_INIT([libhotodoc], libhotodoc_version)
AC_CONFIG_AUX_DIR(config)
AC_CONFIG_MACRO_DIR([m4])
AM_MAINTAINER_MODE([enable])

AC_SUBST(LIBHOTODOC_VERSION,libhotodoc_version)

LIBHOTODOC_MAJOR=libhotodoc_major
AC_SUBST(LIBHOTODOC_MAJOR)

AM_INIT_AUTOMAKE([-Wno-portability tar-ustar])
AM_SILENT_RULES([yes])

AC_PROG_CC
AC_HEADER_STDC

LT_INIT

LIBHOTODOC_PACKAGES_PUBLIC_GLIB="glib-2.0, gio-2.0, gobject-2.0"
LIBHOTODOC_PACKAGES_PUBLIC="$LIBHOTODOC_PACKAGES_PUBLIC_GLIB"

AC_SUBST([LIBHOTODOC_PACKAGES_PUBLIC])

PKG_CHECK_MODULES([GLIB], [$LIBHOTODOC_PACKAGES_PUBLIC_GLIB])

dnl check for gobject-introspection
GOBJECT_INTROSPECTION_CHECK([1.31.1])

AX_COMPILER_FLAGS([], [], [m4_if(libhotodoc_nano, 0, [yes], [no])])

AC_CONFIG_FILES([
    Makefile
    libhotodoc.pc
])

AC_OUTPUT

dnl Summary
echo ""
echo "libhotodoc "
echo "--------------"
echo "Introspection                  : ${found_introspection}"

