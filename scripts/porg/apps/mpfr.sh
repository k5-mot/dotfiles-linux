#!/usr/bin/env bash

## MPFR
## https://www.mpfr.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r mpfr
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/mpfr

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/mpfr
cd        ${HOME}/.porg/$HOSTNAME/src/mpfr

## Download
wget --no-check-certificate https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.gz
wget --no-check-certificate https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.gz.sig
tar -xvf mpfr-*.tar.gz
cd mpfr-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --with-gmp=${HOME}/.porg/$HOSTNAME/usr
make -s -j4
make -s check
porg -lD "make install"

## Check
porg mpfr
cd ${HOME}
