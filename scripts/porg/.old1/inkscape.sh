#!/usr/bin/env bash

## inkscape
## https://inkscape.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r inkscape
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/inkscape

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/inkscape
cd        ${HOME}/.porg/$HOSTNAME/src/inkscape

## Download
export URL="https://inkscape.org/ja/gallery/item/29256/Inkscape-3bf5ae0-x86_64.AppImage"
wget --no-check-certificate --content-disposition ${URL}
chmod a+x *.AppImage

## Install
porg -lp  inkscape "ln -sfv $(realpath *.AppImage) ${HOME}/.porg/${HOSTNAME}/usr/bin/inkscape"
porg -lp+ inkscape "ln -sfv $(realpath *.AppImage) ${HOME}/.porg/${HOSTNAME}/usr/bin/inkview"

## Check
porg inkscape

