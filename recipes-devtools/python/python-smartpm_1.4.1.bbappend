# LOCAL REV: Upstream-status: pending
#
# Yocto doesn't test such multilib default image, so keep this pacth to check it
# could be accepted by oe-core or not.
#
# Copyright (C) 2013 Wind River Systems, Inc.
#
PR = "r500"

FILESPATH_append := ":${@base_set_filespath(['${THISDIR}'], d)}/${PN}"
SRC_URI += "file://smart-pick-a-same-arch-for-multilib-do_install.patch"
