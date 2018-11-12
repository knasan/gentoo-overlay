# Copyright 2008-2013 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="A filesystem backup utility based on rsync written in ruby"
HOMEPAGE="http://github.com/knasan/sysnapshot"
EGIT_REPO_URI="git://github.com/knasan/sysnapshot.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/ruby-2"

RDEPEND="net-misc/rsync"

src_unpack() {
	git-r3_src_unpack
}

src_install() {
	mkdir -p ${D}/usr/bin || die
	cp ${WORKDIR}/$P/bin/sysnapshot ${D}/usr/bin/sysnapshot || die
	mkdir -p ${D}/etc/sysnapshot || die
	cp ${WORKDIR}/$P/etc/sysnapshot/sysnapshot.exclude ${D}/etc/sysnapshot/sysnapshot.exclude || die
	mkdir -p ${D}/usr/lib/sysnapshot || die
	cp ${WORKDIR}/$P/lib/sysnapshot/*.rb ${D}/usr/lib/sysnapshot || die
}

pkg_postinst() {
	example=$(grep Example ${WORKDIR}/$P/README)
	einfo ""
	einfo "1. You would have to export a configuration file, follow the examples in the calling of sysnapshot."
	einfo "the default exclude filelist /etc/sysnapshot/sysnspshot.exclude"
	elog "${example}"
	einfo ""
	elog "Please no bugs at bugs.gentoo.org, please contact me"
	elog "ebuilds(at)knasan.de"
}

