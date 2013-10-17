#
# Copyright (C) 2012 Wind River Systems, Inc.
#
# LOCAL REV: add WR specific scripts
#
do_install_append () {
	ln -sf multi-user.target ${D}/lib/systemd/system/default.target
}
