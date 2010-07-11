AC_DEFUN([BANSHEE_CHECK_GIO_SHARP],
[
	GNOMESHARP_REQUIRED=2.8
	
	AC_ARG_ENABLE(gio, AC_HELP_STRING([--disable-gio], [Disable GIO for IO operations]), ,enable_gio="yes")
	
	if test "x$enable_gio" = "xyes"; then
	   	PKG_CHECK_MODULES(GTKSHARP_BEANS,
			gtk-sharp-beans-2.0 >= $GNOMESHARP_REQUIRED,
			enable_gio=yes, enable_gio=no)

		PKG_CHECK_MODULES(GIOSHARP,
			gio-sharp-2.0 >= $GNOMESHARP_REQUIRED,
			enable_gio="$enable_gio", enable_gio=no)

		PKG_CHECK_MODULES(GLIB_2_22,
			glib-2.0 >= 2.22,
			enable_gio="$enable_gio", enable_gio=no)

		AM_CONDITIONAL(ENABLE_GIO, test "x$enable_gio" = "xyes")
	else
		AM_CONDITIONAL(ENABLE_GIO, false)
	fi
])

