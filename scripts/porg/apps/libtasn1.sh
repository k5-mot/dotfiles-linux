#!/usr/bin/env bash

## libtasn1
## http://porg.sourceforge.net/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r libtasn1
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/libtasn1

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/libtasn1
cd        ${HOME}/.porg/$HOSTNAME/src/libtasn1

## Download
export APPVER="4.18.0"
wget --no-check-certificate https://ftp.gnu.org/gnu/libtasn1/libtasn1-${APPVER}.tar.gz
wget --no-check-certificate https://ftp.gnu.org/gnu/libtasn1/libtasn1-${APPVER}.tar.gz.sig
tar -xzvf libtasn1-*.tar.gz
cd libtasn1-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr
make
porg -lD "make install"

## Check
porg libtasn1
cd ${HOME}/

