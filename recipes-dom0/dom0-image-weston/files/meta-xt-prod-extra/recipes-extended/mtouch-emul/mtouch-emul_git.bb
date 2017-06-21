SUMMARY = "Multi-touch emulator"
SECTION = "extras"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a23a74b3f4caf9616230789d94217acb"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

SRC_URI = "git://github.com/andr2000/mtouch-emul.git;protocol=https"

do_install () {
    install -d ${D}${sbindir}
    install -m 0755 ${S}/mtouch-emul ${D}${sbindir}/
    install -d ${D}${base_prefix}/scripts
    install -m 0755 ${S}/run_adb.sh ${D}${base_prefix}/scripts/
}

FILES_${PN} = " \
    ${sbindir}/mtouch-emul \
    ${base_prefix}/scripts/run_adb.sh \
"

