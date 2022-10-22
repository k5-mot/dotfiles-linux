#!/usr/bin/env bash

## libevent

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r libevent
fi
rm -rfv   $PORG_HOME/tmp/libevent* > /dev/null 2>&1
rm -rfv   $PORG_HOME/src/libevent  > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/src/libevent  > /dev/null 2>&1
cd        $PORG_HOME/tmp

## Download
browser_download_url=$(curl -s https://api.github.com/repos/libevent/libevent/releases/latest | grep "\"browser_download_url\": \"[^\"]*.tar.gz\"" | sed "s/\"browser_download_url\": //g" | sed "s/[\" ]//g")
wget --no-check-certificate $browser_download_url

## Extract
cd        $PORG_HOME/src/libevent
tar -xvf  $PORG_HOME/tmp/libevent-*.tar.gz
cd        $PORG_HOME/src/libevent/libevent-*

## Install
./configure \
    --prefix=$PORG_HOME/usr \
    --disable-shared \
    --disable-libevent-regress \
    LIBS="-static-libgcc "
make
make verify
porg -lD "make install"

## Check
porg libevent
cd $HOME
