#!/usr/bin/env bash

## ncurses
## Dependencies: libevent

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r ncurses
fi
rm -rfv   $PORG_HOME/tmp/ncurses* > /dev/null 2>&1
rm -rfv   $PORG_HOME/src/ncurses  > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/src/ncurses  > /dev/null 2>&1
cd        $PORG_HOME/tmp

## Download
browser_download_url="https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.3.tar.gz"
# browser_download_url="ftp://ftp.invisible-island.net/ncurses/ncurses.tar.gz"
wget --no-check-certificate $browser_download_url

## Extract
cd       $PORG_HOME/src/ncurses
tar -xvf $PORG_HOME/tmp/ncurses-*.tar.gz
cd       $PORG_HOME/src/ncurses/ncurses-*

## Install
./configure \
  --prefix=$PORG_HOME/usr \
  --with-pkg-config-libdir=$PORG_HOME/usr/lib/pkgconfig \
  --with-termlib \
  --enable-pc-files \
  --with-shared
make
porg -lD "make install"

## Check
porg ncurses
cd $HOME
