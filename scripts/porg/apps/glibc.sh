#!/usr/bin/env bash

## glibc
## http://www.gnu.org/software/libc/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r glibc
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/glibc

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/glibc
cd        ${HOME}/.porg/$HOSTNAME/src/glibc

## Download
export VERSION=2.35
wget --no-check-certificate http://ftp.gnu.org/pub/gnu/glibc/glibc-$VERSION.tar.gz
wget --no-check-certificate http://ftp.gnu.org/pub/gnu/glibc/glibc-$VERSION.tar.gz.sig
tar -xzvf glibc-*.tar.gz
cd glibc-*/

## Install
mkdir -pv build
cd build
../configure \
MAKE=${HOME}/.porg/$HOSTNAME/usr/bin/make \
CC=${HOME}/.porg/$HOSTNAME/usr/bin/gcc \
  --prefix=${HOME}/.porg/$HOSTNAME/opt/glibc \
  --with-tls \
  --enable-add-ons=nptl \
  --disable-profile \
  --enable-add-ons \
  --with-headers=/usr/include \
  --with-binutils=/usr/bin
make MAKE=${HOME}/.porg/$HOSTNAME/usr/bin/make
porg -lp glibc-${VERSION} "make install MAKE=${HOME}/.porg/$HOSTNAME/usr/bin/make"

## Check
porg glibc
cd ${HOME}
