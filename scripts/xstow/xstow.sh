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
rm -rfv   $STOW_HOME
mkdir -pv $STOW_HOME/{tmp,src,pkg}

## Download
cd $STOW_HOME/tmp
echo "PWD: $(pwd)"
wget --no-check-certificate https://github.com/majorkingleo/xstow/releases/download/1.1.0/xstow-1.1.0.tar.bz2

## Extract
cd $STOW_HOME/src
echo "PWD: $(pwd)"
tar -xvf $STOW_HOME/tmp/xstow-*.tar.bz2

## Build
cd $STOW_HOME/src/xstow-*
echo "PWD: $(pwd)"
./configure --prefix=$STOW_HOME/pkg/xstow-1.1.0/usr
make
make check
make install # prefix=$STOW_HOME/pkg/xstow-1.1.0
make clean

## Install
cd $STOW_HOME/pkg/xstow-*
echo "PWD: $(pwd)"
dirs=$(find . -type d)
for dir in $dirs; do 
	mkdir -pv $STOW_HOME/$dir
done
cd $STOW_HOME/pkg
$STOW_HOME/pkg/xstow-1.1.0/usr/bin/xstow -v xstow-1.1.0/
if [ $? = 0 ]; then
	echo "Success $?"
else
	echo "Failed $?"
fi

## Check
cd $HOME/

