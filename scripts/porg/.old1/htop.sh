#!/usr/bin/env bash

## htop
##

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r htop
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/htop

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/htop
cd        ${HOME}/.porg/$HOSTNAME/src/htop

## Download
git clone https://github.com/htop-dev/htop.git
cd htop

## Install
./autogen.sh
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr
make
porg -lp htop "make install"

## Check
porg htop
cd ${HOME}/

