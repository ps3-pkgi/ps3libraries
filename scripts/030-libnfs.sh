#!/bin/sh -x
#
# libnfs by sahlberg
#	ported to PS3 by Bucanero

## Download the source code.
wget --no-check-certificate https://github.com/sahlberg/libnfs/archive/3fd5d8809456503c11364bc49aba9ba9aa90a1af.zip -O libnfs.zip

## Unpack the source code.
rm -Rf libnfs && mkdir libnfs && unzip libnfs.zip && mv libnfs-3fd5d8809456503c11364bc49aba9ba9aa90a1af libnfs && cd libnfs

## Compile and install.
${MAKE:-make} V=1 VERBOSE=1 -f ps3_ppu/Makefile.PS3_PPU install
