#!/usr/bin/env bash

## libidn2
cd $HOME
cd $HOME/.porg/src

if (type "porg" > /dev/null 2>&1); then
  porg -r libidn2
fi
rm -rf $HOME/.porg/src/libidn2
mkdir -p $HOME/.porg/src/libidn2
cd $HOME/.porg/src/libidn2
export LIBIDN2_URL="http://ftp.iij.ad.jp/pub/gnu/libidn/libidn2-latest.tar.gz"
wget $LIBIDN2_URL
tar -zxvf libidn2-*.tar.gz
cd libidn2-*
./configure --prefix=$HOME/.porg/usr
make
porg -lD make install
porg libidn2
cd $HOME

