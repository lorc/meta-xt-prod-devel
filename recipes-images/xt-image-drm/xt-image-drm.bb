#DEPENDS += "dom0-image-base"

do_build[depends] += "domu-image-minimal:do_build"
do_build[depends] += "dom0-image-base:do_build"
