#!/usr/bin/env bash

## libexpat
## https://github.com/libexpat/libexpat/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r libexpat
fi
rm -rf    ${HOME}/.porg/${HOSTNAME}/src/libexpat

## Setup
mkdir -pv ${HOME}/.porg/${HOSTNAME}/src/libexpat
cd        ${HOME}/.porg/${HOSTNAME}/src/libexpat

## Download
git clone https://github.com/libexpat/libexpat/
cd libexpat/expat/

## Install
# export VERSION=$(git tag | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*' | sort | tail -1)
./buildconf.sh
./configure --prefix=${HOME}/.porg/${HOSTNAME}/usr
make
porg -lp libexpat "make install"

## Check
porg libexpat
cd ${HOME}

