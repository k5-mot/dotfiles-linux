#!/usr/bin/env bash

## FreeCAD
## https://www.freecadweb.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r freecad
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/freecad

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/freecad
cd        ${HOME}/.porg/$HOSTNAME/src/freecad

## Download
export URL="https://github.com/FreeCAD/FreeCAD/releases/download/0.19.3/FreeCAD_0.19.3-Linux-Conda_glibc2.12-x86_64.AppImage"
wget --no-check-certificate ${URL}
chmod a+x *.AppImage

## Install
porg -lD "ln -sfv $(realpath *.AppImage) ${HOME}/.porg/${HOSTNAME}/usr/bin/freecad"

## Check
porg freecad

