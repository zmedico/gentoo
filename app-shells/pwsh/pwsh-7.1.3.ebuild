# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

MY_PN=PowerShell
DESCRIPTION="PowerShell Core is a cross-platform automation and configuration tool/framework"
HOMEPAGE="https://powershell.org/"
KEYWORDS="~amd64"
LICENSE="MIT"
SRC_URI="https://github.com/PowerShell/PowerShell/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
markdig.signed.0.21.1.nupkg
microsoft.applicationinsights.2.15.0.nupkg
microsoft.aspnetcore.app.runtime.linux-x64.5.0.7.nupkg
microsoft.aspnetcore.app.runtime.osx-x64.5.0.7.nupkg
microsoft.aspnetcore.app.runtime.win-x64.5.0.7.nupkg
microsoft.aspnetcore.app.runtime.win-x86.5.0.7.nupkg
microsoft.codeanalysis.analyzers.3.0.0.nupkg
microsoft.codeanalysis.common.3.7.0.nupkg
microsoft.codeanalysis.csharp.3.7.0.nupkg
microsoft.csharp.4.0.1.nupkg
microsoft.csharp.4.3.0.nupkg
microsoft.management.infrastructure.2.0.0.nupkg
microsoft.management.infrastructure.runtime.unix.2.0.0.nupkg
microsoft.management.infrastructure.runtime.win.2.0.0.nupkg
microsoft.netcore.app.host.osx-x64.5.0.7.nupkg
microsoft.netcore.app.host.win-x64.5.0.7.nupkg
microsoft.netcore.app.host.win-x86.5.0.7.nupkg
microsoft.netcore.app.runtime.linux-x64.5.0.7.nupkg
microsoft.netcore.app.runtime.osx-x64.5.0.7.nupkg
microsoft.netcore.app.runtime.win-x64.5.0.7.nupkg
microsoft.netcore.app.runtime.win-x86.5.0.7.nupkg
microsoft.netcore.platforms.1.0.1.nupkg
microsoft.netcore.platforms.1.1.0.nupkg
microsoft.netcore.platforms.2.0.0.nupkg
microsoft.netcore.platforms.2.1.2.nupkg
microsoft.netcore.platforms.3.1.0.nupkg
microsoft.netcore.platforms.5.0.0.nupkg
microsoft.netcore.targets.1.0.1.nupkg
microsoft.netcore.targets.1.1.0.nupkg
microsoft.netcore.windows.apisets.1.0.1.nupkg
microsoft.powershell.archive.1.2.5.nupkg
microsoft.powershell.native.7.1.0.nupkg
microsoft.win32.registry.4.7.0.nupkg
microsoft.win32.registry.5.0.0.nupkg
microsoft.win32.registry.accesscontrol.5.0.0.nupkg
microsoft.win32.systemevents.5.0.0.nupkg
microsoft.windows.compatibility.5.0.0.nupkg
namotion.reflection.1.0.14.nupkg
newtonsoft.json.12.0.3.nupkg
newtonsoft.json.9.0.1.nupkg
njsonschema.10.2.2.nupkg
packagemanagement.1.4.7.nupkg
powershellget.2.2.5.nupkg
psdesiredstateconfiguration.2.0.5.nupkg
psreadline.2.1.0.nupkg
runtime.any.system.collections.4.3.0.nupkg
runtime.any.system.diagnostics.tools.4.3.0.nupkg
runtime.any.system.diagnostics.tracing.4.3.0.nupkg
runtime.any.system.globalization.4.3.0.nupkg
runtime.any.system.io.4.3.0.nupkg
runtime.any.system.reflection.4.3.0.nupkg
runtime.any.system.reflection.extensions.4.3.0.nupkg
runtime.any.system.reflection.primitives.4.3.0.nupkg
runtime.any.system.resources.resourcemanager.4.3.0.nupkg
runtime.any.system.runtime.4.3.0.nupkg
runtime.any.system.runtime.handles.4.3.0.nupkg
runtime.any.system.runtime.interopservices.4.3.0.nupkg
runtime.any.system.text.encoding.4.3.0.nupkg
runtime.any.system.text.encoding.extensions.4.3.0.nupkg
runtime.any.system.threading.tasks.4.3.0.nupkg
runtime.debian.8-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.fedora.23-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.fedora.24-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.linux-arm.runtime.native.system.io.ports.5.0.0-rtm.20519.4.nupkg
runtime.linux-arm64.runtime.native.system.io.ports.5.0.0-rtm.20519.4.nupkg
runtime.linux-x64.runtime.native.system.io.ports.5.0.0-rtm.20519.4.nupkg
runtime.native.system.4.3.0.nupkg
runtime.native.system.data.sqlclient.sni.4.7.0.nupkg
runtime.native.system.io.ports.5.0.0.nupkg
runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.opensuse.13.2-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.opensuse.42.1-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.osx-x64.runtime.native.system.io.ports.5.0.0-rtm.20519.4.nupkg
runtime.osx.10.10-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.rhel.7-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.ubuntu.14.04-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.ubuntu.16.04-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.ubuntu.16.10-x64.runtime.native.system.security.cryptography.openssl.4.3.0.nupkg
runtime.unix.system.diagnostics.debug.4.3.0.nupkg
runtime.unix.system.io.filesystem.4.3.0.nupkg
runtime.unix.system.private.uri.4.3.0.nupkg
runtime.unix.system.runtime.extensions.4.3.0.nupkg
runtime.win-arm64.runtime.native.system.data.sqlclient.sni.4.4.0.nupkg
runtime.win-x64.runtime.native.system.data.sqlclient.sni.4.4.0.nupkg
runtime.win-x86.runtime.native.system.data.sqlclient.sni.4.4.0.nupkg
system.buffers.4.3.0.nupkg
system.codedom.5.0.0.nupkg
system.collections.4.0.11.nupkg
system.collections.4.3.0.nupkg
system.collections.immutable.1.5.0.nupkg
system.componentmodel.composition.5.0.0.nupkg
system.componentmodel.composition.registration.5.0.0.nupkg
system.configuration.configurationmanager.5.0.0.nupkg
system.data.datasetextensions.4.5.0.nupkg
system.data.odbc.5.0.0.nupkg
system.data.oledb.5.0.0.nupkg
system.data.sqlclient.4.8.2.nupkg
system.diagnostics.debug.4.0.11.nupkg
system.diagnostics.debug.4.3.0.nupkg
system.diagnostics.diagnosticsource.4.6.0.nupkg
system.diagnostics.eventlog.5.0.0.nupkg
system.diagnostics.performancecounter.5.0.0.nupkg
system.diagnostics.tools.4.0.1.nupkg
system.diagnostics.tracing.4.3.0.nupkg
system.directoryservices.5.0.0.nupkg
system.directoryservices.accountmanagement.5.0.0.nupkg
system.directoryservices.protocols.5.0.0.nupkg
system.drawing.common.5.0.0.nupkg
system.drawing.common.5.0.2.nupkg
system.dynamic.runtime.4.0.11.nupkg
system.dynamic.runtime.4.3.0.nupkg
system.formats.asn1.5.0.0.nupkg
system.globalization.4.0.11.nupkg
system.globalization.4.3.0.nupkg
system.io.4.1.0.nupkg
system.io.4.3.0.nupkg
system.io.filesystem.4.0.1.nupkg
system.io.filesystem.accesscontrol.5.0.0.nupkg
system.io.filesystem.primitives.4.0.1.nupkg
system.io.packaging.5.0.0.nupkg
system.io.pipes.accesscontrol.5.0.0.nupkg
system.io.ports.5.0.0.nupkg
system.linq.4.1.0.nupkg
system.linq.4.3.0.nupkg
system.linq.expressions.4.1.0.nupkg
system.linq.expressions.4.3.0.nupkg
system.management.5.0.0.nupkg
system.memory.4.5.4.nupkg
system.net.http.winhttphandler.5.0.0.nupkg
system.objectmodel.4.0.12.nupkg
system.objectmodel.4.3.0.nupkg
system.private.servicemodel.4.7.0.nupkg
system.private.uri.4.3.0.nupkg
system.reflection.4.1.0.nupkg
system.reflection.4.3.0.nupkg
system.reflection.context.5.0.0.nupkg
system.reflection.dispatchproxy.4.5.0.nupkg
system.reflection.emit.4.0.1.nupkg
system.reflection.emit.4.3.0.nupkg
system.reflection.emit.4.7.0.nupkg
system.reflection.emit.ilgeneration.4.0.1.nupkg
system.reflection.emit.ilgeneration.4.3.0.nupkg
system.reflection.emit.ilgeneration.4.7.0.nupkg
system.reflection.emit.lightweight.4.0.1.nupkg
system.reflection.emit.lightweight.4.3.0.nupkg
system.reflection.emit.lightweight.4.7.0.nupkg
system.reflection.extensions.4.0.1.nupkg
system.reflection.extensions.4.3.0.nupkg
system.reflection.metadata.1.6.0.nupkg
system.reflection.primitives.4.0.1.nupkg
system.reflection.primitives.4.3.0.nupkg
system.reflection.typeextensions.4.1.0.nupkg
system.reflection.typeextensions.4.3.0.nupkg
system.resources.resourcemanager.4.0.1.nupkg
system.resources.resourcemanager.4.3.0.nupkg
system.runtime.4.1.0.nupkg
system.runtime.4.3.0.nupkg
system.runtime.caching.5.0.0.nupkg
system.runtime.compilerservices.unsafe.4.7.0.nupkg
system.runtime.compilerservices.unsafe.5.0.0.nupkg
system.runtime.extensions.4.1.0.nupkg
system.runtime.extensions.4.3.0.nupkg
system.runtime.handles.4.0.1.nupkg
system.runtime.handles.4.3.0.nupkg
system.runtime.interopservices.4.1.0.nupkg
system.runtime.interopservices.4.3.0.nupkg
system.runtime.serialization.primitives.4.1.1.nupkg
system.security.accesscontrol.4.5.0.nupkg
system.security.accesscontrol.4.7.0.nupkg
system.security.accesscontrol.5.0.0.nupkg
system.security.cryptography.cng.4.5.0.nupkg
system.security.cryptography.cng.5.0.0.nupkg
system.security.cryptography.pkcs.4.5.0.nupkg
system.security.cryptography.pkcs.5.0.0.nupkg
system.security.cryptography.pkcs.5.0.1.nupkg
system.security.cryptography.protecteddata.5.0.0.nupkg
system.security.cryptography.xml.4.5.0.nupkg
system.security.cryptography.xml.5.0.0.nupkg
system.security.permissions.4.5.0.nupkg
system.security.permissions.5.0.0.nupkg
system.security.principal.windows.4.5.0.nupkg
system.security.principal.windows.4.7.0.nupkg
system.security.principal.windows.5.0.0.nupkg
system.servicemodel.duplex.4.7.0.nupkg
system.servicemodel.http.4.7.0.nupkg
system.servicemodel.nettcp.4.7.0.nupkg
system.servicemodel.primitives.4.7.0.nupkg
system.servicemodel.security.4.7.0.nupkg
system.servicemodel.syndication.5.0.0.nupkg
system.serviceprocess.servicecontroller.5.0.0.nupkg
system.text.encoding.4.0.11.nupkg
system.text.encoding.4.3.0.nupkg
system.text.encoding.codepages.4.5.1.nupkg
system.text.encoding.codepages.5.0.0.nupkg
system.text.encoding.extensions.4.0.11.nupkg
system.text.encodings.web.5.0.1.nupkg
system.text.regularexpressions.4.1.0.nupkg
system.threading.4.0.11.nupkg
system.threading.4.3.0.nupkg
system.threading.accesscontrol.5.0.0.nupkg
system.threading.tasks.4.0.11.nupkg
system.threading.tasks.4.3.0.nupkg
system.threading.tasks.extensions.4.0.0.nupkg
system.threading.tasks.extensions.4.5.3.nupkg
system.windows.extensions.5.0.0.nupkg
system.xml.readerwriter.4.0.11.nupkg
system.xml.xdocument.4.0.11.nupkg
threadjob.2.0.3.nupkg
"
SLOT="0"
#RESTRICT+=" network-sandbox"
# TODO: Can we test if some flags were respected?
# Similar issue for Rust: https://bugs.gentoo.org/796887
QA_FLAGS_IGNORED=".*"
QA_PRESTRIPPED=".*"
RDEPEND="
	app-crypt/mit-krb5:=
	dev-util/lttng-ust:=
	dev-libs/openssl:=
	sys-libs/pam:=
	sys-libs/zlib:=
