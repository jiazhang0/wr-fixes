#
# Copyright (C) 2012 Wind River Systems, Inc.
#
# add this to PR
#
PRINC = "2"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://fix-acl-test-cases.patch"
