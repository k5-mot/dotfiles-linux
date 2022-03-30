#!/usr/bin/env bash

## GLFW
## https://www.glfw.org/
## https://github.com/glfw/glfw

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r glfw
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/glfw

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/glfw
cd        ${HOME}/.porg/$HOSTNAME/src/glfw

## Download
git clone https://github.com/glfw/glfw.git
cd glfw/

## Install
export VERSION=$(git tag | grep -v '[a-zA-Z]' | grep -e '[0-9]*\.[0-9]*\.[0-9]*' | tail -1)
mkdir -pv build
cd        build/
cmake -DCMAKE_INSTALL_PREFIX="${HOME}/.porg/$HOSTNAME/usr" ..
make
porg -lp glfw-${VERSION} "make install"

## Check
porg glfw
cd ${HOME}/

