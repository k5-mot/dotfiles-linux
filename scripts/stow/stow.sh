#!/usr/bin/env bash

## 
## GNU Stow
## - Symlink farm manager
## 
## Doc URL: https://www.gnu.org/software/stow/
## Git URL: https://git.savannah.gnu.org/git/stow.git

## Remove
export HOSTNAME=$(hostname -s)
export STOW_HOME=$HOME/.local/stow/$HOSTNAME
rm -rfv $STOW_HOME

## Download
mkdir -pv $STOW_HOME/{src,tmp}
cd $STOW_HOME/tmp
echo "PWD: $(pwd)"
# wget --no-check-certificate https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
# wget --no-check-certificate https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz.sig

## Install
cd $STOW_HOME/src
echo "PWD: $(pwd)"
git clone --verbose https://git.savannah.gnu.org/git/stow.git 
# tar -zvf $STOW_HOME/tmp/stow*.tar.gz  
cd stow*/
./configure \
  --prefix=$STOW_HOME/usr 
make 
make install

## Check
cd ${HOME}/
