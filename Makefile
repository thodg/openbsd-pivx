# $OpenBSD: $

COMMENT =	PIVX

VER =		3.1.1
DISTNAME =	pivx-${VER}
CATEGORIES =	coin
MASTER_SITES =	https://github.com/PIVX-Project/PIVX/releases/download/v${VER}/
EXTRACT_SUFX =	.tar.gz

HOMEPAGE =	https://github.com/PIVX-Project/PIVX/

MAINTAINER =	Thomas de Grivel <thoxdg@gmail.com>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += ${COMPILER_LIBCXX} event m bitcoinconsensus secp256k1 univalue
LIB_DEPENDS = coin/bitcoin

COMPILER = ports-gcc

CONFIGURE_STYLE =	gnu

CONFIGURE_ARGS =	--with-gui=no \
			--with-system-univalue \
			--with-system-secp256k1 \
			--with-unsupported-ssl \
			CXXFLAGS="-O2 -pipe -I/usr/local/include/db4.8 -I/usr/local/include" \
			LIBS="-L/usr/local/lib/db4.8 -ldb_cxx-4.8" \
			CC=egcc CXX=eg++

MAKE_ENV =		AUTOCONF_VERSION=2.69 \
			AUTOMAKE_VERSION=1.15

USE_GMAKE = Yes

.include <bsd.port.mk>
