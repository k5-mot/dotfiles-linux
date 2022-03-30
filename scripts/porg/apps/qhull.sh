#!/usr/bin/env bash

## qhull
## http://www.qhull.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r qhull
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/qhull

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/qhull
cd        ${HOME}/.porg/$HOSTNAME/src/qhull

## Download
git clone https://github.com/qhull/qhull.git
cd qhull/

## Install
export VERSION=$(git tag | grep -e 'v[0-9]*\.[0-9]*\.[0-9]*' | sed "s/v//g" | sort | tail -1)
make
export LD_LIBRARY_PATH=$PWD/lib:$LD_LIBRARY_PATH
make test
porg -lp qhull-${VERSION} "make install PREFIX=${HOME}/.porg/$HOSTNAME/usr"

## Check
porg qhull
cd ${HOME}
