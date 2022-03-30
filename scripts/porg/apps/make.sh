#!/usr/bin/env bash

## Make
## https://www.gnu.org/software/make/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r make
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/make

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/make
cd        ${HOME}/.porg/$HOSTNAME/src/make

## Download
export VERSION="4.3"
wget http://ftp.gnu.org/gnu/make/make-$VERSION.tar.gz
wget http://ftp.gnu.org/gnu/make/make-$VERSION.tar.gz.sig
tar -zxvf make-*.tar.gz
cd make-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr
make
porg -lD "make install"

## Check
porg make

