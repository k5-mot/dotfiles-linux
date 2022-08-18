#!/usr/bin/env bash

## cURL
## https://curl.se/

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r curl
fi
rm    -rf ${HOME}/.porg/$HOSTNAME/src/curl

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/curl
cd        ${HOME}/.porg/$HOSTNAME/src/curl

## Download
wget --no-check-certificate https://curl.haxx.se/download/curl-7.65.3.tar.gz
tar -xvf curl-*.tar.gz
cd curl-*/

## Install
./configure --prefix=${HOME}/.porg/$HOSTNAME/usr
make
porg -lD "make install"

## Check
porg curl
cd ${HOME}
