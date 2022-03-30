#!/usr/bin/env bash

## ISL

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r isl
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/isl

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/isl
cd        ${HOME}/.porg/$HOSTNAME/src/isl

## Download
wget --no-check-certificate https://gcc.gnu.org/pub/gcc/infrastructure/isl-0.18.tar.bz2
tar -xvf isl-*.tar.bz2
cd isl-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --with-gmp-prefix=${HOME}/.porg/$HOSTNAME/usr
make -j4
make check
porg -lD "make install"

## Check
porg isl
cd ${HOME}
