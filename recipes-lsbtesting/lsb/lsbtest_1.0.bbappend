#
# Copyright (C) 2012-2013 Wind River Systems, Inc.
#
# Upstream-status: pending

PRINC = "2"

FILESEXTRAPATHS_prepend := "${THISDIR}/lsbtest:"

# For a ppc64 target. the default userspace is 32b.
# Therefore, only change the lsbarch and targetarch
# in the package_list when MLIB=lib64 is being used.
# Otherwise, by default, the ppc32 LSB packages
# will be downloaded by LSB_Test.sh

do_install_append() {
    if [ "${TARGET_ARCH}" == "powerpc64" ];then                                                
        if [ "${PN}" != "${BPN}" ];then
            sed -i -e 's/lsbarch/ppc64/g' -e 's/targetarch/ppc64/g' ${D}/opt/lsb-test/packages_list
            sed -i -e 's/targetarch/PPC64/g' ${D}/opt/lsb-test/session
        fi
    fi

}
