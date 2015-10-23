
# PIXBUFCACHE_SYSROOT_DEPS in the recipe does not seem to do anything, so...

lcl_SYSROOT_DEPS = ""
lcl_SYSROOT_DEPS_class-native = "gdk-pixbuf-native:do_populate_sysroot"

do_populate_sysroot_setscene[depends] = "${lcl_SYSROOT_DEPS}"

