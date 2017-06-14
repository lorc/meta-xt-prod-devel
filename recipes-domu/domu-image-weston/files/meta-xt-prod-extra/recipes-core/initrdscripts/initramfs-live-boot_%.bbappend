FILESEXTRAPATHS_prepend := "${THISDIR}/files:${THISDIR}/files/src:"
FILESEXTRAPATHS_prepend := "${THISDIR}/files/conf:${THISDIR}/files/scripts:"

inherit pkgconfig

SRC_URI_append = " \
    file://init \
    file://Makefile \
    file://wait-for-root.c \
    file://conf \
    file://scripts \
"

DEPENDS_append = " udev"
RDEPENDS_${PN}_append = " libklibc dhcp-client"

EXTRA_OEMAKE = "\
    'CC=${CC}' \
    'CFLAGS=${CFLAGS}' \
    'LDFLAGS=${LDFLAGS}' \
    wait-for-root \
"

do_compile_append() {
    oe_runmake ${EXTRA_OE_MAKE_ARGS}
}

do_install_append() {
    install -m 0755 ${WORKDIR}/init ${D}/init
    install -d ${D}${base_sbindir}
    install -m 0755 ${WORKDIR}/wait-for-root ${D}${base_sbindir}/wait-for-root
    install -d ${D}/conf
    cp -rf ${WORKDIR}/conf/* ${D}/conf
    install -d ${D}/scripts
    cp -rf ${WORKDIR}/scripts/* ${D}/scripts/
}

FILES_${PN}_append = " \
  ${base_sbindir}/wait-for-root \
  /conf/* \
  /scripts/* \
"

