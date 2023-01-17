#!/usr/bin/env bash

## GLEW
## http://glew.sourceforge.net/
## https://github.com/nigels-com/glew

set -x
export HOSTNAME=$(hostname -s)
export PORG_HOME=$HOME/.local/porg/$HOSTNAME

## Remove
if (type "porg" > /dev/null 2>&1); then
  porg -r glew
fi
rm -rfv   $PORG_HOME/src/glew

## Setup
mkdir -pv $PORG_HOME/src/glew
cd        $PORG_HOME/tmp

## Download
# browser_download_url="https://sourceforge.net/projects/glew/files/latest/download"
browser_download_url="https://sourceforge.net/projects/glew/files/glew/2.2.0/glew-2.2.0.tgz/download"
wget --no-check-certificate --content-disposition $browser_download_url

## Extract
cd        $PORG_HOME/src/glew
tar -xvf  $PORG_HOME/tmp/glew-*.tgz
cd        $PORG_HOME/src/glew/glew-*

## Install
make GLEW_DEST="$PORG_HOME/usr" extensions
make GLEW_DEST="$PORG_HOME/usr"
porg -lD "make GLEW_DEST=$PORG_HOME/usr install"
make clean

## Check
porg glew
cd $HOME

