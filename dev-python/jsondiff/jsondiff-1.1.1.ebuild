# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Diff JSON and JSON-like structures in Python"
HOMEPAGE="https://github.com/ZoomerAnalytics/jsondiff/ https://pypi.python.org/pypi/jsondiff"
NOSE_RANDOM_VERSION="b9a52c63f8de49a0a1f62d13e463c73d2693f6b9"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	test? (
		https://github.com/ZoomerAnalytics/nose-random/archive/${NOSE_RANDOM_VERSION}.tar.gz ->
		github.com-ZoomerAnalytics-nose-random-${NOSE_RANDOM_VERSION}.tar.gz
	)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	!dev-python/jsonpatch"
DEPEND="${RDEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

python_test() {
	ln -snf "../nose-random-${NOSE_RANDOM_VERSION}/nose_random" . || die
	nosetests -v || die
	rm -f nose_random || die
}
