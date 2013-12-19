# LOCAL REV: WR specific fixes
# 
# mountprog and nfsprog options were removed from version 1.1.1 since
# the kernel no longer supports them, but our kernel does support them
# and we need to use them, so add them back.

FILESEXTRAPATHS_prepend := "${THISDIR}/files:${THISDIR}/${PN}:"

PRINC = "1"

# do NOT pass target cflags to host compilations
SRC_URI += "file://do-not-pass-CFLAGS-to-native.patch \
            file://nfs-utils-support-mountprog-and-nfsprog-options.patch \
"
