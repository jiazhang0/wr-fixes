#
# Copyright (C) 2012 Wind River Systems, Inc.
#
# temp bbappend to be removed after fix
# is incorporated upstream
#

# add this to PR
#
PRINC = "1"

# so we can find our patch
#
FILESPATH_append := ":${@base_set_filespath(['${THISDIR}'], d)}"
SRC_URI += "file://glib2-python-ref.patch \
           "
