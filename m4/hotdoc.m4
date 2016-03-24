# hotdoc.m4 - Macros to locate and utilise hotdoc.            -*- Autoconf -*-
# serial 1 (hotdoc 0.7.1)
#
# Copyright © 2016 Mathieu Duponchelle <mathieu.duponchelle@opencreed.com>.
# Copyright © 2016 Collabora
#
# This library is free software; you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation; either version 2.1 of the License, or (at your option)
# any later version.
#
# This library is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
# details.

m4_define([_HOTDOC_CHECK_INTERNAL],
[
	m4_if([$2], [require],
	      [enable_documentation=yes],
	      [AC_ARG_ENABLE(documentation,
                  	     AS_HELP_STRING([--enable-documentation[=@<:@no/auto/yes@:>@]],
                             		    [Enable documentation for this build]),, 
                             		    [enable_documentation=auto])
	      ])

	AS_IF([test "x$enable_documentation" = "xno"],
	      [HOTDOC="no"],
	      [AC_PATH_PROG([HOTDOC],
	      		    [hotdoc],
			    [no])])

	AS_IF([test "x$HOTDOC" != "xno"],
	      [AS_VERSION_COMPARE([`$HOTDOC --version`],[$1],
	      	     [HOTDOC="no"])])

	AS_IF([test "x$HOTDOC" != "xno"],
	      [m4_foreach([ext], [$3],
		          [AX_PYTHON_MODULE([[hotdoc_]ext[_extension]],[],[python2])
			  AS_IF([test "x$[HAVE_PYMOD_HOTDOC_]AS_TR_CPP([ext])[_EXTENSION]" = "xno"],
			  	[HOTDOC="no"])
			  ]
  	      )])

	AS_IF([test "x$HOTDOC" = "xno" -a "x$enable_documentation" = "xyes"],
	      [AC_MSG_ERROR([check your hotdoc install, or disable documentation \
with --disable-documentation.])])

	AS_IF([test "x$HOTDOC" = "xno"],
	      [enable_documentation=no],
	      [enable_documentation=yes])

	AM_CONDITIONAL(ENABLE_DOCUMENTATION, test "x$enable_documentation" = "xyes")
])

# HOTDOC_CHECK(VERSION, [EXTENSIONS])
#
# Check to see if hotdoc is available, is at least at the specified version,
# and all the specified extensions are available.
#
# Also add a --enable-documentation argument to configure.
#
# EXTENSIONS is a comma-separated list of hotdoc extensions, for example:
#
# [c, gi, dbus]
#
# If all goes well:
# HOTDOC is set to the absolute path to hotdoc
# enable_documentation is set to yes, mostly for pretty-printing purposes
# the automake conditional ENABLE_DOCUMENTATION will return true when tested.
#
# Otherwise:
# HOTDOC is set to no
# enable_documentation is set to no
# the automake conditional ENABLE_DOCUMENTATION will return false when tested.
# If yes was passed to enable-documentation, errors out with a message

AC_DEFUN([HOTDOC_CHECK],
[
  _HOTDOC_CHECK_INTERNAL([$1], [], [$2])
])

# HOTDOC_REQUIRE(VERSION, [EXTENSIONS])
#
# Same as HOTDOC_CHECK with enable-documentation set to yes, and the
# --enable-documentation argument isn't added.
#
# Use this if you want to make building of the documentation mandatory
AC_DEFUN([HOTDOC_REQUIRE],
[
  _HOTDOC_CHECK_INTERNAL([$1], [require], [$2])
])
