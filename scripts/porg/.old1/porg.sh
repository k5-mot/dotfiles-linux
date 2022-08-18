#!/usr/bin/env bash

## porg
## http://porg.sourceforge.net/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r porg
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/porg

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/
mkdir -pv ${HOME}/.porg/$HOSTNAME/usr
mkdir -pv ${HOME}/.porg/$HOSTNAME/usr/bin
mkdir -pv ${HOME}/.porg/$HOSTNAME/usr/lib
mkdir -pv ${HOME}/.porg/$HOSTNAME/usr/share
mkdir -pv ${HOME}/.porg/$HOSTNAME/usr/share/doc
mkdir -pv ${HOME}/.porg/$HOSTNAME/etc
mkdir -pv ${HOME}/.porg/$HOSTNAME/var
mkdir -pv ${HOME}/.porg/$HOSTNAME/var/log
mkdir -pv ${HOME}/.porg/$HOSTNAME/var/log/porg
mkdir -pv ${HOME}/.porg/$HOSTNAME/opt
mkdir -pv ${HOME}/.porg/$HOSTNAME/src
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/porg
cd        ${HOME}/.porg/$HOSTNAME/src/porg/

## Download
wget --no-check-certificate --content-disposition "https://sourceforge.net/projects/porg/files/latest/download"
tar -xzvf porg-*.tar.gz
cd porg-*/

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --sysconfdir=${HOME}/.porg/$HOSTNAME/etc \
  --with-porg-logdir=${HOME}/.porg/$HOSTNAME/var/log/porg \
  --disable-grop
make
./porg/porg -lD "make install"

## Check
./porg/porg porg
cd ${HOME}/
