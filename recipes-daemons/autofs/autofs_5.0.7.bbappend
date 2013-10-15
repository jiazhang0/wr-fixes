FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PRINC = "5"

EXTRA_OECONF += "--without-systemd --with-fifodir=${localstatedir}/run --with-flagdir=${localstatedir}/run"

EXCLUDE_FROM_WORLD = "1"

do_configure_prepend() {
	export piddir=${localstatedir}/run
}

do_install_append() {
	# work around ad43b78551d9e9f82f5e815c34e0ee63ac5153be
	# if ${D}/run doesn't exist, that line results in a failure for do_install
	true
}
