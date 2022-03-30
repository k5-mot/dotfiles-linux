#!/usr/bin/env bash

## CMake
##

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r cmake
fi
rm    -rf ${HOME}/.porg/$HOSTNAME/src/cmake

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/cmake
cd        ${HOME}/.porg/$HOSTNAME/src/cmake

## Download
wget -O list.html --no-check-certificate https://cmake.org/files/LatestRelease/
export PACKAGE=$(cat list.html | grep -o "cmake-[0-9]*.[0-9]*.[0-9]*.tar.gz" | uniq | tail -1)
export URL="https://cmake.org/files/LatestRelease/${PACKAGE}"
rm    -rf list.html
wget --no-check-certificate ${URL}
tar -xvf cmake-*.tar.gz
cd cmake-*/

## Install
./bootstrap --prefix=${HOME}/.porg/$HOSTNAME/usr
make
porg -lD "make install"

## Check
porg cmake
cd ${HOME}

