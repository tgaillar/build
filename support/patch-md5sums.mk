.PHONY: md5sums
md5sums: build/md5sums

.PRECIOUS: build/md5sums
build/md5sums: ${DL_DIR}/webosdoctorp100ewwsprint.jar
	rm -rf build/md5sums
	mkdir -p build
	unzip -p $< resources/webOS.tar | \
	tar -O -x -f - ./nova-cust-image-castle.rootfs.tar.gz | \
	tar -C build -m -z -x -f - ./md5sums
	touch $@

${DL_DIR}/webosdoctorp100ewwsprint.jar :
	mkdir -p ${DL_DIR}
	curl -L -o $@ http://palm.cdnetworks.net/rom/pre_p100eww/webosdoctorp100ewwsprint.jar
