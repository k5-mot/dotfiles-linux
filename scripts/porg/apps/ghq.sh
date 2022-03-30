#!/usr/bin/env bash

## ghq
## https://github.com/x-motemen/ghq

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r ghq
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/ghq

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/ghq
cd        ${HOME}/.porg/$HOSTNAME/src/ghq

## Download
git clone https://github.com/x-motemen/ghq.git
cd        ghq/

## Install
porg -lp ghq "make install"

## Check
porg ghq
cd ${HOME}
