#
# Copyright (C) 2012 Wind River Systems, Inc.
#
# LOCAL REV: UNIONFS was disable in oe-core
#

PRINC = "1"

do_install_append () {
	if [ "x${ENABLE_LIVE_UNIONFS}" == "x1" ]; then
		sed -i 's/UNIONFS="no"/UNIONFS="yes"/g' ${D}/init
	fi
}
