# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

SRC_URI="https://github.com/just-containers/${PN}/archive/v${PV}.tar.gz ->
${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="an s6-based init system for containers"
HOMEPAGE="https://github.com/just-containers/s6-overlay-preinit"

LICENSE="ISC"
SLOT="0"
IUSE="suid"

DEPEND=""
RDEPEND=""

src_configure() {
	econf --with-sysdeps=/usr/$(get_libdir)/skalibs
}

src_install() {
	default
}
