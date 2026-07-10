# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: qt-utils.eclass
# @MAINTAINER:
# qt@gentoo.org
# @AUTHOR:
# Davide Pesavento <pesa@gentoo.org>
# @SUPPORTED_EAPIS: 8 9
# @BLURB: Qt related helpers.
# @DESCRIPTION:
# Utility eclass providing query functions for Qt.
#
# This eclass does not set any metadata variables nor export any phase
# functions. It can be inherited safely.

if [[ -z ${_QT_UTILS_ECLASS} ]]; then
_QT_UTILS_ECLASS=1

case ${EAPI} in
	8|9) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

# @FUNCTION: _qt_get_check_func_call
# @INTERNAL
# @DESCRIPTION:
# Checks parameters of public, parent qt_get_* functions for validity.
_qt_get_check_func_call() {
	[[ $# -ne 1 ]] && die "${FUNCNAME[1]}: must be passed exactly one argument"
	case ${1} in
		6) ;;
		*) die "${FUNCNAME[1]}: Qt ${1} is not supported" ;;
	esac
}

# @FUNCTION: _qt_get_archdatadir
# @INTERNAL
# @USAGE: <qt_maj_ver>
# @DESCRIPTION:
# Internal base function to retrieve archdatadir part of path.
_qt_get_archdatadir() {
	echo "/usr/$(get_libdir)/qt${1}"
}

# @FUNCTION: qt_get_archdatadir
# @USAGE: <qt_maj_ver>
# @DESCRIPTION:
# Echoes the base directory beneath which Qt binaries, modules, plugins, ...
# are installed.
qt_get_archdatadir() {
	_qt_get_check_func_call "$@"
	_qt_get_archdatadir "$@"
}

# @FUNCTION: qt_get_bindir
# @USAGE: <qt_maj_ver>
# @DESCRIPTION:
# Echoes the directory where Qt binaries are installed.
qt_get_bindir() {
	_qt_get_check_func_call "$@"
	echo "$(_qt_get_archdatadir "$@")/bin"
}

# @FUNCTION: qt_get_headerdir
# @USAGE: <qt_maj_ver>
# @DESCRIPTION:
# Echoes the directory where Qt headers are installed.
qt_get_headerdir() {
	_qt_get_check_func_call "$@"
	echo "/usr/include/qt${1}"
}

# @FUNCTION: qt_get_libexecdir
# @USAGE: <qt_maj_ver>
# @DESCRIPTION:
# Echoes the directory where Qt libexec bins are installed.
qt_get_libexecdir() {
	_qt_get_check_func_call "$@"
	echo "$(_qt_get_archdatadir "$@")/libexec"
}

# @FUNCTION: qt_get_mkspecsdir
# @USAGE: <qt_maj_ver>
# @DESCRIPTION:
# Echoes the directory where Qt mkspecs are installed.
qt_get_mkspecsdir() {
	_qt_get_check_func_call "$@"
	echo "$(_qt_get_archdatadir "$@")/mkspecs"
}

# @FUNCTION: qt_get_plugindir
# @USAGE: <qt_maj_ver>
# @DESCRIPTION:
# Echoes the directory where Qt plugins are installed.
qt_get_plugindir() {
	_qt_get_check_func_call "$@"
	echo "$(_qt_get_archdatadir "$@")/plugins"
}

# @FUNCTION: qt_get_qmldir
# @USAGE: <qt_maj_ver>
# @DESCRIPTION:
# Echoes the directory where Qt Qml imports are installed.
qt_get_qmldir() {
	_qt_get_check_func_call "$@"
	echo "$(_qt_get_archdatadir "$@")/qml"
}

# @FUNCTION: qt6_get_bindir
# @DESCRIPTION:
# Echoes the directory where Qt6 binaries are installed.
# EPREFIX is already prepended to the returned path.
qt6_get_bindir() {
	echo "${EPREFIX}$(qt_get_bindir 6)"
}

# @FUNCTION: qt6_get_headerdir
# @DESCRIPTION:
# Echoes the directory where Qt6 headers are installed.
qt6_get_headerdir() {
	qt_get_headerdir 6
}

# @FUNCTION: qt6_get_libdir
# @DESCRIPTION:
# Echoes the directory where Qt6 libraries are installed.
qt6_get_libdir() {
	echo "/usr/$(get_libdir)"
}

# @FUNCTION: qt6_get_libexecdir
# @DESCRIPTION:
# Echoes the directory where Qt6 libexec bins are installed.
qt6_get_libexecdir() {
	qt_get_libexecdir 6
}

# @FUNCTION: qt6_get_mkspecsdir
# @DESCRIPTION:
# Echoes the directory where Qt6 mkspecs are installed.
qt6_get_mkspecsdir() {
	qt_get_mkspecsdir 6
}

# @FUNCTION: qt6_get_plugindir
# @DESCRIPTION:
# Echoes the directory where Qt6 plugins are installed.
qt6_get_plugindir() {
	qt_get_plugindir 6
}

fi
