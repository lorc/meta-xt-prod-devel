FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# extra files to be installed
SRC_URI += "file://dummy.cfg;subdir=repo/cfg"

# we need both expand URIs (so THISDIR is set correctly) and append those,
# so first expand and then append
APPEND_XT_QUIRCK_FETCH_SRC_URI := "file://${THISDIR}/files/meta-xt-test;subdir=repo"
XT_QUIRCK_FETCH_SRC_URI += "${APPEND_XT_QUIRCK_FETCH_SRC_URI}"

# this layers will be added to bblayers.conf
XT_QUIRCK_ADD_LAYER += "meta-xt-test"

do_build[depends] += "domu-image-minimal:do_${BB_DEFAULT_TASK}"
