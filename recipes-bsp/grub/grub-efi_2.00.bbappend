#
# Modify the build for class-native so that we can build
# with an older gcc.  All we care about for native is grub-mkimage.
#
PR .= ".fix0"

FILESEXTRAPATHS_prepend := "${THISDIR}/grub-efi-native:"

SRC_URI_append_class-native = " file://warnings.patch file://warnings2.patch file://no_mcmodel.patch"

#
# Over-ride default compile.  The recipe already only installs grub-mkimage.
# We cannot build everything with older compilers, but we can build what
# we need for class-native.  Yes, just "make grub-mkimage" should work, but
# it does not.
#
do_compile_class-native () {
    cd grub-core/gnulib
    make
    cd ../..
    make grub_script.tab.h
    make grub_script.yy.h
    make grub-mkimage
}

do_install_class-target() {
	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
	install -d ${D}/boot/efi/EFI/BOOT/${GRUB_TARGET}-efi/
	install -m 644 ${GRUB_IMAGE} ${D}/boot/efi/EFI/BOOT

	# Install the modules to grub-efi's search path
	make -C grub-core install DESTDIR=${D}/boot/efi/EFI/BOOT/ pkglibdir=""

	# Generate startup.nsh, we have the boot info in GRUB_IMAGE, the
	# startup.nsh is only used for running GRUB_IMAGE.
cat > ${D}/boot/efi/startup.nsh <<_EOF
echo -off

echo "Running ${GRUB_IMAGE}..."
${GRUB_IMAGE}
_EOF
}

FILES_${PN}-dbg += "/boot/efi/EFI/BOOT/${GRUB_TARGET}-efi/.debug"
FILES_${PN} += "/boot/efi/"
