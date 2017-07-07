#!/usr/bin/env bash

rm -rf rootfs
rm -rf glibc
rm -rf rootfs.tar.xz

mkdir -p rootfs
tar xf busybox/glibc/busybox.tar.xz -C rootfs

wget https://www.archlinux.org/packages/core/x86_64/glibc/download/ -O glibc.pkg.tar.xz
mkdir -p glibc
tar xf glibc.pkg.tar.xz -C glibc
cp glibc/usr/lib/libc-2.25.so rootfs/lib/libc.so.6

cd rootfs
tar -Jcvf ../rootfs.tar.xz .
cd ..
