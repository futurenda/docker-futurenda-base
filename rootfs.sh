#!/bin/bash

mkdir -p rootfs/tmp
cd rootfs
tar -cvzf ../rootfs.tar.gz .
cd ..
