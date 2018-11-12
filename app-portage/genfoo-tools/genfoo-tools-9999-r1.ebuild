# Copyright 2008-2013 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="portage utils written in ruby"
HOMEPAGE="https://blog.knasan.com"
EGIT_REPO_URI="git://github.com/knasan/genfoo-tools.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-lang/ruby"

src_unpack() {
	git-r3_src_unpack
}

src_install() {
	mkdir -p ${D}/usr/bin || die
	mkdir -p ${D}/usr/lib || die
	cp ${WORKDIR}/$P/bin/portkeyman ${D}/usr/bin/portkeyman || die
	cp ${WORKDIR}/$P/bin/portuseman ${D}/usr/bin/portuseman || die
	cp ${WORKDIR}/$P/lib/genfooutils.rb ${D}/usr/lib/genfooutils.rb || die
}

pkg_postinst() {
	elog "Please no bugs at bugs.gentoo.org, please contact me"
	elog "ebuilds(at)knasan.de"
}
