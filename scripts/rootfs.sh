#!/usr/bin/env bash

set -ex

cd rootfs
tar -Jcvf ../rootfs.tar.xz .
cd ..
