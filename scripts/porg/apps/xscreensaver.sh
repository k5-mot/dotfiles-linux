#!/usr/bin/env bash

## xscreensaver
# https://www.gnu.org/software/xscreensaver/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r xscreensaver
fi
rm -rf    ${HOME}/.porg/${HOSTNAME}/src/xscreensaver

## Setup
mkdir -pv ${HOME}/.porg/${HOSTNAME}/src/xscreensaver
cd        ${HOME}/.porg/${HOSTNAME}/src/xscreensaver

## Download
git clone --verbose https://github.com/Zygo/xscreensaver.git
cd xscreensaver

## Install
./configure \
  --prefix=${HOME}/.porg/${HOSTNAME}/usr
make
porg -lD "make install"
# make clean

## Check
porg xscreensaver

