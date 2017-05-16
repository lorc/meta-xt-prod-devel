#DEPENDS += "dom0-image-base"

do_fetch[depends] += "domu-image-minimal:do_build"
do_fetch[depends] += "dom0-image-base:do_build"
