#!/usr/bin/env bash
set -eo pipefail
# unRAR 7.1.6 library ported to PS3 (ps3-pkgi)

## Source util functions
source ../utils/utils.sh

## Download the source code.
../download.sh libunrar.tar.gz 

## Unpack the source code.
rm -Rf libunrar
mkdir libunrar
echo "Unpacking libunrar"
extract ../archives/libunrar.tar.gz --strip-components=1 --directory=libunrar
cd libunrar

## Compile and install.
jobs=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
${MAKE:-make} -j"$jobs" install
