#!/usr/bin/env bash

## qhull
## http://www.qhull.org/

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r qhull
fi
rm -rfv   $PORG_HOME/src/qhull

## Setup
mkdir -pv $PORG_HOME/src/qhull
cd        $PORG_HOME/src/qhull

## Download
cd        $PORG_HOME/src
git clone --verbose https://github.com/qhull/qhull.git
cd        $PORG_HOME/src/qhull

## Install
latest_version=$(git tag | grep -e 'v[0-9]*\.[0-9]*\.[0-9]*' | sed "s/v//g" | sort | tail -1)
make
export LD_LIBRARY_PATH=$PWD/lib:$LD_LIBRARY_PATH
make test
porg -lp qhull-$latest_version "make install PREFIX=$PORG_HOME/usr"

## Check
porg qhull
cd $HOME

