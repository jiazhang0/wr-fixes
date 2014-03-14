DEPENDS += "bison"

INC_PR = "r2"

EXTRA_OECONF += "--enable-shared --with-flex"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "\
      file://ipsec-tools-libdir.patch \
      file://0001-racoon-pfkey-avoid-potential-null-pointer-dereferenc.patch \
      file://racoon-check-invalid-pointers.patch \
      file://racoon-check-invalid-ivm.patch \
"

PACKAGECONFIG ??= " \
	${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
	"

# Neither PAM nor selinux support works properly
#	${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '',d)}
#	${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '',d)}

PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,"
PACKAGECONFIG[ipv6] = "--enable-ipv6=yes,--disable-ipv6,,"
PACKAGECONFIG[selinux] = "--enable-security-context,--disable-security-context,libselinux,"

# Sometimes it attempts to use y.tab.c before it is actually
# generated. Note that the failure case is very rare, but it does
# happen.
PARALLEL_MAKE = ""
