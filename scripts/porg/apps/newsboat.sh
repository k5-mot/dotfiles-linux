#!/usr/bin/env bash

## newsboat
## https://github.com/newsboat/newsboat

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r newsboat
fi
rm -rf    ${HOME}/.porg/${HOSTNAME}/src/newsboat

## Setup
mkdir -pv ${HOME}/.porg/${HOSTNAME}/src/newsboat
cd        ${HOME}/.porg/${HOSTNAME}/src/newsboat

# Download
git clone https://github.com/newsboat/newsboat.git
cd newsboat/

# Install
make
make prefix=${HOME}/.porg/${HOSTNAME}/usr install

# Check package.
porg newsboat
cd ${HOME}/

