# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CommitId=daa8bb18327bc5c7d22c69428c25cf5dc64167d3

DESCRIPTION="PocketFFT for C++"
HOMEPAGE="https://github.com/mreineck/pocketfft/"
SRC_URI="https://github.com/mreineck/${PN}/archive/${CommitId}.tar.gz
	-> ${P}.tar.gz"

S="${WORKDIR}"/${PN}-${CommitId}

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	doheader pocketfft_hdronly.h
	default
}
