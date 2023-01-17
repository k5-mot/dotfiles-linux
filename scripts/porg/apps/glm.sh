#!/usr/bin/env bash

## GLM
## https://glm.g-truc.net/0.9.9/
## https://github.com/g-truc/glm

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r glm
fi
rm -rfv   $PORG_HOME/src/glm

## Setup
mkdir -pv $PORG_HOME/src/glm
cd        $PORG_HOME/tmp

## Download
cd        $PORG_HOME/src
git clone --verbose https://github.com/g-truc/glm.git
cd        $PORG_HOME/src/glm
mkdir     build
cd        build/

## Install
latest_version=$(git tag | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*' | tail -1)
cmake -DCMAKE_INSTALL_PREFIX=$PORG_HOME/usr -DBUILD_STATIC_LIBS=OFF -DBUILD_SHARED_LIBS=OFF -DGLM_TEST_ENABLE=OFF ..
make
porg -lp glm-$latest_version "make install"

## Check
porg glm
cd $HOME
