#!/usr/bin/env bash

## libtool
##

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r libtool
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/libtool

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/libtool
cd        ${HOME}/.porg/$HOSTNAME/src/libtool

## Download
git clone https://github.com/libtool-dev/libtool.git
cd libtool

## Install
./autogen.sh
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr
make
porg -lp libtool "make install"

## Check
porg libtool
cd ${HOME}/

