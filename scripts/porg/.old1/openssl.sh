#!/usr/bin/env bash

## openssl

## Remove
export HOSTNAME=$(hostname -s)
if (type "porg" > /dev/null 2>&1); then
  porg -r openssl
fi
rm -rf    ${HOME}/.porg/$HOSTNAME/src/openssl

## Setup
mkdir -pv ${HOME}/.porg/$HOSTNAME/src/openssl
cd        ${HOME}/.porg/$HOSTNAME/src/openssl

## Download
wget https://www.openssl.org/source/openssl-1.1.1l.tar.gz --no-check-certificate
wget https://www.openssl.org/source/openssl-1.1.1l.tar.gz.sha256 --no-check-certificate
sha256sum -c openssl-1.1.1l.tar.gz.sha256
tar -zxvf openssl-*.tar.gz
cd openssl-*/

## Install
./config \
  --prefix=${HOME}/.porg/$HOSTNAME/usr \
  --openssldir=${HOME}/.porg/$HOSTNAME/usr \
  shared zlib
make
make test
porg -lD "make install"

## Check
porg openssl
cd ${HOME}
