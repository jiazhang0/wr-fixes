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
