#
# LOCAL REV: WR specific fixes
# upstream does not support qemuarma9

FILESEXTRAPATHS_prepend := "${THISDIR}:"

# Avoid putting rpath's into binaries.  Probably
# only necessary for arma9 because cmake will usually
# figure out that the libraries it needs are in standard
# places.
#
SRC_URI += "file://really-avoid-rpaths.patch"

