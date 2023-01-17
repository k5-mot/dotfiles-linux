#!/usr/bin/env bash

## porg
## URL: http://porg.sourceforge.net/

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
    porg -r porg
fi
rm -rfv   $PORG_HOME                        > /dev/null 2>&1

## Setup
mkdir -pv $PORG_HOME/{tmp,src,var/log/porg} > /dev/null 2>&1
mkdir -pv $PORG_HOME/src/porg               > /dev/null 2>&1
cd        $PORG_HOME/tmp

## Download
browser_download_url="https://sourceforge.net/projects/porg/files/latest/download"
wget --no-check-certificate --content-disposition $browser_download_url

## Extract
cd        $PORG_HOME/src/porg
tar -xvf  $PORG_HOME/tmp/porg-*.tar.gz
cd        $PORG_HOME/src/porg/porg-*

## Install
./configure \
    --prefix=$PORG_HOME/usr \
    --sysconfdir=$PORG_HOME/etc \
    --with-porg-logdir=$PORG_HOME/var/log/porg \
    --disable-grop
make
./porg/porg -lD "make install"

## Check
./porg/porg porg
cd $HOME

