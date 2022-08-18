#!/usr/bin/env bash

## nettle
## http://porg.sourceforge.net/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r nettle
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/nettle

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/nettle
cd        ${HOME}/.porg/$HOSTNAME/src/nettle

## Download
wget --no-check-certificate https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz
wget --no-check-certificate https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz.sig
tar -xvf nettle-*.tar.gz
cd nettle-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --enable-mini-gmp \
  --enable-shared
make
porg -lD "make install"

## Check
porg nettle
cd ${HOME}/

