#!/usr/bin/env bash

## pipes
## https://www.gnu.org/software/pipes/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r pipes
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/pipes

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/pipes
cd        ${HOME}/.porg/$HOSTNAME/src/pipes

## Download
git clone --verbose https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh

## Install
porg -lD "make PREFIX=${HOME}/.porg/${HOSTNAME}/usr install"

## Check
porg pipes

