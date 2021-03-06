NAME     = jpeg
TITLE    = jpeg
APP_ID   = org.webosinternals.toolchain.${NAME}
SRC_VER  = 6.2
VERSION  = 6.2-1
MAINTAINER = WebOS Internals <support@webos-internals.org>

SRC_TGZ = http://downloads.help.palm.com/opensource/3.0.0/jpegsrc.v6b.tar.gz

.PHONY: package
package: build/.built-${VERSION}

include ../../support/download.mk

.PHONY: stage
stage: build/.staged-${VERSION}

build/.staged-${VERSION}: build/armv7.staged-${VERSION} build/armv6.staged-${VERSION} build/i686.staged-${VERSION}
	touch $@

build/%.staged-${VERSION} : build/%.built-${VERSION}
	mkdir -p ../../staging/$*/usr/include
	cp -rp build/$*/usr/include/* ../../staging/$*/usr/include/
	mkdir -p ../../staging/$*/usr/lib
	cp -rp build/$*/usr/lib/* ../../staging/$*/usr/lib/
	touch $@

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -z -x -f $<
	mv build/jpeg-6b build/src
	${MAKE} SRC_FILE=http://downloads.help.palm.com/opensource/3.0.0/jpegsrc.v6b-patches.tgz \
		LOCAL_FILE=${NAME}-${VERSION}-patches.tgz download
	tar -x -f ${DL_DIR}/${NAME}-${VERSION}-patches.tgz -O \
		debian.patch ldflags.patch paths.patch | patch -d build/src -p1
	touch $@}

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  CC=${CROSS_COMPILE_$*}gcc \
	  ./configure --host=${CONFIGURE_HOST_$*} --disable-static --enable-shared; \
	  ${MAKE} clean all )
	mkdir -p build/$*/usr/include/
	cp -r build/src/*.h build/$*/usr/include/
	mkdir -p build/$*/usr/lib
	install -m 755 build/src/.libs/*.so* build/$*/usr/lib/
	touch $@

clobber::
	rm -rf build
