python () {
    grub_flavor = 'grub'

    #
    # Use an older version of grub if GPLv3 is blacklisted.
    # We need to specify grub's version here because we have to identify
    # the correct multilib flavor of grub in packagegroup-wr-boot's RDEPENDS.
    # Grub went to GPLv3 in version 1.96, but our legacy version is 0.97.
    #
    if not d.getVar('PREFERRED_VERSION_grub', False) and \
      base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', True, False, d):
	d.setVar('PREFERRED_VERSION_grub', '0.97')

    if d.getVar('TARGET_ARCH', True).startswith('x86_64'):
	#
	# Choose the correct multilib for grub.
	# x86_64 support was added in grub 1.91.
	# If grub is older than that, use lib32-grub instead.
	#
	if d.getVar('PREFERRED_VERSION_grub', False) and \
	  base_version_less_or_equal('PREFERRED_VERSION_grub', '1.90', \
	  True, False, d):
	    grub_flavor = 'lib32-grub'

    # Pass the appropriate grub flavor up to packagegroup-wr-boot.
    d.appendVar('WR_MACHINE_ESSENTIAL_EXTRA_RDEPENDS', ' ' + grub_flavor)
}