"
DEPEND="
	${RDEPEND}
"
BDEPEND="
	|| ( app-shells/pwsh-bin app-shells/pwsh )
	virtual/dotnet-sdk
"
S=${WORKDIR}/${MY_PN}-${PV}

fake-git-describe() {
	echo "v${PV}-0-ge22c2cf6f9653e10a2a37371d11ac4f18c3fd681"
}

src_unpack() {
	unpack ${P}.tar.gz
	#cd "${S}" || die
	#dotnet nuget add source "${nuget_repo}"
	
}

src_prepare() {
	local dotnet_version pwsh_command nuget_repo=${HOME}/.nuget/packages
	dotnet_version=$(cd "${T}" && dotnet --version) || die
	sed -e 's/\([^#]\)\(Install-Dotnet @DotnetArguments\)/\1#\2/' -i ./build.psm1 || die
	#sed -e 's/\([^#]\)\(Restore-PSPackage -Options\)/\1#\2/' -i ./build.psm1 || die
	sed -e 's|"version": .*|"version": "'${dotnet_version}'"|' -i ./global.json || die
	sed -e "s|<Exec Command='git describe[^']*'|<Exec Command='echo $(fake-git-describe)'|" -i PowerShell.Common.props || die
	default

	cd "$S" || die
	while read -r; do
		dotnet add package "$(realpath ${REPLY})" || die
		#dotnet nuget add "$(realpath ${REPLY})" -Source "$nuget_repo" || die
		#pwsh_command="Install-Package -ProjectName PowerShell $(realpath ${REPLY})"
		#pwsh -NonInteractive -c "$pwsh_command" || die "failed: $pwsh_command"
	done < <(find "${DISTDIR}" -name '*.nupkg')
	#dotnet nuget add source "${nuget_repo}" || die
	#set -x
	#dotnet nuget list source
	#dotnet nuget locals all --list
	#dotnet nuget remove source dotnet5-rtm
	#dotnet nuget remove source dotnet5
	#dotnet nuget remove source nuget.org
	#dotnet nuget list source
	find . -name nuget.config -print0 | xargs -0 sed -e '/<add key=/d' -i || die
	set +x
}

