#!/usr/bin/env bash

## 
## porg
##
## URL: http://porg.sourceforge.net/
## 

## Remove
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME
if (type "porg" > /dev/null 2>&1); then
  porg -r porg
fi
rm -rfv   $PORG_HOME
mkdir -pv $PORG_HOME/{tmp,src,var/log/porg}

## Download
cd        $PORG_HOME/tmp
echo "PWD: $(pwd)"
wget --no-check-certificate --content-disposition "https://sourceforge.net/projects/porg/files/latest/download"

cd        $PORG_HOME/src
echo "PWD: $(pwd)"
tar -xvf $PORG_HOME/tmp/porg-*.tar.gz
cd porg-*/
echo "PWD: $(pwd)"

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
