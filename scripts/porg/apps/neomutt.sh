#!/usr/bin/env bash

## neomutt
##

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r neomutt
fi
rm -rf    ${HOME}/.porg/${HOSTNAME}/src/neomutt

## Setup
mkdir -pv ${HOME}/.porg/${HOSTNAME}/src/neomutt
cd        ${HOME}/.porg/${HOSTNAME}/src/neomutt

## Download
git clone --verbose https://github.com/neomutt/neomutt.git
cd neomutt

## Install
./configure --prefix=${HOME}/.porg/${HOSTNAME}/usr
make
porg -lp neomutt "make install"

## Check
porg neomutt
cd ${HOME}/

