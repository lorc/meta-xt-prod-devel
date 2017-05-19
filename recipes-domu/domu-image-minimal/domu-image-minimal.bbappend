FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

###############################################################################
# extra layers and files to be put after Yocto's do_unpack into inner builder
###############################################################################
# we need both expand URIs (so THISDIR is set correctly) and append those,
# so first expand and then append
# these will be populated into the inner build system on do_unpack_xt_extras
APPEND_XT_QUIRCK_UNPACK_SRC_URI := "file://${THISDIR}/files/meta-xt-extra;subdir=repo"
XT_QUIRCK_UNPACK_SRC_URI += "${APPEND_XT_QUIRCK_UNPACK_SRC_URI}"
# this layers will be added to bblayers.conf on do_configure
XT_QUIRCK_BB_ADD_LAYER += "meta-xt-extra"

###############################################################################
# configure kernel deployment from DomU to Dom0
###############################################################################
# this sets where to put kernel's copier bbappend wrt to the
# inner build repo root directory
XT_QUIRCK_KERNEL_DEPLOY_RECIPE_DIR = "meta-test/recipes-kernel/linux"
# this is the name of the folder to deploy kernel to
# full path will be ${XT_SHARED_ROOTFS_DIR}/boot/${XT_QUIRCK_KERNEL_DEPLOY_IMAGE_DIR}
XT_QUIRCK_KERNEL_DEPLOY_IMAGE_DIR = "domu"
