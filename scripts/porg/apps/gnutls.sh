#!/usr/bin/env bash

## gnutls
## http://porg.sourceforge.net/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r gnutls
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/gnutls

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/gnutls
cd        ${HOME}/.porg/$HOSTNAME/src/gnutls

## Download
export APPVER="3.7.2"
wget --no-check-certificate https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-${APPVER}.tar.xz
wget --no-check-certificate https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-${APPVER}.tar.xz.sig
tar -xvf gnutls-*.tar.xz
cd gnutls-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr
make
make check
porg -lD "make install"

## Check
porg gnutls
cd ${HOME}/

