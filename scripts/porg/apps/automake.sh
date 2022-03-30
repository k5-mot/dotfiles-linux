#!/usr/bin/env bash

## automake
##

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r automake
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/automake

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/automake
cd        ${HOME}/.porg/$HOSTNAME/src/automake

## Download
export VERSION="1.16"
export URL1="http://ftp.gnu.org/gnu/automake/automake-${VERSION}.tar.gz"
export URL2="http://ftp.gnu.org/gnu/automake/automake-${VERSION}.tar.gz.sig"
wget --no-check-certificate ${URL1}
wget --no-check-certificate ${URL2}
tar -zxvf automake-*.tar.gz
cd automake-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr
make
porg -lp automake-${VERSION} "make install"

## Check
porg automake
cd ${HOME}/

