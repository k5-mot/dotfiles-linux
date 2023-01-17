#!/usr/bin/env bash

## FreeGLUT
## http://freeglut.sourceforge.net/

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r freeglut
fi
rm -rfv   $PORG_HOME/src/freeglut

## Setup
mkdir -pv $PORG_HOME/src/freeglut
cd        $PORG_HOME/tmp

## Download
browser_download_url="https://sourceforge.net/projects/freeglut/files/latest/download"
wget --no-check-certificate --content-disposition $browser_download_url
cd        $PORG_HOME/src/freeglut
tar -xvf  $PORG_HOME/tmp/freeglut-*.tar.gz
cd        $PORG_HOME/src/freeglut/freeglut-*

## Install
cmake -DCMAKE_INSTALL_PREFIX="$PORG_HOME/usr/"
make
porg -lD "make prefix=$PORG_HOME/usr install"

## Check
porg freeglut
cd $HOME/

