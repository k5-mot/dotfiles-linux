#!/usr/bin/env bash

## porg
## URL: http://porg.sourceforge.net/

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
    porg -r porg > /dev/null 2>&1

fi
rm -rfv   $PORG_HOME                        > /dev/null 2>&1
mkdir -pv $PORG_HOME/{tmp,src,var/log/porg} > /dev/null 2>&1

## Download
cd        $PORG_HOME/tmp                    > /dev/null 2>&1
wget --no-check-certificate --content-disposition \
    "https://sourceforge.net/projects/porg/files/latest/download" \
    > /dev/null 2>&1
cd        $PORG_HOME/src                    > /dev/null 2>&1
tar -xvf  $PORG_HOME/tmp/porg-*.tar.gz      > /dev/null 2>&1
cd porg-*/                                  > /dev/null 2>&1

## Install
./configure \
    --prefix=$PORG_HOME/usr \
    --sysconfdir=$PORG_HOME/etc \
    --with-porg-logdir=$PORG_HOME/var/log/porg > /dev/null 2>&1
    #   --disable-grop
make > /dev/null 2>&1
./porg/porg -lD "make install" > /dev/null 2>&1

## Check
./porg/porg porg
cd $HOME > /dev/null 2>&1

