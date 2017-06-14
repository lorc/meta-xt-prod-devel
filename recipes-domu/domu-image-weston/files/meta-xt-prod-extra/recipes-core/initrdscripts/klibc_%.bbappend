# we will use statically built binary, the klibc library is not needed

do_install() {
    install -d ${D}${base_bindir}
    install -m 0755 usr/kinit/nfsmount/static/nfsmount ${D}${base_bindir}/nfsmount
}

FILES_libklibc = " ${base_bindir}/nfsmount"

