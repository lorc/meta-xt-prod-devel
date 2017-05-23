FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# extra files to be installed
SRC_URI += "file://dummy.cfg;subdir=repo/cfg"

# we need both expand URIs (so THISDIR is set correctly) and append those,
# so first expand and then append
APPEND_XT_QUIRCK_UNPACK_SRC_URI := "file://${THISDIR}/files/meta-xt-test;subdir=repo"
XT_QUIRCK_UNPACK_SRC_URI += "${APPEND_XT_QUIRCK_UNPACK_SRC_URI}"

# this layers will be added to bblayers.conf
XT_QUIRCK_BB_ADD_LAYER += "meta-xt-test"

do_configure[depends] += "domu-image-minimal:do_${BB_DEFAULT_TASK}"

###############################################################################
# configure kernel deployment from DomU to Dom0
###############################################################################
# this sets where to put kernel's copier bbappend wrt to the
# inner build repo root directory
XT_QUIRCK_KERNEL_IMPORT_RECIPE_DIR = "meta-test/recipes-kernel/linux"
# this is the list of folders to import kernels from
# full path will be ${XT_SHARED_ROOTFS_DIR}/boot/${XT_QUIRCK_KERNEL_DEPLOY_IMAGE_DIR}
XT_QUIRCK_KERNEL_IMPORT_DIR_LIST = "domu"
