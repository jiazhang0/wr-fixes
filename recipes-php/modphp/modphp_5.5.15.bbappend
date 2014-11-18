# Modify the build of modphp to also generate the command line
# php.

# phar will try to run cli on the host!  configure finds libpthread, but
# forgets that we need to search it!
#
EXTRA_OECONF += "--enable-cli --disable-phar ac_cv_pthreads_lib=pthread"
EXTRA_OECONF += "--enable-dom"

# override choices in modphp5.inc
#
PACKAGECONFIG = "mysql libxml"

do_install_append () {
    oe_runmake install-cli INSTALL_ROOT=${D}
}

# We do this only so that the phoronix-test-suite recipe will find
# its RDEPENDS.  This package duplicates one in the php recipe.
#
PACKAGES += "php-cli"

FILES_php-cli += "${bindir}/php"

