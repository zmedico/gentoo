# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# These must be bumped together:
# dev-cpp/edencommon
# dev-cpp/fb303
# dev-cpp/fbthrift
# dev-cpp/fizz
# dev-cpp/folly
# dev-cpp/mvfst
# dev-cpp/wangle
# dev-util/watchman

inherit cmake toolchain-funcs

DESCRIPTION="Shared library for Watchman and Eden projects"
HOMEPAGE="https://github.com/facebookexperimental/edencommon"
SRC_URI="https://github.com/facebookexperimental/edencommon/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="amd64 ~arm64"
IUSE="llvm-libunwind"

RDEPEND="
	dev-cpp/gflags:=
	dev-cpp/glog:=[gflags]
	~dev-cpp/folly-${PV}:=
	~dev-cpp/fb303-${PV}:=
	~dev-cpp/wangle-${PV}:=
	~dev-cpp/fbthrift-${PV}:=
	llvm-libunwind? ( llvm-runtimes/libunwind:= )
	!llvm-libunwind? ( sys-libs/libunwind:= )
"
DEPEND="
	${RDEPEND}
	dev-cpp/gtest
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_DIR="$(get_libdir)/cmake/${PN}"
		-DLIB_INSTALL_DIR="$(get_libdir)"
	)

	cmake_src_configure
}

src_test() {
	CMAKE_SKIP_TESTS=()

	# This test fails on GCC 13.
	# https://github.com/facebookexperimental/edencommon/issues/22
	if tc-is-gcc && ver_test $(gcc-version) -lt 14.0.0; then
		CMAKE_SKIP_TESTS+=(PathFuncs.move_or_copy)
	fi

	cmake_src_test
}
