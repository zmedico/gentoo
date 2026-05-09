# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LZOKAY_COMMIT="db2df1fcbebc2ed06c10f727f72567d40f06a2be"

inherit cmake

DESCRIPTION="C++ implementation of LZO compression/decompression algorithm "
HOMEPAGE="https://github.com/AxioDL/lzokay"
SRC_URI="https://github.com/AxioDL/lzokay/archive/${LZOKAY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/${PN}-${LZOKAY_COMMIT}

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64"
