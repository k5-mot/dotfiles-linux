#!/usr/bin/env bash

## FreeGLUT
## http://freeglut.sourceforge.net/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r freeglut
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/freeglut

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/freeglut
cd        ${HOME}/.porg/$HOSTNAME/src/freeglut

## Download
export URL="https://sourceforge.net/projects/freeglut/files/latest/download"
wget --no-check-certificate --content-disposition ${URL}
tar -xzvf freeglut-*.tar.gz
cd freeglut-*/

## Install
cmake -DCMAKE_INSTALL_PREFIX="${HOME}/.porg/$HOSTNAME/usr/"
make all
porg -lD "make prefix=${HOME}/.porg/$HOSTNAME/usr install"

## Check
porg freeglut
cd ${HOME}/

