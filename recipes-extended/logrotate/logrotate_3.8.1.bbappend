# LOCAL REV: WR specific fixes
#
# Trick to pass optimization options '-fno-omit-frame-pointer \
# -fvisibility=default' to profiling build.

PR .= ".1"

# package Makefile computes CFLAGS, referencing this
#
EXTRA_OEMAKE_append = ' RPM_OPT_FLAGS="${CFLAGS}"'
