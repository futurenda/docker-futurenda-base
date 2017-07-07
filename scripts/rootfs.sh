#!/usr/bin/env bash

set -ex

rm -rf rootfs
rm -rf glibc
rm -rf rootfs.tar.xz

cp -r busybox rootfs

if [ ! -f glibc.pkg.tar.xz ]; then
    wget https://www.archlinux.org/packages/core/x86_64/glibc/download/ -O glibc.pkg.tar.xz
fi
mkdir -p glibc
tar xf glibc.pkg.tar.xz -C glibc

libs=$(ls -I ld-linux-x86-64.so.2 rootfs/lib)

for lib in ${libs[@]}; do
    cp -L glibc/usr/lib/${lib} rootfs/lib/${lib}
done

cp -rf glibc/usr/lib/* rootfs/lib

cp $(which ldd) rootfs/bin

cd rootfs
tar -Jcvf ../rootfs.tar.xz .
cd ..
