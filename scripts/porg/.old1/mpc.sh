#!/usr/bin/env bash

## MPC
## http://www.multiprecision.org/mpc/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r mpc
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/mpc

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/mpc
cd        ${HOME}/.porg/$HOSTNAME/src/mpc

## Download
wget --no-check-certificate https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz
wget --no-check-certificate https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz.sig
tar -xvf mpc-*.tar.gz
cd mpc-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --with-gmp=${HOME}/.porg/$HOSTNAME/usr \
  --with-mpfr=${HOME}/.porg/$HOSTNAME/usr
make -s -j4
make check -s -j4
porg -lD "make install"

## Check
porg mpc
cd ${HOME}
