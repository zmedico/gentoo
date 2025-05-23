# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="PowerShell-Native"
CMAKE_IN_SOURCE_BUILD="ON"

inherit cmake

DESCRIPTION="Functionality missing from .NET Core via system calls"
HOMEPAGE="https://github.com/PowerShell/PowerShell-Native/"

if [[ "${PV}" == *9999* ]] ; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/PowerShell/${MY_PN}.git"
	S="${WORKDIR}/${P}/src/${PN}"
else
	SRC_URI="https://github.com/PowerShell/${MY_PN}/archive/v${PV}.tar.gz
		-> ${P}.tar.gz"
	S="${WORKDIR}/${MY_PN}-${PV}/src/${PN}"

	KEYWORDS="amd64 arm arm64 ~x86"
fi

LICENSE="MIT"
SLOT="0/$(ver_cut 1-2)"

BDEPEND="dev-cpp/gtest"

PATCHES=(
	"${FILESDIR}/${PN}-7.3.2-test-cmake.patch"
	"${FILESDIR}/${PN}-7.4.0-cmake.patch"
	"${FILESDIR}/${PN}-7.4.0-cmake_minimum.patch"
)

src_install() {
	dolib.so "${S}/../powershell-unix/libpsl-native.so"

	einstalldocs
}
