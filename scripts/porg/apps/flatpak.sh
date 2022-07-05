#!/usr/bin/env bash

## flatpak
## https://flatpak.org/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r flatpak
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/flatpak

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/flatpak
cd        ${HOME}/.porg/$HOSTNAME/src/flatpak

## Download
# wget --no-check-certificate https://github.com/flatpak/flatpak/releases/download/1.12.7/flatpak-1.12.7.tar.xz
# tar -xvf flatpak-*.tar.xz
# cd flatpak-*/

# Download
git clone --verbose --recurse-submodules https://github.com/flatpak/flatpak.git
cd flatpak

## Install
./autogen.sh
./configure --prefix=${HOME}/.porg/$HOSTNAME/usr \
make
porg -lp flatpak "make install"

## Check
porg flatpak
cd ${HOME}/
