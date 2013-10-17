#
# Copyright (C) 2012 Wind River Systems, Inc.
#
# temp bbappend to be removed after fix
# is incorporated upstream
#

#During installation, tcl will use its shared lib which is still in the build directory .
#Most of the time this is OK, but when tcl was built by a cross-compiler, this make no sense.
#Especially when the arch of the cross-compiler is similar to the host,this will cause error.
#Because the target lib will be loaded on the host but the version will not match.
#so built directory shouldn't be added into the LD_LIBRARY_PATH when tcl is built for target device.
#
do_install_prepend(){

#       when built for target device
	if [ "${PN}" = "${BPN}" ]; then
		sed  -i -e "/LD_LIBRARY_PATH=.*pwd.*export LD_LIBRARY_PATH;/d" \
                	-e "/TCL_LIBRARY=.*export TCL_LIBRARY;/d" ${S}/Makefile
	fi
}

sstate_unpack_package_append() {
        if [ -f ${SSTATE_INSTDIR}usr/bin/crossscripts/tclConfig.sh ];then
                sed -i "s,^TCL_SRC_DIR,TCL_SRC_DIR='${STAGING_INCDIR}/tcl8.5.11'\n#TCL_SRC_DIR,g" ${SSTATE_INSTDIR}usr/bin/crossscripts/tclConfig.sh 
        fi
}
