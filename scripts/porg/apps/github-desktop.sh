#!/usr/bin/env bash

## GitHub Desktop
## https://github.com/shiftkey/desktop

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r github-desktop
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/github-desktop

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/github-desktop
cd        ${HOME}/.porg/$HOSTNAME/src/github-desktop

## Download
export URL=$(curl -s https://api.github.com/repos/shiftkey/desktop/releases/latest | grep "browser_download_url" | grep ".AppImage"| awk '{print $2}' | sed 's/"//g')
wget --no-check-certificate ${URL}
chmod a+x *.AppImage

## Install
porg -lD "ln -sfv $(realpath *.AppImage) ${HOME}/.porg/${HOSTNAME}/usr/bin/github-desktop"

## Check
porg github-desktop

