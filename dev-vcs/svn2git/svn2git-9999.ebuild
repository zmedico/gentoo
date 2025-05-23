# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils
[[ "${PV}" == "9999" ]] && inherit git-r3

DESCRIPTION="Tool for one-time conversion from svn to git"
HOMEPAGE="https://github.com/svn-all-fast-export/svn2git"
if [[ "${PV}" == "9999" ]]; then
	EGIT_SUBMODULES=()
	EGIT_REPO_URI="https://github.com/svn-all-fast-export/svn2git.git"
else
	SRC_URI="https://github.com/svn-all-fast-export/svn2git/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
# KEYWORDS way up

DEPEND="
	dev-qt/qt5compat:6
	dev-qt/qtbase:6
	dev-vcs/subversion"
RDEPEND="${DEPEND}
	dev-vcs/git"

DOCS=( README.md )

src_configure() {
	local qmake_args=(
		APR_INCLUDE=/usr/include/apr-1
		PREFIX=/usr
		SVN_INCLUDE=/usr/include/subversion-1
	)
	eqmake6 "${qmake_args[@]}" fast-export2.pro
}

src_install() {
	einstalldocs
	insinto /usr/share/${PN}/samples
	doins samples/*.rules
	dobin svn-all-fast-export
	dosym svn-all-fast-export /usr/bin/svn2git
}
