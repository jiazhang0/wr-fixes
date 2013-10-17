PRINC = "7"

# Override initscript with correct PIDFILE pending upstream fix
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

RDEPENDS_dbus_class-native = ""

do_install_append_class-target() {
        if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
                mkdir -p ${D}/${base_libdir}/
                mv -f ${D}${libdir}/libdbus-1.so.3* ${D}${base_libdir}/
                rel_lib_prefix=${@os.path.relpath(d.getVar('base_libdir', True), d.getVar('libdir', True))}
                ln -sf ${rel_lib_prefix}/libdbus-1.so.3.7.3 ${D}${libdir}/libdbus-1.so
        fi
}

do_install_append_class-nativesdk () {
        # Remove empty testexec directory as we don't build tests
        rm -rf ${D}${libdir}/dbus-1.0/test
}

FILES_${PN}-lib += "${base_libdir}/lib*.so.*"
