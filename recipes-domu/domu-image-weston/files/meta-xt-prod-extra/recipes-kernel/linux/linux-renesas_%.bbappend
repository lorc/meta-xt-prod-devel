FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

RENESAS_BSP_URL = "git://github.com/xen-troops/linux.git"

BRANCH = "vgpu-dev"
SRCREV = "${AUTOREV}"
SRC_URI_append = " \
    file://defconfig \
    file://0001-Revert-xen-input-add-multi-touch-support.patch \
    file://0002-xen-input-add-multi-touch-support.patch \
    file://0003-Input-xen-kbdfront-MT-support-fixups.patch \
"
require linux-kernel.inc

