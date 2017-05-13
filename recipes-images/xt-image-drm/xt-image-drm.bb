#DEPENDS += "dom0-image-base"

do_fetch[depends] += "dom0-image-base:do_build"