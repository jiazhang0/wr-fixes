SUMMARY = "Generic client/server library for SASL authentication."
DESCRIPTION = "The Cyrus implementation of SASL. \
SASL is the Simple Authentication and Security Layer, a method for \
adding authentication support to connection-based protocols."
HOMEPAGE = "http://asg.web.cmu.edu/sasl/sasl-library.html"

PRINC = "1"

inherit useradd

USERADD_PACKAGES = "${PN}-bin"
GROUPADD_PARAM_${PN}-bin = "--system mail"
USERADD_PARAM_${PN}-bin = "--system --home=/var/mail -g mail cyrus"

CFLAGS += "-fPIC"

PACKAGECONFIG = "ntlm \
	${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
	${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
	"

PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
PACKAGECONFIG[opie] = "--with-opie,--without-opie,opie,"
PACKAGECONFIG[des] = "--with-des,--without-des,,"
PACKAGECONFIG[ldap] = "--with-ldap=${STAGING_LIBDIR} --enable-ldapdb,--without-ldap --disable-ldapdb,openldap,"
PACKAGECONFIG[ntlm] = "--with-ntlm,--without-ntlm,,"

EXTRA_OECONF = "--with-dblib=berkeley \
    --with-bdb=db-5.3 \
    --with-bdb-libdir=${STAGING_LIBDIR} \
    --with-bdb-incdir=${STAGING_INCDIR} \
    --enable-login \
    --with-plugindir="${libdir}/sasl2/" \
    andrew_cv_runpath_switch=none \
"

do_configure_prepend () {
    rm -f acinclude.m4 config/libtool.m4
    local sed_files="sasldb/db_berkeley.c utils/dbconverter-2.c"
    for sed_file in $sed_files; do
        sed -i 's#DB_VERSION_MAJOR == 4.*#(&) || DB_VERSION_MAJOR == 5#' $sed_file
    done 
}

# Base package postinst is broken..
pkg_postinst_${PN}-bin () {
    : 
}
