# LOCAL REV: WR specific fixes
#
# Replace harmless errors with warnings to meet WR Feature Testing cases.

PR = "r500"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://hdparm-fix-HDIO_GET_IDENTITY.patch"
