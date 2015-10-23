do_install_append_class-target() {
        if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
                mkdir -p ${D}/${base_libdir}/
                mv -f ${D}${libdir}/libdbus-1.so.3* ${D}${base_libdir}/
                rel_lib_prefix=${@os.path.relpath(d.getVar('base_libdir', True), d.getVar('libdir', True))}
                ln -sf ${rel_lib_prefix}/libdbus-1.so.3.8.13 ${D}${libdir}/libdbus-1.so
        fi
}

FILES_${PN}-lib += "${base_libdir}/lib*.so.*"