src_compile() {
	einfo Start-PSBootstrap
	pwsh -NonInteractive -c 'Import-Module ./build.psm1 -ArgumentList $true
Start-PSBootstrap
' || die "Start-PSBootstrap failed"

	einfo Start-PSBuild
	pwsh -NonInteractive -c "Import-Module ./build.psm1 -ArgumentList \$true
Start-PSBuild -ReleaseTag v${PV}
" || die "Start-PSBuild  failed"
}

src_test() {
	local failures=0 pwsh_exe=./src/powershell-unix/bin/Debug/net5.0/linux-x64/publish/pwsh

	ebegin "--version"
	[[ $("${pwsh_exe}" --version) == "${MY_PN} ${PV}" ]]
	eend "$?" "fail" || (( failures += 1 ))

	ebegin "hello world"
	[[ $("${pwsh_exe}" -NonInteractive -c "Write-Host 'hello world'") == "hello world" ]]
	eend "$?" "fail" || (( failures += 1 ))

	if (( failures > 0 )); then
		die "${failures} tests failed"
	fi
}

src_install() {
	local dest=usr/$(get_libdir)/pwsh symlink
	dodir "${dest%/*}"

	mv "${S}/src/powershell-unix/bin/Debug/net5.0/linux-x64/publish" "${ED}/${dest}" || die
	fperms 0755 "/${dest}/pwsh"

	dosym "../../${dest}/pwsh" "/usr/bin/pwsh"
}
