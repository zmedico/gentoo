# Copyright 2019-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

ACCT_USER_ID=546
ACCT_USER_GROUPS=( ${PN} )

acct-user_add_deps
