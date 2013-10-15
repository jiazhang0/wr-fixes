#
# Copyright (C) 2012 Wind River Systems, Inc.
#
# LOCAL REV: WR added xinetd configuration files
#
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://rexec.xinetd.inetutils  \
    file://rlogin.xinetd.inetutils \
    file://rsh.xinetd.inetutils \
    file://telnet.xinetd.inetutils \
    file://tftpd.xinetd.inetutils \
"

do_install_append () {
    install -m 0755 -d ${D}/${sysconfdir}/xinetd.d
    cp ${WORKDIR}/rexec.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rexec
    cp ${WORKDIR}/rlogin.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rlogin
    cp ${WORKDIR}/rsh.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rsh
    cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
    cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
}

FILES_${PN}-rshd += "${sysconfdir}/xinetd.d/rsh ${sysconfdir}/xinetd.d/rlogin ${sysconfdir}/xinetd.d/rexec"
RDEPENDS_${PN}-rshd += "xinetd"

RDEPENDS_${PN}-ftpd += "xinetd"

FILES_${PN}-tftpd += "${sysconfdir}/xinetd.d/tftpd"
RDEPENDS_${PN}-tftpd += "xinetd"

FILES_${PN}-telnetd += "${sysconfdir}/xinetd.d/telnet"
RDEPENDS_${PN}-telnetd += "xinetd"

RDEPENDS_${PN} = "xinetd"
