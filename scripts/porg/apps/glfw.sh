#!/usr/bin/env bash

## GLFW
## https://www.glfw.org/
## https://github.com/glfw/glfw

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r glfw
fi
rm -rfv   $PORG_HOME/src/glfw

## Setup
mkdir -pv $PORG_HOME/src/glfw
cd        $PORG_HOME/tmp

## Download
cd        $PORG_HOME/src
git clone --verbose https://github.com/glfw/glfw.git
cd        $PORG_HOME/src/glfw

## Install
latest_version=$(git tag | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*' | tail -1)
mkdir -pv build
cd        build/
cmake -DCMAKE_INSTALL_PREFIX="$PORG_HOME/usr" ..
make
porg -lp glfw-$latest_version "make install"

## Check
porg glfw
cd $HOME

