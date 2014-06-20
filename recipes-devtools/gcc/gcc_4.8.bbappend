
do_install_append() {
	# empty directory causes QA error
	rmdir --ignore-fail-on-non-empty ${D}${libdir}/`$CC -print-multi-os-directory`
}
