# Fix up tclConfig.sh which has been pulled from sstate.
# Note that the files have been unpacked into a sub-directory, the
# name of which varies.  For native builds, it appears to be the host
# architecture.  For targets, it seems to be 'sysroot-destdir'.
#
sstate_unpack_package_append() {
    for lookin in `ls`; do
        echo "looking in $lookin"
        look4=$lookin/usr/bin/crossscripts
        if [ -f $look4/tclConfig.sh ];then
            sed -i "s,^TCL_SRC_DIR,TCL_SRC_DIR='${STAGING_INCDIR}/tcl8.6.0'\n#TCL_SRC_DIR,g" $look4/tclConfig.sh
        else
            echo "tclConfig.sh was not found!!"
        fi
    done
}
