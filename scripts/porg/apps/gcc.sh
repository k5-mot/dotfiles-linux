#!/usr/bin/env bash

## GCC
## https://gcc.gnu.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r gcc
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/gcc

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/gcc
cd        ${HOME}/.porg/$HOSTNAME/src/gcc

## Download
export GCC_VERSION=8.5.0
wget --no-check-certificate https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.gz
wget --no-check-certificate https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.gz.sig
tar -xzvf gcc-*.tar.gz
cd gcc-*/

## Install
./contrib/download_prerequisites
mkdir build
cd build
../configure \
  --enable-languages=c,c++ \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --disable-bootstrap \
  --disable-multilib
  --with-gmp=${HOME}/.porg/$HOSTNAME/usr \
  --with-mpc=${HOME}/.porg/$HOSTNAME/usr \
  --with-mpfr=${HOME}/.porg/$HOSTNAME/usr \
  --with-isl=${HOME}/.porg/$HOSTNAME/usr
unset LIBRARY_PATH INCLUDE CPATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH PKG_CONFIG_PATH
INCLUDE=${HOME}/.porg/$HOSTNAME/usr/include \
CPATH=${HOME}/.porg/$HOSTNAME/usr/include \
C_INCLUDE_PATH=${HOME}/.porg/$HOSTNAME/usr/include \
CPLUS_INCLUDE_PATH=${HOME}/.porg/$HOSTNAME/usr/include \
LD_LIBRARY_PATH=${HOME}/.porg/$HOSTNAME/usr/lib \
make
porg -lp gcc-${GCC_VERSION} "make install"

## Check
porg gcc
cd ${HOME}
