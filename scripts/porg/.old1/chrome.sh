#!/usr/bin/env bash

## Google Chrome
## https://www.google.com/chrome/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r google-chrome
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/chrome

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/chrome
cd        ${HOME}/.porg/$HOSTNAME/src/chrome

## Download
export URL="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
wget --no-check-certificate ${URL}

## Install
cd ${HOME}/.porg/$HOSTNAME
porg -lp  google-chrome "rpm2cpio ./src/chrome/google-chrome-stable_current_x86_64.rpm | cpio -idv"
porg -lp+ google-chrome "rm -rf ${HOME}/.porg/$HOSTNAME/usr/bin/google-chrome-stable"
porg -lp+ google-chrome "ln -sv ${HOME}/.porg/$HOSTNAME/opt/google/chrome/google-chrome ${HOME}/.porg/$HOSTNAME/usr/bin/google-chrome-stable"

## Check
porg google-chrome
cd ${HOME}

