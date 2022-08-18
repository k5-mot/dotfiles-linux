#!/usr/bin/env bash

## libunbound
## http://porg.sourceforge.net/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r unbound
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/libunbound

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/libunbound
cd        ${HOME}/.porg/$HOSTNAME/src/libunbound

## Download
export APPVER="1.13.2"
wget --no-check-certificate https://nlnetlabs.nl/downloads/unbound/unbound-${APPVER}.tar.gz
wget --no-check-certificate https://nlnetlabs.nl/downloads/unbound/unbound-${APPVER}.tar.gz.sha256
tar -xzvf unbound-*.tar.gz
cd unbound-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --with-libevent=${HOME}/.porg/$HOSTNAME/usr
make
porg -lD "make install"

## Check
porg unbound
cd ${HOME}/

