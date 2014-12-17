# Things we want to add to an sdk image
#

PR = "r500"

WRCMAKE ?= "nativesdk-cmake"
WRCMAKE_sdkmingw32 = ""

RDEPENDS_${PN} += " ${WRCMAKE}"

