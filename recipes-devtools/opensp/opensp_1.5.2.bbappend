# add this to PR
PRINC = "1"

#-fvisibility-inlines-hidden is used by default
#This will lead to compile errors when --enable-build=debug isused, so let's filter it out.
CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden','${CXXFLAGS}', d)}"
