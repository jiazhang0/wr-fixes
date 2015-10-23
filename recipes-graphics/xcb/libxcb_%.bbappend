# temporary workaround for compiler bug
#

# -O2 and -fno-omit-frame-pointer cause host OOM when compiling xkb.c!
#
PROFILING_OPTIMIZATION_i586 += "-O3"
