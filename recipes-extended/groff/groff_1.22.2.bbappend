# LOCAL REV: WR specific fixes
#
# Get groff depends on sed roughly. Both busybox and sed could provide
# command /bin/sed, but we can't ensure that busybox always provides
# /bin/sed. This fix maybe involve some more packages to build for an
# image.

PR .= ".0"

RDEPENDS_${PN} += "sed"
