#!/usr/bin/env bash

## xclip

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r xclip
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/xclip

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/xclip
cd        ${HOME}/.porg/$HOSTNAME/src/xclip

## Download
wget --no-check-certificate --content-disposition https://sourceforge.net/projects/xclip/files/latest/download
tar -xzvf xclip-*.tar.gz
cd xclip-*/

## Install
autoconf
./configure --prefix=${HOME}/.porg/$HOSTNAME/usr
make
# make check
porg -lD "make install && make install.man"

## Check
porg xclip
cd ${HOME}
