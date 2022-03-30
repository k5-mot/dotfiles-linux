#!/usr/bin/env bash

## GLEW
## http://glew.sourceforge.net/
## https://github.com/nigels-com/glew

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r glew
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/glew

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/glew
cd        ${HOME}/.porg/$HOSTNAME/src/glew

## Download
git clone https://github.com/nigels-com/glew.git
cd glew/

## Install
export VERSION=$(git tag | sed -e 's/glew-//g' | grep -e '[0-9]*\.[0-9]*\.[0-9]*' | tail -1)
make GLEW_DEST="${HOME}/.porg/$HOSTNAME/usr" extensions
make GLEW_DEST="${HOME}/.porg/$HOSTNAME/usr"
porg -lp  glew-${VERSION} "make GLEW_DEST=${HOME}/.porg/$HOSTNAME/usr install"
make clean

## Check
porg glew
cd ${HOME}/

