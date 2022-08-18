#!/usr/bin/env bash

## GMP
## https://gmplib.org

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r gmp
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/gmp

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/gmp
cd        ${HOME}/.porg/$HOSTNAME/src/gmp

## Download
wget --no-check-certificate https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.bz2
wget --no-check-certificate https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.bz2.sig
tar -xvf gmp-*.tar.bz2
cd gmp-*/

## Install
./configure \
  --prefix=$HOME/.porg/$HOSTNAME/usr \
  --enable-cxx
make
make check
porg -lD "make install"

## Check
porg gmp
cd ${HOME}
