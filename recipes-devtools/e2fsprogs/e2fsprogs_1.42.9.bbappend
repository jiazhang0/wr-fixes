# LOCAL REV: support for build host with old version kernel
#

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://e4defrag-old-kernel-headers.patch"
