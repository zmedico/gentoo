# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="Cross-platform music production software"
HOMEPAGE="https://lmms.io"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/LMMS/lmms.git"
	inherit git-r3
else
	SRC_URI="https://github.com/LMMS/lmms/releases/download/v${PV/_/-}/${PN}_${PV/_/-}.tar.xz"
	S="${WORKDIR}/${PN}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2 LGPL-2"
SLOT="0"

IUSE="alsa debug fluidsynth jack libgig mp3 ogg portaudio pulseaudio sdl soundio stk test vst"

RESTRICT="!test? ( test )"

COMMON_DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	>=media-libs/libsamplerate-0.1.8
	>=media-libs/libsndfile-1.0.11
	sci-libs/fftw:3.0
	sys-libs/zlib
	x11-libs/fltk:1=
	alsa? ( media-libs/alsa-lib )
	fluidsynth? ( media-sound/fluidsynth )
	jack? ( virtual/jack )
	libgig? ( media-libs/libgig )
	mp3? ( media-sound/lame )
	ogg? (
		media-libs/libogg
		media-libs/libvorbis
	)
	portaudio? ( >=media-libs/portaudio-19_pre )
	pulseaudio? ( media-libs/libpulse )
	sdl? (
		media-libs/libsdl
		>=media-libs/sdl-sound-1.0.1
	)
	soundio? ( media-libs/libsoundio )
	stk? ( media-libs/stk )
	vst? ( virtual/wine )
"
DEPEND="${COMMON_DEPEND}
	dev-qt/qtx11extras:5
	test? ( dev-qt/qttest:5 )
"
BDEPEND="
	dev-qt/linguist-tools:5
"
RDEPEND="${COMMON_DEPEND}
	media-plugins/calf
	media-plugins/caps-plugins
	media-plugins/cmt-plugins
	media-plugins/swh-plugins
	media-plugins/tap-plugins
"

DOCS=( README.md doc/AUTHORS )

PATCHES=(
	"${FILESDIR}/${PN}-9999-no_compress_man.patch" #733284
	"${FILESDIR}/${PN}-9999-plugin-path.patch" #907285
)

src_prepare() {
	cmake_src_prepare

	if use !test; then
		sed -i '/ADD_SUBDIRECTORY(tests)/d' CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DUSE_WERROR=FALSE
		-DWANT_CAPS=FALSE
		-DWANT_TAP=FALSE
		-DWANT_SWH=FALSE
		-DWANT_CMT=FALSE
		-DWANT_CALF=FALSE
		-DWANT_ALSA=$(usex alsa)
		-DWANT_JACK=$(usex jack)
		-DWANT_GIG=$(usex libgig)
		-DWANT_MP3LAME=$(usex mp3)
		-DWANT_OGGVORBIS=$(usex ogg)
		-DWANT_PORTAUDIO=$(usex portaudio)
		-DWANT_PULSEAUDIO=$(usex pulseaudio)
		-DWANT_SDL=$(usex sdl)
		-DWANT_SOUNDIO=$(usex soundio)
		-DWANT_STK=$(usex stk)
		-DWANT_VST=$(usex vst)
		-DWANT_SF2=$(usex fluidsynth)
	)

	cmake_src_configure
}

src_test() {
	# tests are hidden inside a subdir and ctest does not detect them without
	# running inside that subdir
	local BUILD_DIR="${BUILD_DIR}/tests"
	cmake_src_test
}
