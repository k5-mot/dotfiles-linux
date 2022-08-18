#!/usr/bin/env bash

## libunistring
## http://porg.sourceforge.net/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r libunistring
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/libunistring

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/libunistring
cd        ${HOME}/.porg/$HOSTNAME/src/libunistring

## Download
wget --no-check-certificate https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.gz
wget --no-check-certificate https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.gz.sig
tar -xzvf libunistring-*.tar.gz
cd libunistring-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr
make
porg -lD "make install"

## Check
porg libunistring
cd ${HOME}/

