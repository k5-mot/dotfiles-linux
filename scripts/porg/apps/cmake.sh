#!/usr/bin/env bash

## CMake
##

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r cmake
fi
rm -rfv   $PORG_HOME/src/cmake

## Setup
mkdir -pv $PORG_HOME/src/cmake
cd        $PORG_HOME/tmp

## Download
list_download_url="https://cmake.org/files/LatestRelease/"
wget -O   list.html --no-check-certificate $list_download_url
latest_version=$(cat list.html | grep -o "cmake-[0-9]*.[0-9]*.[0-9]*.tar.gz" | uniq | tail -1)
rm -rfv   list.html
browser_download_url="https://cmake.org/files/LatestRelease/$latest_version"
wget --no-check-certificate $browser_download_url

# Extract
cd        $PORG_HOME/src/cmake
tar -xvf  $PORG_HOME/tmp/cmake-*.tar.gz
cd        $PORG_HOME/src/cmake/cmake-*/

## Install
./bootstrap --prefix=$PORG_HOME/usr
make
porg -lD "make install"

## Check
porg cmake
cd $HOME

