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

SRC_URI_append_class-target = " \
           file://add_root_cmd_options.patch \
           file://add_root_cmd_groupmems.patch \
           "

PRINC = "2"
