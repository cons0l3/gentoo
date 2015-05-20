EAPI=5
inherit eutils apache-module git-r3

DESCRIPTION="A program to efficiently render and serve map tiles for www.openstreetmap.org map using Apache and Mapnik."
SRC_URI=""
EGIT_REPO_URI="https://github.com/openstreetmap/mod_tile"
HOMEPAGE="http://wiki.openstreetmap.org/wiki/Mod_tile"


LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

APACHE2_MOD_CONF="60_${PN}"
APACHE2_MOD_DEFINE="TILE"

DEPEND=""
RDEPEND="${DEPEND}"

need_apache2

src_configure() {
    ${S}/autogen.sh || die "autogen.sh failed"
    ${S}/configure || die "configure failed"
}

src_compile() {
    make || die "make failed"
}

src_install () {
    make install 
    make install-mod_tile
    ldconfig
}
