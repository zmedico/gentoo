# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_SRC="github.com/dvassallo/s3-benchmark"
EGO_PN=${EGO_SRC}/...
EGIT_COMMIT="e5a8efb1d03e766c5c976cf3dd58e012997db1b3"
EGO_VENDOR=(
	"github.com/aws/aws-sdk-go-v2 c2b476bac53067cebc587747e866881b2e383625"
	"github.com/jmespath/go-jmespath c2b33e8439af944379acbdd9c3a5fe0bc44bd8a5"
	"github.com/schollz/progressbar 0033c1b96c20c4b698d2200719507abe04b3b77a"
	"github.com/mitchellh/colorstring d06e56a500db4d08c33db0b79461e7c9beafca2d"
)
KEYWORDS="~amd64"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Measure Amazon S3's performance from any location."
HOMEPAGE="https://github.com/dvassallo/s3-benchmark"
SRC_URI="https://${EGO_SRC}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"
LICENSE="MIT"
SLOT="0"
IUSE=""
DEPEND=""
RDEPEND=""
S=${WORKDIR}/${P}/src/${EGO_SRC}

src_compile() {
	GOPATH="${WORKDIR}/${P}" GOBIN="${WORKDIR}/${P}/bin" \
		go install -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}" || die
}

src_install() {
	dobin "${WORKDIR}/${P}/bin"/*
	dodoc README.md
}
