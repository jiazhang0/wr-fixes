#
# Copyright (C) 2014 Wind River Systems, Inc.
#

# workaround compile errors on qemuarm when enable-build=debug:
# {standard input}: Assembler messages:
# {standard input}:102: Error: invalid operands (.text and *UND* sections) for `-'
CFLAGS_arm += "-O2"
