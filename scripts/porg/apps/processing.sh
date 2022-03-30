#!/usr/bin/env bash

## processing
## https://processing.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r processing
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/processing

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/processing
cd        ${HOME}/.porg/$HOSTNAME/src/processing

## Download
export URL="https://github.com/processing/processing4/releases/download/processing-1282-4.0b7/processing-4.0b7-linux-x64.tgz"
wget --no-check-certificate ${URL}
tar -xzvf processing-*.tgz
cd processing-*/

## Install
porg -lp  processing "ln -s $(realpath processing)      ${HOME}/.porg/$HOSTNAME/usr/bin"
porg -lp+ processing "ln -s $(realpath processing-java) ${HOME}/.porg/$HOSTNAME/usr/bin"

## Check
porg processing
cd ${HOME}/
