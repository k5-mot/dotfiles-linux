#!/usr/bin/env bash

## 
## XStow
## - Symlink farm manager
## 
## URL:     http://xstow.sourceforge.net/
## Git URL: https://github.com/majorkingleo/xstow/
##

export HOSTNAME=$(hostname -s)
export STOW_HOME=$HOME/.local/xstow/$HOSTNAME

## Setup 
rm -rfv $STOW_HOME
mkdir -pv $STOW_HOME/{src,tmp}
cd $STOW_HOME/tmp
echo "PWD: $(pwd)"

## Download
cd $STOW_HOME/src
echo "PWD: $(pwd)"
git clone --verbose --recursive https://github.com/majorkingleo/xstow.git
# tar -zvf $STOW_HOME/tmp/stow*.tar.gz  

## Install
cd $STOW_HOME/src/xstow*/
echo "PWD: $(pwd)"
./reconfigure.sh
./configure \
  --prefix=$STOW_HOME/bin/xstow
make 
make check
make install
make clean

$STOW_HOME/bin/xstow/bin/xstow $STOW_HOME/bin/xstow

## Check
cd $HOME/

