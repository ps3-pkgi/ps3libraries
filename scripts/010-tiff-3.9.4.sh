#!/bin/sh -e
# tiff-3.9.4.sh by Jon Limle <jonlimle123@yahoo.com>

## Download the source code.
git clone https://github.com/libsdl-org/libtiff/ -b v3.9.4 --depth=1 tiff-3.9.4
## Download an up-to-date config.guess and config.sub
if [ ! -f config.guess ]; then wget --continue http://git.savannah.gnu.org/cgit/config.git/plain/config.guess; fi
if [ ! -f config.sub ]; then wget --continue http://git.savannah.gnu.org/cgit/config.git/plain/config.sub; fi

## Unpack the source code.
cd tiff-3.9.4

## Replace config.guess and config.sub
cp ../config.guess ../config.sub config/

## Patch the source code.
cat ../../patches/tiff-3.9.4-PPU.patch | patch -p1

## Create the build directory.
mkdir build-ppu && cd build-ppu

## Configure the build.
CFLAGS="-I$PSL1GHT/ppu/include -I$PS3DEV/portlibs/ppu/include" \
LDFLAGS="-L$PSL1GHT/ppu/lib -L$PS3DEV/portlibs/ppu/lib -lrt -llv2" \
PKG_CONFIG_PATH="$PS3DEV/portlibs/ppu/lib/pkgconfig" \
../configure --prefix="$PS3DEV/portlibs/ppu" --host="powerpc64-ps3-elf" --disable-shared

## Compile and install.
${MAKE:-make} && ${MAKE:-make} install
