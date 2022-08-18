#!/usr/bin/env bash

## Graphviz
## https://graphviz.org

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r graphviz
fi
rm -rf    ${HOME}/.porg/${HOSTNAME}/src/graphviz

## Setup
mkdir -pv ${HOME}/.porg/${HOSTNAME}/src/graphviz
cd        ${HOME}/.porg/${HOSTNAME}/src/graphviz

## Download
export VERSION=2.50.0
export URL=https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/2.50.0/graphviz-2.50.0.tar.gz
wget --no-check-certificate ${URL}
tar -zxvf graphviz-*.tar.gz
cd graphviz-*/

## Install
# export VERSION=$(git tag | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*' | sort | tail -1)
# ./autogen.sh
./configure --prefix=${HOME}/.porg/${HOSTNAME}/usr
make
porg -lp graphviz-${VERSION} "make install"

## Check
porg graphviz
cd ${HOME}

