#!/usr/bin/env bash

## ncurses
## Dependencies: libevent

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r ncurses
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/ncurses

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/ncurses
cd        ${HOME}/.porg/$HOSTNAME/src/ncurses

## Download
wget --no-check-certificate ftp://ftp.invisible-island.net/ncurses/ncurses.tar.gz
tar -zxvf ncurses.tar.gz
cd ncurses-*

## Install
./configure \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --with-termlib \
  --enable-pc-files \
  --with-shared \
  --with-pkg-config-libdir=${HOME}/.porg/$HOSTNAME/usr/lib/pkgconfig
make
porg -lD "make install"

## Check
porg ncurses
cd ${HOME}
