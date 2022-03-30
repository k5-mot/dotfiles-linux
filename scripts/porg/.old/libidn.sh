#!/usr/bin/env bash

## libidn
cd $HOME
cd $HOME/.porg/src

if (type "porg" > /dev/null 2>&1); then
  porg -r libidn
fi
rm -rf $HOME/.porg/src/libidn
mkdir -p $HOME/.porg/src/libidn
cd $HOME/.porg/src/libidn
export LIBIDN_URL="http://ftp.iij.ad.jp/pub/gnu/libidn/libidn-1.36.tar.gz"
wget $LIBIDN_URL
tar -zxvf libidn-*.tar.gz
cd libidn-*
./configure --prefix=$HOME/.porg/usr
make
porg -lD make install
porg libidn
cd $HOME

