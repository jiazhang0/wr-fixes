# WR-LINUX
# add install search path /usr/lib/ to FILES
# the ConsoleKit is installed in /usr/lib not /usr/lib64

PR = "r500"

FILES_${PN} += "${prefix}/lib/ConsoleKit"
do_install_append() {
        # Moving libck-connector to base_libdir
        if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
                mkdir -p ${D}/${base_libdir}/
                mv -f ${D}${libdir}/libck-connector.so.0* ${D}${base_libdir}/
                if [ -e ${D}${base_libdir}/security/pam_ck_connector.la ]; then
                    mv -f ${D}${base_libdir}/security/pam_ck_connector.la ${D}${libdir}/
                fi
                rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
                ln -sf ${rel_lib_prefix}${base_libdir}/libck-connector.so.0.0.0 ${D}${libdir}/libck-connector.so
        fi
}

