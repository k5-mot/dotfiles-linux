#!/usr/bin/env bash

## 
## porg
##
## URL: http://porg.sourceforge.net/
## 

export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r porg
fi
rm -rfv   $PORG_HOME
mkdir -pv $PORG_HOME/{tmp,src,var/log/porg}

## Download
cd        $PORG_HOME/tmp 
wget --no-check-certificate --content-disposition "https://sourceforge.net/projects/porg/files/latest/download"
cd        $PORG_HOME/src
tar -xvf  $PORG_HOME/tmp/porg-*.tar.gz
cd porg-*/

## Install
./configure \
  --prefix=$PORG_HOME/usr \
  --sysconfdir=$PORG_HOME/etc \
  --with-porg-logdir=$PORG_HOME/var/log/porg # \
#   --disable-grop
make
./porg/porg -lD "make install"

## Check
./porg/porg porg
cd $HOME
