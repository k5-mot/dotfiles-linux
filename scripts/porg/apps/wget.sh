#!/usr/bin/env bash

## wget
## http://porg.sourceforge.net/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r wget
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/wget

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/wget
cd        ${HOME}/.porg/$HOSTNAME/src/wget

## Download
export APPVER="1.21"
wget --no-check-certificate https://ftp.gnu.org/gnu/wget/wget-${APPVER}.tar.gz
tar -xzvf wget-*.tar.gz
cd wget-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --sysconfdir=${HOME}/.porg/$HOSTNAME/etc \
  --with-ssl=openssl
#  --with-libssl-prefix=${HOME}/.porg/$HOSTNAME/usr/lib
make
porg -lD "make install"

## Check
porg wget
cd ${HOME}/

