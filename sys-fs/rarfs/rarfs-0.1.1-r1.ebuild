# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit python-r1

DESCRIPTION="Fuse module to mount uncompressed RAR archives"
HOMEPAGE="https://sourceforge.net/projects/rarfs/"
SRC_URI="mirror://sourceforge/rarfs/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	sys-fs/fuse"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( README )

src_install() {
	dobin scripts/prarfs
	python_replicate_script "${ED}/usr/bin/prarfs"

	dobin src/rarfs
	einstalldocs
}
