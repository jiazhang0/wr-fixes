# LOCAL REV: support for build host with old version kernel
#

PRINC = "1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://e4defrag-old-kernel-headers.patch"
