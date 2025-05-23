# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib

DESCRIPTION="Abstraction layer for filesystem and archive access"
HOMEPAGE="https://icculus.org/physfs/"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/icculus/physfs.git"
else
	KEYWORDS="amd64 ~arm ~arm64 ~hppa ~loong ppc64 ~riscv x86"
	SRC_URI="https://github.com/icculus/${PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-release-${PV}"
fi

LICENSE="ZLIB"
SLOT="0"
IUSE="7zip doc grp hog iso mvl qpak slb static-libs vdf wad +zip"

BDEPEND="doc? ( app-text/doxygen )"

DOCS=( docs/CHANGELOG.txt docs/CREDITS.txt docs/TODO.txt )

multilib_src_configure() {
	local mycmakeargs=(
		-DPHYSFS_BUILD_SHARED=ON
		-DPHYSFS_BUILD_TEST=OFF
		-DPHYSFS_BUILD_STATIC="$(usex static-libs)"
		-DPHYSFS_ARCHIVE_7Z="$(usex 7zip)"
		-DPHYSFS_ARCHIVE_GRP="$(usex grp)"
		-DPHYSFS_ARCHIVE_HOG="$(usex hog)"
		-DPHYSFS_ARCHIVE_ISO9660="$(usex iso)"
		-DPHYSFS_ARCHIVE_MVL="$(usex mvl)"
		-DPHYSFS_ARCHIVE_SLB="$(usex slb)"
		-DPHYSFS_ARCHIVE_VDF="$(usex vdf)"
		-DPHYSFS_ARCHIVE_WAD="$(usex wad)"
		-DPHYSFS_ARCHIVE_QPAK="$(usex qpak)"
		-DPHYSFS_ARCHIVE_ZIP="$(usex zip)"
	)
	cmake_src_configure
}

multilib_src_compile() {
	cmake_src_compile

	if multilib_is_native_abi && use doc; then
		cmake_src_compile docs
		HTML_DOCS=( "${BUILD_DIR}"/docs/html/. )
	fi
}
