#!/usr/bin/env bash

## xsel

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r xsel
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/xsel

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/xsel
cd        ${HOME}/.porg/$HOSTNAME/src/xsel

## Download
curl -OL http://www.vergenet.net/~conrad/software/xsel/download/xsel-1.2.0.tar.gz
tar -xzvf xsel-*.tar.gz
cd xsel-*/

## Install
# ./autogen.sh
./configure --prefix=${HOME}/.porg/$HOSTNAME/usr
make
# make check
porg -lD "make install"

## Check
porg xsel
cd ${HOME}
