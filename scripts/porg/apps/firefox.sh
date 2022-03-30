#!/usr/bin/env bash

## Firefox
## https://www.mozilla.org/firefox/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r firefox
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/firefox

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/firefox
cd        ${HOME}/.porg/$HOSTNAME/src/firefox

## Download
# NOTE: http://ftp.mozilla.org/pub/firefox/releases/latest/README.txt
export URL="https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
wget -O firefox.tar.bz2 --no-check-certificate ${URL}
tar -xvf firefox.tar.bz2
cd ${HOME}/.porg/$HOSTNAME/src/firefox/firefox

## Install
export VERSION=$(${HOME}/.porg/$HOSTNAME/src/firefox/firefox/firefox -v | awk '{print $3}')
porg -lp firefox-${VERSION} "ln -s $(realpath firefox) ${HOME}/.porg/$HOSTNAME/usr/bin"

## Check
porg firefox
cd ${HOME}

