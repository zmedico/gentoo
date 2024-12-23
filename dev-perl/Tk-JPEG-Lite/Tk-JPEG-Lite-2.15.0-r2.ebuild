# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=SREZIC
DIST_VERSION=2.015
inherit perl-module virtualx

DESCRIPTION="lite JPEG loader for Tk::Photo"

SLOT="0"
KEYWORDS="amd64 ~ppc sparc x86"

RDEPEND="
	media-libs/libjpeg-turbo:=
	>=dev-perl/Tk-800.15.0
"
BDEPEND="
	${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.580.0
	dev-perl/Devel-CheckLib
"

PATCHES=(
	"${FILESDIR}/${P}-Modernize-C.patch"
)

src_test() {
	virtx perl-module_src_test
}
