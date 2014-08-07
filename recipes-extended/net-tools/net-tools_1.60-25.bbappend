# LOCAL REV: WR specific fixes
#
# 1) specify QUILT_SERIES for quilt - fix critical issue to quilt on
#    CentOS 5.8, although the issue can't be reproduced again, but we
#    prefer to keep this patch for some time.
#
# 2) fix netstat return value to meet WR Feature Testing cases.

# add this to PR
#
PR = "r500"

# so we can find our patch
#
FILESPATH_append := ":${@base_set_filespath(['${THISDIR}'], d)}"
SRC_URI += "file://change-return-value-of-netstat-s-command.patch"


# In certain situations, quilt fails in nettools_do_patch saying that
# it cannot find the series file (in quilt push -a), we explicitly
# specify QUILT_SERIESto make sure that it can find it.
#
# the following are copied directly from the original bitbake recipe with
# the QUILT_SERIES added

# Unlike other Debian packages, net-tools *.diff.gz contains another series of
# patches maintained by quilt. So manually apply them before applying other local
# patches. Also remove all temp files before leaving, because do_patch() will pop 
# up all previously applied patches in the start
nettools_do_patch_v2() {
	cd ${S}
	quilt pop -a || true
	if [ -d ${S}/.pc-nettools ]; then
		mv ${S}/.pc-nettools ${S}/.pc
		QUILT_PATCHES=${S}/debian/patches quilt pop -a
		rm -rf ${S}/.pc ${S}/debian
	fi
	patch -p1 < ${WORKDIR}/${BPN}_${PV}.diff	

	# Use quilt to process user's patches
	for patch in ${WORKDIR}/*.patch; do
		cp -f $patch ${S}/debian/patches
		echo "${patch##*/}" >> ${S}/debian/patches/series
	done
	QUILT_PATCHES=${S}/debian/patches QUILT_SERIES=${S}/debian/patches/series quilt push -a
	mv ${S}/.pc ${S}/.pc-nettools
}

# We invoke base do_patch at end, to incorporate any local patch
python do_patch() {
    bb.build.exec_func('nettools_do_patch_v2', d)
}
