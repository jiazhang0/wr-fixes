
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "${@bb.utils.contains('NATIVELSBSTRING', 'Ubuntu-12.04', 'file://libtool-workaround-for-ubuntu-1204.patch', '', d)}"
