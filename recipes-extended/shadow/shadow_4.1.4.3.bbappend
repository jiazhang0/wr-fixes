#
# Copyright (C) 2012 Wind River Systems, Inc.
#
# LOCAL REV: WR specific fixes
#
# These patches are used for debugging and fixing build failures related
# to heavily loaded build machines.

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "\
  file://shadow-native-block-groupadd-and-useradd.patch \
  file://add-additional-messages-to-indicate-why-locking-fail.patch \
"

PRINC = "2"
