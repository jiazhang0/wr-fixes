# LOCAL REV: WR specific fixes
#
# Trick to pass optimization options '-fno-omit-frame-pointer \
# -fvisibility=default' to profiling build.

PRINC = "1"

# Makefile uses CXFLAGS when constructing CFLAGs.  We are replacing
# the hard-coded value -ggdb.
#
EXTRA_OEMAKE += ' CXFLAGS="${CFLAGS}"'

