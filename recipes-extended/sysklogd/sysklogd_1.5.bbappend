#
# Copyright (C) 2012 Wind River Systems, Inc.
#
# LOCAL REV:
#
# Port debian logrotate.d entries to enable log rotation/expiration
# on WR images.
#
# Upstream-status: pending: parse_syslog_conf.patch

PRINC = "5"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://parse_syslog_conf.patch \
	file://syslog.logrotate"

RDEPENDS_${PN} += "logrotate"

do_install_append () {
	install -d ${D}${sysconfdir}/logrotate.d
	install -m 644 ${WORKDIR}/syslog.logrotate \
		${D}${sysconfdir}/logrotate.d/syslog
}
