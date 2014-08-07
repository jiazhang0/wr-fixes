#
# Copyright (C) 2012 Wind River Systems, Inc.
#
PR = "r500"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

#In sysdeps/gcc/x86.h,some asm codes conflict with -fno-omit-frame-pointer gcc option.
#This will cause build failure when target arch is x86.
#There are two methods to fix this.
#Method 1:disable the x86 optimized assembly code in sysdeps/gcc/x86.h with a patch.
#Method 2:replace -fno-omit-frame-pointer with -fomit-frame-pointer
#if it's a debug or profiling build (using --enable-build=debug or profiling), use Method 1
#if it's not , use Method 2
#we distinguish the two situations by searching the word "FULL_OPTIMIZATION" in variable SELECTED_OPTIMIZATION.
#because --enable-build=debug or profiling will assign other value to variable SELECTED_OPTIMIZATION.
OVERRIDES .= "${@[':debuglibatomatic', ':nodebuglibatomatic'][d.getVar('SELECTED_OPTIMIZATION', False).find('FULL_OPTIMIZATION') != -1]}"

SRC_URI_append_debuglibatomatic = " file://Disable-the-x86-optimized-assembly-code.patch "
TARGET_CFLAGS_x86 := "${@['${TARGET_CFLAGS}', oe_filter_out('-fno-omit-frame-pointer', '${TARGET_CFLAGS}', d)]['${OVERRIDES}'.find('nodebuglibatomatic') != -1]}"
TARGET_CFLAGS_x86 += "${@['', '-fomit-frame-pointer']['${OVERRIDES}'.find('nodebuglibatomatic') != -1]}"
