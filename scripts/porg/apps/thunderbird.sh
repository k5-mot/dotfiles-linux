#!/usr/bin/env bash

## Thunderbird
## https://www.thunderbird.net/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r thunderbird
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/thunderbird

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/thunderbird
cd        ${HOME}/.porg/$HOSTNAME/src/thunderbird

## Download
# NOTE: http://ftp.mozilla.org/pub/thunderbird/releases/latest/README.txt
export URL="https://download.mozilla.org/?product=thunderbird-latest&os=linux64&lang=en-US"
wget -O thunderbird.tar.bz2 --no-check-certificate ${URL}
tar -xvf thunderbird.tar.bz2
cd ${HOME}/.porg/$HOSTNAME/src/thunderbird/thunderbird

## Install
export VERSION=$(${HOME}/.porg/$HOSTNAME/src/thunderbird/thunderbird/thunderbird -v | awk '{print $2}')
porg -lp thunderbird-${VERSION} "ln -s $(realpath thunderbird) ${HOME}/.porg/$HOSTNAME/usr/bin"

## Check
porg thunderbird
cd ${HOME}
