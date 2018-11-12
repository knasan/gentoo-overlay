# Copyright 2008-2013 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="Recursive rename tool"
HOMEPAGE="http://github.com/knasan/rrn"
EGIT_REPO_URI="git://github.com/knasan/rrn.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/boost-build dev-libs/boost dev-util/cmake"

RDEPEND=""

src_unpack() {
	git-r3_src_unpack
}

src_compile() {
	cd ${S} || die "Failed to compile"
	mkdir build && cd build
	cmake ../
	emake
}

src_install() {
	cd "${S}/build" || die "Failed to install"
	dobin rrn
}

pkg_postinst() {
	elog "Please no bugs at bugs.gentoo.org, please contact me"
	elog "ebuilds(at)knasan.de"
}

