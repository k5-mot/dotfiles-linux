#!/usr/bin/env bash

## libevent

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r libevent
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/libevent

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/libevent
cd        ${HOME}/.porg/$HOSTNAME/src/libevent

## Download
export LIBEVENT_URL=$(curl -s https://api.github.com/repos/libevent/libevent/releases/latest | grep "\"browser_download_url\": \"[^\"]*.tar.gz\"" | sed "s/\"browser_download_url\": //g" | sed "s/[\" ]//g")
wget --no-check-certificate $LIBEVENT_URL
tar -zxvf libevent-*-stable.tar.gz
cd libevent-*-stable

## Install
./configure --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --with-shared
make
porg -lD "make install"

## Check
porg libevent
cd ${HOME}
