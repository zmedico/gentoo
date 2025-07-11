# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=DAGOLDEN
DIST_VERSION=0.03
inherit perl-module

DESCRIPTION="Portable filename comparison"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
RDEPEND="
	dev-perl/Path-Tiny
"
BDEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.300.0
"
